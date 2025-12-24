#!/usr/bin/env python3
"""
Mine-Imator Python Extension Format (.mipy)

Format Specification:
- Binary format for native Python extensions in Mine-Imator
- Compatible with .miproject, .mimodel, .miframes, .midata formats
- Allows packaging Python code with metadata, dependencies, and assets

Structure:
  [Header]
  [Metadata]
  [Dependencies]
  [Code]
  [Assets]

File extension: .mipy
MIME type: application/x-mine-imator-python
"""

import json
import zipfile
import io
from pathlib import Path
from dataclasses import dataclass, asdict
from typing import Dict, List, Optional, Any
from enum import Enum


class MIPYVersion(Enum):
    """Supported .mipy format versions"""
    V1_0 = "1.0"
    V1_1 = "1.1"
    CURRENT = "1.1"


@dataclass
class MIPYMetadata:
    """Metadata for .mipy extension"""
    name: str
    version: str
    author: str
    description: str
    license: str = "MIT"
    homepage: Optional[str] = None
    repository: Optional[str] = None
    keywords: List[str] = None
    min_mine_imator_version: str = "1.0.0"
    
    def __post_init__(self):
        if self.keywords is None:
            self.keywords = []


@dataclass
class MIPYDependency:
    """Python dependency specification"""
    name: str
    version: str = "*"
    optional: bool = False


class MIPYBuilder:
    """Builder for creating .mipy extension packages"""
    
    def __init__(self, metadata: MIPYMetadata):
        self.metadata = metadata
        self.dependencies: List[MIPYDependency] = []
        self.files: Dict[str, bytes] = {}
        self.main_script: Optional[str] = None
    
    def add_dependency(self, name: str, version: str = "*", optional: bool = False):
        """Add Python dependency"""
        dep = MIPYDependency(name, version, optional)
        self.dependencies.append(dep)
        return self
    
    def add_file(self, path: str, content: bytes):
        """Add file to package"""
        self.files[path] = content
        return self
    
    def add_script(self, script_path: str, is_main: bool = False):
        """Add Python script file"""
        with open(script_path, 'rb') as f:
            content = f.read()
        
        filename = Path(script_path).name
        self.add_file(f"scripts/{filename}", content)
        
        if is_main:
            self.main_script = f"scripts/{filename}"
        
        return self
    
    def build(self, output_path: str) -> str:
        """Build .mipy package and save to file"""
        with zipfile.ZipFile(output_path, 'w', zipfile.ZIP_DEFLATED) as zf:
            # Write metadata
            metadata_json = json.dumps(asdict(self.metadata), indent=2)
            zf.writestr('mipy.json', metadata_json)
            
            # Write format version
            zf.writestr('VERSION', MIPYVersion.CURRENT.value)
            
            # Write dependencies
            if self.dependencies:
                deps_json = json.dumps(
                    [asdict(d) for d in self.dependencies],
                    indent=2
                )
                zf.writestr('requirements.json', deps_json)
            
            # Write main script reference
            if self.main_script:
                zf.writestr('MAIN', self.main_script)
            
            # Write all files
            for path, content in self.files.items():
                zf.writestr(path, content)
        
        return output_path


