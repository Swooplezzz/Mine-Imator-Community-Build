#!/usr/bin/env python3
"""
Mine-Imator Format Integration
Bridge between native Mine-Imator formats and Python tools

Supported formats:
- .miproject: Project files
- .mimodel: Model files  
- .miframes: Frame/animation data
- .midata: Raw data (textures, materials, etc.)
- .mipy: Python extension packages (NEW!)
"""

import json
import xml.etree.ElementTree as ET
from pathlib import Path
from dataclasses import dataclass
from typing import Optional, Dict, Any, List
from abc import ABC, abstractmethod


class MineImatorFormat(ABC):
    """Abstract base for Mine-Imator file format handlers"""
    
    @abstractmethod
    def load(self, path: str) -> bool:
        pass
    
    @abstractmethod
    def save(self, path: str) -> bool:
        pass
    
    @abstractmethod
    def to_dict(self) -> Dict[str, Any]:
        pass


class MIProjectHandler(MineImatorFormat):
    """Handler for .miproject files (XML-based)"""
    
    def __init__(self):
        self.name: str = ""
        self.version: str = "1.0.0"
        self.metadata: Dict[str, Any] = {}
        self.models: List[str] = []
        self.animations: Dict[str, Any] = {}
    
    def load(self, path: str) -> bool:
        """Load .miproject file"""
        try:
            tree = ET.parse(path)
            root = tree.getroot()
            
            self.name = root.get('name', 'Untitled')
            self.version = root.get('version', '1.0.0')
            
            # Parse metadata
            meta_elem = root.find('metadata')
            if meta_elem is not None:
                self.metadata = dict(meta_elem.attrib)
            
            # Parse models
            for model in root.findall('.//model'):
                self.models.append(model.get('id'))
            
            # Parse animations
            anim_elem = root.find('animation')
            if anim_elem is not None:
                self.animations = dict(anim_elem.attrib)
            
            return True
        except Exception as e:
            print(f"Error loading .miproject: {e}")
            return False
    
    def save(self, path: str) -> bool:
        """Save .miproject file"""
        try:
            root = ET.Element('project')
            root.set('name', self.name)
            root.set('version', self.version)
            
            # Save metadata
            if self.metadata:
                meta = ET.SubElement(root, 'metadata')
                for key, value in self.metadata.items():
                    meta.set(key, str(value))
            
            # Save animation data
            if self.animations:
                anim = ET.SubElement(root, 'animation')
                for key, value in self.animations.items():
                    anim.set(key, str(value))
            
            tree = ET.ElementTree(root)
            tree.write(path, encoding='utf-8', xml_declaration=True)
            return True
        except Exception as e:
            print(f"Error saving .miproject: {e}")
            return False
    
    def to_dict(self) -> Dict[str, Any]:
        return {
            'name': self.name,
            'version': self.version,
            'metadata': self.metadata,
            'models': self.models,
            'animations': self.animations
        }


class MIDataHandler(MineImatorFormat):
    """Handler for .midata files (JSON-based)"""
    
    def __init__(self):
        self.data: Dict[str, Any] = {}
        self.type: str = "generic"
    
    def load(self, path: str) -> bool:
        """Load .midata file"""
        try:
            with open(path, 'r') as f:
                content = json.load(f)
                self.data = content.get('data', {})
                self.type = content.get('type', 'generic')
            return True
        except Exception as e:
            print(f"Error loading .midata: {e}")
            return False
    
    def save(self, path: str) -> bool:
        """Save .midata file"""
        try:
            content = {
                'type': self.type,
                'data': self.data,
                'version': '1.0.0'
            }
            with open(path, 'w') as f:
                json.dump(content, f, indent=2)
            return True
        except Exception as e:
            print(f"Error saving .midata: {e}")
            return False
    
    def to_dict(self) -> Dict[str, Any]:
        return {'type': self.type, 'data': self.data}


