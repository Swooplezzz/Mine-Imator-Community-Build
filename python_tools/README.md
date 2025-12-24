# Mine-Imator Python Tools

Complete Python integration suite for Mine-Imator Community Build.

## Quick Start (Local Testing)

### Prerequisites
- Python 3.8+
- `pip` or `conda`

### Installation

```bash
# Clone the fork
git clone https://github.com/HotdogHF/Mine-Imator-Community-Build.git
cd Mine-Imator-Community-Build/python_tools

# Install package
pip install -e .

# Run tests
python -m pytest tests/
```

## Project Structure

### Core Modules

1. **`__init__.py`** - Package initialization
2. **`scripting_api.py`** - Blender-like Python console API
   - `MineImatorApp` - Application context
   - `Project`, `Model`, `Animation` - Core classes
   - Example: See `tests/test_scripting_api.py`

3. **`animation_exporter.py`** - Export animations
   - `AnimationExporter` class
   - Support for JSON, GML formats
   - Example: See `tests/test_animation_exporter.py`

4. **`mipy_format.py`** - .mipy extension format
   - `MIPYBuilder` - Create extension packages
   - `MIPYLoader` - Load extensions
   - `MIPYRegistry` - Manage installed extensions
   - Example: See `tests/test_mipy.py`

5. **`format_integration.py`** - Native format support
   - `MIProjectHandler` - Load/save .miproject (XML)
   - `MIDataHandler` - Load/save .midata (JSON)
   - `FormatConverter` - Convert between formats
   - Example: See `tests/test_format_integration.py`

### Tests

All tests are in `tests/` folder:
- `test_scripting_api.py` - Test console API
- `test_animation_exporter.py` - Test animation export
- `test_mipy.py` - Test .mipy format
- `test_format_integration.py` - Test format conversion
- `test_integration.py` - End-to-end tests

Run all:
```bash
python -m pytest tests/ -v
```

Run specific test:
```bash
python -m pytest tests/test_scripting_api.py -v
```

## Mine-Imator Project Structure

The host application has this structure:
```
GmProject/
├── datafiles/         # Data files
├── objects/           # Game Maker objects
├── options/           # Configuration
├── rooms/             # Scenes (rm_app is main)
├── scripts/           # GML scripts (1000+ files)
├── shaders/           # GPU shaders
└── sprites/           # Image assets
```

Python tools integrate into:
```
python_tools/
├── __init__.py
├── scripting_api.py    # Main API (works standalone)
├── animation_exporter.py
├── mipy_format.py
├── format_integration.py
├── README.md
└── tests/              # Can run WITHOUT Game Maker installed
```

## Testing Without Game Maker

### Why You Don't Need Game Maker Installed

Our Python tools are **100% standalone**:
- No Game Maker dependencies
- No C++ compilation needed
- Uses only standard Python + JSON/XML
- All tests use mock/synthetic data

### Example: Run Console API Test

```bash
python -c "from mine_imator import app; p = app.new_project('test'); print(p.name)"
```

### Example: Test Animation Export

```python
from mine_imator import AnimationExporter

# Works without any .miproject file
exporter = AnimationExporter("/tmp/test")
print("Exporter ready")
```

### Example: Test .mipy Format

```python
from mine_imator import MIPYBuilder, MIPYMetadata

metadata = MIPYMetadata(
    name="my_extension",
    version="1.0.0",
    author="Me",
    description="Test extension"
)

builder = MIPYBuilder(metadata)
builder.build("my_extension.mipy")
print("Package created!")
```

## Integration with Game Maker

When integrated into Mine-Imator (Game Maker):

1. **Python Console** inside Game Maker IDE
   - Execute scripts via `scripting_api.MineImatorApp`
   - Access current project, models, animations

2. **Format Handlers** automatically detect and convert:
   ```gml
   // In GML code:
   py_import_project("my_project.miproject")
   py_export_to_mipy("my_extension.mipy")
   ```

3. **.mipy Extension System**
   - Users can package Python tools as .mipy files
   - Install via registry
   - Auto-execute on startup

## Development

### Add New Feature

1. Add code to relevant module (e.g., `scripting_api.py`)
2. Create test in `tests/` with same name pattern
3. Run `pytest` to verify
4. Update this README if public API changes

### Testing Checklist

- [ ] Run `pytest tests/` - all pass
- [ ] No external dependencies needed (only stdlib)
- [ ] Works on Windows, macOS, Linux
- [ ] Compatible with Python 3.8+

## Compatibility

### Mine-Imator Formats

- ✅ `.miproject` (XML-based project files)
- ✅ `.mimodel` (JSON-based model files)
- ✅ `.miframes` (Animation frame data)
- ✅ `.midata` (Generic data)
- ✅ `.mipy` (Python extension packages) - NEW!

### Python Versions

- ✅ Python 3.8
- ✅ Python 3.9
- ✅ Python 3.10
- ✅ Python 3.11
- ✅ Python 3.12

## License

Same as Mine-Imator Community Build