class MIPYLoader:
    """Loader for .mipy extension packages"""
    
    def __init__(self, mipy_path: str):
        self.mipy_path = Path(mipy_path)
        self.metadata: Optional[MIPYMetadata] = None
        self.dependencies: List[MIPYDependency] = []
        self.files: Dict[str, bytes] = {}
        self.main_script: Optional[str] = None
        self.version: str = "1.0"
    
    def load(self) -> bool:
        """Load and parse .mipy file"""
        try:
            with zipfile.ZipFile(self.mipy_path, 'r') as zf:
                # Read version
                self.version = zf.read('VERSION').decode('utf-8').strip()
                
                # Read metadata
                metadata_json = zf.read('mipy.json').decode('utf-8')
                metadata_dict = json.loads(metadata_json)
                self.metadata = MIPYMetadata(**metadata_dict)
                
                # Read dependencies if exist
                try:
                    deps_json = zf.read('requirements.json').decode('utf-8')
                    deps_list = json.loads(deps_json)
                    self.dependencies = [MIPYDependency(**d) for d in deps_list]
                except KeyError:
                    pass
                
                # Read main script reference
                try:
                    self.main_script = zf.read('MAIN').decode('utf-8').strip()
                except KeyError:
                    pass
                
                # Load all files
                for filename in zf.namelist():
                    if filename not in ['mipy.json', 'VERSION', 'requirements.json', 'MAIN']:
                        self.files[filename] = zf.read(filename)
            
            return True
        except Exception as e:
            print(f"Error loading .mipy file: {e}")
            return False
    
    def get_metadata(self) -> Optional[MIPYMetadata]:
        """Get extension metadata"""
        return self.metadata
    
    def get_main_script(self) -> Optional[bytes]:
        """Get main script content"""
        if self.main_script and self.main_script in self.files:
            return self.files[self.main_script]
        return None
    
    def get_file(self, path: str) -> Optional[bytes]:
        """Get specific file from package"""
        return self.files.get(path)
    
    def list_files(self) -> List[str]:
        """List all files in package"""
        return list(self.files.keys())
    
    def execute(self, app_context=None) -> bool:
        """Execute extension in Mine-Imator context"""
        script_content = self.get_main_script()
        if not script_content:
            print("No main script found in .mipy package")
            return False
        
        try:
            code = script_content.decode('utf-8')
            exec_globals = {
                'app': app_context,
                '__name__': self.metadata.name if self.metadata else '__main__'
            }
            exec(code, exec_globals)
            return True
        except Exception as e:
            print(f"Error executing .mipy script: {e}")
            return False


class MIPYRegistry:
    """Registry for installed .mipy extensions"""
    
    def __init__(self, registry_path: str = "~/.mine-imator/extensions"):
        self.registry_path = Path(registry_path).expanduser()
        self.registry_path.mkdir(parents=True, exist_ok=True)
        self.extensions: Dict[str, MIPYLoader] = {}
    
    def install(self, mipy_path: str) -> bool:
        """Install .mipy extension"""
        loader = MIPYLoader(mipy_path)
        if not loader.load():
            return False
        
        ext_name = loader.metadata.name if loader.metadata else "unknown"
        ext_path = self.registry_path / f"{ext_name}.mipy"
        
        # Copy file to registry
        import shutil
        shutil.copy(mipy_path, ext_path)
        
        self.extensions[ext_name] = loader
        print(f"Installed extension: {ext_name}")
        return True
    
    def load_all(self) -> List[str]:
        """Load all installed extensions"""
        loaded = []
        for mipy_file in self.registry_path.glob("*.mipy"):
            loader = MIPYLoader(str(mipy_file))
            if loader.load():
                ext_name = loader.metadata.name if loader.metadata else mipy_file.stem
                self.extensions[ext_name] = loader
                loaded.append(ext_name)
        return loaded
    
    def get_extension(self, name: str) -> Optional[MIPYLoader]:
        """Get installed extension by name"""
        return self.extensions.get(name)
    
    def list_extensions(self) -> List[Dict[str, Any]]:
        """List all installed extensions"""
        result = []
        for name, loader in self.extensions.items():
            if loader.metadata:
                result.append({
                    'name': loader.metadata.name,
                    'version': loader.metadata.version,
                    'description': loader.metadata.description,
                    'author': loader.metadata.author
                })
        return result


# Example usage
if __name__ == "__main__":
    # Create extension
    metadata = MIPYMetadata(
        name="animation_helper",
        version="1.0.0",
        author="Mine-Imator Community",
        description="Helper functions for animation workflow"
    )
    
    builder = MIPYBuilder(metadata)
    builder.add_dependency("numpy", ">=1.20.0")
    
    # Add sample script
    sample_script = b"""# Animation Helper Script
print(f'Loaded {app.current_project.name}')
"""
    builder.add_file("scripts/helper.py", sample_script, is_main=True)
    
    # Build package
    # output = builder.build("animation_helper.mipy")
    # print(f"Built: {output}")
