#!/usr/bin/env python3
"""
Mine-Imator Scripting API
Python console and scripting interface for Mine-Imator (similar to Blender's Python API)

Example usage:
    from mine_imator import app, bpy
    
    # Access current project
    project = app.current_project
    
    # Create animation keyframe
    project.animation.add_keyframe(frame=10, value=90)
    
    # Export to multiple formats
    project.export(format='png', quality='high')
    project.export(format='mp4', fps=24)
    
    # Query all models
    for model in project.models:
        print(f"{model.name} at {model.position}")
"""

from typing import Any, Dict, List, Tuple, Optional
from dataclasses import dataclass
from enum import Enum


class ExportFormat(Enum):
    """Supported export formats"""
    PNG = "png"
    MP4 = "mp4"
    WEBM = "webm"
    GIF = "gif"
    MP3 = "mp3"
    JSON = "json"
    GML = "gml"


@dataclass
class Vector3:
    """3D vector (x, y, z)"""
    x: float
    y: float
    z: float
    
    def __add__(self, other):
        return Vector3(self.x + other.x, self.y + other.y, self.z + other.z)
    
    def __mul__(self, scalar):
        return Vector3(self.x * scalar, self.y * scalar, self.z * scalar)


class Keyframe:
    """Animation keyframe"""
    def __init__(self, frame: int, value: Any):
        self.frame = frame
        self.value = value


class Animation:
    """Animation timeline"""
    def __init__(self, name: str):
        self.name = name
        self.keyframes: List[Keyframe] = []
        self.fps = 24
        self.duration = 100
    
    def add_keyframe(self, frame: int, value: Any):
        """Add keyframe at specific frame"""
        kf = Keyframe(frame, value)
        self.keyframes.append(kf)
        self.keyframes.sort(key=lambda k: k.frame)
        return kf
    
    def remove_keyframe(self, frame: int):
        """Remove keyframe at specific frame"""
        self.keyframes = [kf for kf in self.keyframes if kf.frame != frame]
    
    def get_keyframe(self, frame: int) -> Optional[Keyframe]:
        """Get keyframe at specific frame"""
        for kf in self.keyframes:
            if kf.frame == frame:
                return kf
        return None
    
    def set_fps(self, fps: int):
        """Set animation FPS"""
        self.fps = fps
    
    def set_duration(self, frames: int):
        """Set total animation duration in frames"""
        self.duration = frames


class Model:
    """3D model in project"""
    def __init__(self, name: str):
        self.name = name
        self.position = Vector3(0, 0, 0)
        self.rotation = Vector3(0, 0, 0)
        self.scale = Vector3(1, 1, 1)
        self.visible = True
        self.animations: Dict[str, Animation] = {}
    
    def animate(self, property_name: str, keyframes: List[Tuple[int, Any]]):
        """Create animation for property"""
        anim = Animation(property_name)
        for frame, value in keyframes:
            anim.add_keyframe(frame, value)
        self.animations[property_name] = anim
        return anim
    
    def move(self, x: float, y: float, z: float):
        """Move model to position"""
        self.position = Vector3(x, y, z)
    
    def rotate(self, x: float, y: float, z: float):
        """Rotate model (degrees)"""
        self.rotation = Vector3(x, y, z)
    
    def hide(self):
        """Hide model"""
        self.visible = False
    
    def show(self):
        """Show model"""
        self.visible = True


class Project:
    """Mine-Imator project"""
    def __init__(self, name: str):
        self.name = name
        self.models: List[Model] = []
        self.animation = Animation("main")
        self.width = 1920
        self.height = 1080
        self.background_color = (0, 0, 0)
    
    def add_model(self, name: str) -> Model:
        """Add model to project"""
        model = Model(name)
        self.models.append(model)
        return model
    
    def get_model(self, name: str) -> Optional[Model]:
        """Get model by name"""
        for model in self.models:
            if model.name == name:
                return model
        return None
    
    def remove_model(self, name: str):
        """Remove model from project"""
        self.models = [m for m in self.models if m.name != name]
    
    def set_resolution(self, width: int, height: int):
        """Set output resolution"""
        self.width = width
        self.height = height
    
    def export(self, format: ExportFormat, output_path: str = None, **kwargs) -> str:
        """Export project to file"""
        quality = kwargs.get('quality', 'medium')
        fps = kwargs.get('fps', self.animation.fps)
        
        export_info = {
            'format': format.value,
            'quality': quality,
            'fps': fps,
            'resolution': f"{self.width}x{self.height}",
            'models': len(self.models),
            'keyframes': len(self.animation.keyframes)
        }
        
        return f"Exported to {output_path} with {export_info}"
    
    def render(self) -> bool:
        """Render project to frames"""
        print(f"Rendering {self.name}...")
        print(f"Resolution: {self.width}x{self.height}")
        print(f"Models: {len(self.models)}")
        print(f"Duration: {self.animation.duration} frames @ {self.animation.fps} FPS")
        return True


class MineImatorApp:
    """Main application context"""
    def __init__(self):
        self.projects: List[Project] = []
        self.current_project: Optional[Project] = None
        self.version = "1.0.0"
    
    def new_project(self, name: str) -> Project:
        """Create new project"""
        project = Project(name)
        self.projects.append(project)
        self.current_project = project
        return project
    
    def open_project(self, path: str) -> Project:
        """Open existing project"""
        project = Project(path)
        self.projects.append(project)
        self.current_project = project
        return project
    
    def close_project(self, project: Project = None):
        """Close project"""
        proj = project or self.current_project
        if proj in self.projects:
            self.projects.remove(proj)
            if self.current_project == proj:
                self.current_project = self.projects[0] if self.projects else None
    
    def execute_script(self, script_path: str) -> bool:
        """Execute Python script in API context"""
        try:
            with open(script_path, 'r') as f:
                code = f.read()
            exec(code, {'app': self, 'Project': Project, 'Model': Model})
            return True
        except Exception as e:
            print(f"Script error: {e}")
            return False


# Global app instance
app = MineImatorApp()


# Example usage (for testing)
if __name__ == "__main__":
    # Create new project
    project = app.new_project("TestAnimation")
    
    # Add models
    steve = project.add_model("Steve")
    world = project.add_model("World")
    
    # Set up animation
    project.animation.set_fps(30)
    project.animation.set_duration(120)
    
    # Animate Steve's position
    steve.animate("position", [
        (0, (0, 0, 0)),
        (30, (5, 0, 0)),
        (60, (10, 2, 0)),
        (120, (0, 0, 0))
    ])
    
    # Export
    project.set_resolution(1920, 1080)
    project.render()
    project.export(ExportFormat.MP4, fps=30, quality='high')
