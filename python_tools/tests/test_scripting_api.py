#!/usr/bin/env python3
"""
Tests for Mine-Imator Scripting API (scripting_api.py)

These tests verify the core Python console API functionality.
No Game Maker or .miproject files needed!
"""

import pytest
import sys
import os

# Add parent directory to path so we can import mine_imator
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from scripting_api import (
    MineImatorApp, Project, Model, Animation, Vector3, ExportFormat
)


class TestVector3:
    """Test 3D vector math"""
    
    def test_create_vector(self):
        v = Vector3(1, 2, 3)
        assert v.x == 1
        assert v.y == 2
        assert v.z == 3
    
    def test_vector_addition(self):
        v1 = Vector3(1, 2, 3)
        v2 = Vector3(1, 1, 1)
        v3 = v1 + v2
        assert v3.x == 2
        assert v3.y == 3
        assert v3.z == 4
    
    def test_vector_multiplication(self):
        v = Vector3(2, 3, 4)
        v2 = v * 2
        assert v2.x == 4
        assert v2.y == 6
        assert v2.z == 8


class TestAnimation:
    """Test animation timeline"""
    
    def test_create_animation(self):
        anim = Animation("test")
        assert anim.name == "test"
        assert anim.fps == 24
        assert anim.duration == 100
    
    def test_add_keyframe(self):
        anim = Animation("test")
        kf = anim.add_keyframe(10, 45.0)
        assert kf.frame == 10
        assert kf.value == 45.0
        assert len(anim.keyframes) == 1
    
    def test_keyframes_sorted(self):
        anim = Animation("test")
        anim.add_keyframe(30, 90)
        anim.add_keyframe(10, 45)
        anim.add_keyframe(20, 60)
        
        # Keyframes should be sorted by frame
        frames = [kf.frame for kf in anim.keyframes]
        assert frames == [10, 20, 30]
    
    def test_get_keyframe(self):
        anim = Animation("test")
        anim.add_keyframe(10, 45)
        kf = anim.get_keyframe(10)
        assert kf is not None
        assert kf.value == 45
    
    def test_remove_keyframe(self):
        anim = Animation("test")
        anim.add_keyframe(10, 45)
        anim.add_keyframe(20, 60)
        anim.remove_keyframe(10)
        assert len(anim.keyframes) == 1
        assert anim.get_keyframe(10) is None
    
    def test_set_fps(self):
        anim = Animation("test")
        anim.set_fps(30)
        assert anim.fps == 30
    
    def test_set_duration(self):
        anim = Animation("test")
        anim.set_duration(240)
        assert anim.duration == 240


class TestModel:
    """Test 3D model manipulation"""
    
    def test_create_model(self):
        model = Model("Steve")
        assert model.name == "Steve"
        assert model.position == Vector3(0, 0, 0)
        assert model.visible == True
    
    def test_move_model(self):
        model = Model("Steve")
        model.move(5, 10, 15)
        assert model.position.x == 5
        assert model.position.y == 10
        assert model.position.z == 15
    
    def test_rotate_model(self):
        model = Model("Steve")
        model.rotate(90, 45, 0)
        assert model.rotation.x == 90
        assert model.rotation.y == 45
        assert model.rotation.z == 0
    
    def test_hide_show(self):
        model = Model("Steve")
        model.hide()
        assert model.visible == False
        model.show()
        assert model.visible == True
    
    def test_animate_model(self):
        model = Model("Steve")
        keyframes = [(0, (0,0,0)), (30, (5,0,0))]
        anim = model.animate("position", keyframes)
        assert "position" in model.animations
        assert len(anim.keyframes) == 2


class TestProject:
    """Test project management"""
    
    def test_create_project(self):
        project = Project("MyAnimation")
        assert project.name == "MyAnimation"
        assert project.width == 1920
        assert project.height == 1080
        assert len(project.models) == 0
    
    def test_add_model(self):
        project = Project("Test")
        model = project.add_model("Steve")
        assert model.name == "Steve"
        assert len(project.models) == 1
        assert project.get_model("Steve") is model
    
    def test_remove_model(self):
        project = Project("Test")
        project.add_model("Steve")
        project.remove_model("Steve")
        assert len(project.models) == 0
        assert project.get_model("Steve") is None
    
    def test_set_resolution(self):
        project = Project("Test")
        project.set_resolution(1280, 720)
        assert project.width == 1280
        assert project.height == 720
    
    def test_render(self):
        project = Project("Test")
        result = project.render()
        assert result == True
    
    def test_export(self):
        project = Project("Test")
        result = project.export(ExportFormat.JSON, output_path="test.json")
        assert result is not None


class TestMineImatorApp:
    """Test application context"""
    
    def test_create_app(self):
        from scripting_api import app
        assert app is not None
        assert app.version == "1.0.0"
    
    def test_new_project(self):
        test_app = MineImatorApp()
        project = test_app.new_project("TestProject")
        assert project.name == "TestProject"
        assert test_app.current_project is project
        assert len(test_app.projects) == 1
    
    def test_multiple_projects(self):
        test_app = MineImatorApp()
        p1 = test_app.new_project("Project1")
        p2 = test_app.new_project("Project2")
        assert len(test_app.projects) == 2
        assert test_app.current_project is p2
    
    def test_open_project(self):
        test_app = MineImatorApp()
        project = test_app.open_project("/path/to/project.miproject")
        assert project is not None
    
    def test_close_project(self):
        test_app = MineImatorApp()
        p1 = test_app.new_project("Project1")
        p2 = test_app.new_project("Project2")
        test_app.close_project(p1)
        assert len(test_app.projects) == 1
        assert p1 not in test_app.projects


class TestExportFormats:
    """Test export format enum"""
    
    def test_export_formats(self):
        assert ExportFormat.PNG.value == "png"
        assert ExportFormat.MP4.value == "mp4"
        assert ExportFormat.JSON.value == "json"
        assert ExportFormat.GML.value == "gml"
        assert ExportFormat.MP3.value == "mp3"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
