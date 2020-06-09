# PowerPoint Animation Generator

PowerPoint Animation Generator is a simple python program made to easily generate PowerPoint Animations. It uses JSON as an input.


## Compiling

Compiling is optional. It uses pyinstaller to create an exe.
```bash
pyinstaller --noconfirm --onefile --nowindowed --name "app" --ascii --clean --log-level "DEBUG" "app.py"
```
The file `build.bat` simplifies that process and automaticly removes all unwanted pyinstaller files.


## Usage

```bash
python app.py <path to json file>
```
_OR_&nbsp;&nbsp;(build version)
```bash
app.exe <path to json file>
```

### Json File Structure

The json file must have the structrue presented below or else the program will fail with an error.

Key|Type|Required|Description
:-:|:-:|:-:|-
`name`|`string`|:heavy_check_mark:|The name of the PowerPoint file that will be generated
`objects`|`dict`|:heavy_check_mark:|Dict of key-pair values The keys are the object id's and the values are object definitions used in the animation (structure defined [here](#structure))
`animations`|`list`|:heavy_check_mark:|List of animation _'commands'_ (structure defined [here](#))

#### Object Definition Structure

Key|Type|Required|Description
:-:|:-:|:-:|-
`name`|`string`|:x:|The name that will be visible as the object name in PowerPoint


## License
[MIT](https://choosealicense.com/licenses/mit/)
