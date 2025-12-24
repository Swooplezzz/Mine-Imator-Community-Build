#!/usr/bin/env python3
"""
Mine-Imator Community Build - Animation Exporter
Python tool for exporting animations from GML projects to various formats
"""

import json
import os
from pathlib import Path
from typing import Dict, List, Any


class AnimationExporter:
    """Export animations from Mine-Imator projects"""
    
    def __init__(self, project_path: str):
        self.project_path = Path(project_path)
        self.animations = []
    
    def load_animations(self, frames_dir: str) -> List[Dict[str, Any]]:
        """Load animation frames from directory"""
        frames_path = self.project_path / frames_dir
        
        if not frames_path.exists():
            raise FileNotFoundError(f"Frames directory not found: {frames_path}")
        
        animations = []
        for frame_file in sorted(frames_path.glob("*.json")):
            with open(frame_file, 'r') as f:
                frame_data = json.load(f)
                animations.append(frame_data)
        
        return animations
    
    def export_to_json(self, output_file: str) -> None:
        """Export animations to JSON format"""
        output_path = self.project_path / output_file
        output_path.parent.mkdir(parents=True, exist_ok=True)
        
        with open(output_path, 'w') as f:
            json.dump(self.animations, f, indent=2)
        
        print(f"Exported {len(self.animations)} animations to {output_file}")
    
    def export_to_gml(self, output_file: str) -> None:
        """Export animations as GML script"""
        output_path = self.project_path / output_file
        output_path.parent.mkdir(parents=True, exist_ok=True)
        
        gml_code = self._generate_gml_script()
        
        with open(output_path, 'w') as f:
            f.write(gml_code)
        
        print(f"Exported GML script to {output_file}")
    
    def _generate_gml_script(self) -> str:
        """Generate GML code from animation data"""
        gml = "/// Auto-generated animation data from Python exporter\n\n"
        gml += "function load_animations() {\n"
        
        for i, anim in enumerate(self.animations):
            gml += f"  animation[{i}] = {{\n"
            for key, value in anim.items():
                gml += f"    {key}: {json.dumps(value)},\n"
            gml += "  }\n"
        
        gml += "  return animation\n}"
        return gml


if __name__ == "__main__":
    import sys
    
    if len(sys.argv) < 2:
        print("Usage: python animation_exporter.py <project_path> [output_format]")
        print("Formats: json, gml")
        sys.exit(1)
    
    project_path = sys.argv[1]
    output_format = sys.argv[2] if len(sys.argv) > 2 else "json"
    
    exporter = AnimationExporter(project_path)
    
    try:
        exporter.load_animations("GmProject/datafiles/animations")
        
        if output_format == "json":
            exporter.export_to_json("exports/animations.json")
        elif output_format == "gml":
            exporter.export_to_gml("GmProject/scripts/animation_loader/animation_loader.gml")
        else:
            print(f"Unknown format: {output_format}")
    
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)