class FormatDetector:
    """Detect and handle Mine-Imator file formats"""
    
    FORMATS = {
        '.miproject': MIProjectHandler,
        '.mimodel': MIDataHandler,
        '.miframes': MIDataHandler,
        '.midata': MIDataHandler,
    }
    
    @staticmethod
    def detect(path: str) -> Optional[str]:
        """Detect file format"""
        ext = Path(path).suffix.lower()
        return ext if ext in FormatDetector.FORMATS else None
    
    @staticmethod
    def load(path: str) -> Optional[MineImatorFormat]:
        """Load file based on detected format"""
        ext = FormatDetector.detect(path)
        if not ext:
            print(f"Unknown format: {ext}")
            return None
        
        handler_class = FormatDetector.FORMATS[ext]
        handler = handler_class()
        
        if handler.load(path):
            return handler
        return None
    
    @staticmethod
    def save(handler: MineImatorFormat, path: str) -> bool:
        """Save file with appropriate handler"""
        return handler.save(path)


class MIPYToMineImatorBridge:
    """Bridge .mipy extensions to native Mine-Imator formats"""
    
    def __init__(self):
        self.extensions: Dict[str, Any] = {}
    
    def register_extension(self, name: str, extension: Any):
        """Register .mipy extension to work with native formats"""
        self.extensions[name] = extension
    
    def export_project_to_mipy(self, project_path: str) -> Optional[bytes]:
        """Convert .miproject to .mipy compatible format"""
        project = MIProjectHandler()
        if not project.load(project_path):
            return None
        
        # Export as JSON for .mipy embedding
        json_data = json.dumps(project.to_dict(), indent=2)
        return json_data.encode('utf-8')
    
    def import_mipy_to_project(self, mipy_data: Dict[str, Any], output_path: str) -> bool:
        """Create .miproject from .mipy data"""
        project = MIProjectHandler()
        project.name = mipy_data.get('name', 'Imported')
        project.metadata = mipy_data.get('metadata', {})
        project.animations = mipy_data.get('animations', {})
        project.models = mipy_data.get('models', [])
        
        return project.save(output_path)


class FormatConverter:
    """Convert between Mine-Imator formats and Python-friendly formats"""
    
    @staticmethod
    def miproject_to_json(miproject_path: str) -> Dict[str, Any]:
        """Convert .miproject to JSON dict"""
        handler = MIProjectHandler()
        if handler.load(miproject_path):
            return handler.to_dict()
        return {}
    
    @staticmethod
    def json_to_miproject(data: Dict[str, Any], output_path: str) -> bool:
        """Convert JSON dict to .miproject"""
        handler = MIProjectHandler()
        handler.name = data.get('name', 'Project')
        handler.version = data.get('version', '1.0.0')
        handler.metadata = data.get('metadata', {})
        handler.models = data.get('models', [])
        handler.animations = data.get('animations', {})
        
        return handler.save(output_path)
    
    @staticmethod
    def export_all_formats(project_path: str, output_dir: str) -> List[str]:
        """Export project to all supported formats"""
        exported = []
        
        # Load original
        handler = FormatDetector.load(project_path)
        if not handler:
            return exported
        
        # Export as JSON
        json_path = Path(output_dir) / "export.json"
        with open(json_path, 'w') as f:
            json.dump(handler.to_dict(), f, indent=2)
        exported.append(str(json_path))
        
        # Export back to original format
        original_ext = Path(project_path).suffix
        original_path = Path(output_dir) / f"export{original_ext}"
        if handler.save(str(original_path)):
            exported.append(str(original_path))
        
        return exported


if __name__ == "__main__":
    # Example usage
    converter = FormatConverter()
    
    # Load a project
    # data = converter.miproject_to_json("my_project.miproject")
    # print(data)
    
    # Save as JSON
    # converter.json_to_miproject(data, "exported.miproject")
    
    pass
