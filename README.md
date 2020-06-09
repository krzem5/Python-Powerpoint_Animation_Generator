# PowerPoint Animation Generator

PowerPoint Animation Generator is a simple python program made to easily generate PowerPoint Animations. It uses json file as an input.


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
`objects`|`dict`|:heavy_check_mark:|Dict of key-pair values The keys are the object id's and the values are object definitions used in the animation (structure defined [here](#object-definition-structure))
`animations`|`list`|:heavy_check_mark:|List of animation _'commands'_ (structure defined [here](#))

#### Object Definition Structure

Key|Type|Required|Description
:-:|:-:|:-:|-
`name`|`string`|:x:|The name that will be visible as the object name in PowerPoint
`src`|`path`|:heavy_check_mark:|The path to the image file to associate with this object
`pos`|`dict`|:x:|The initial position of the object
`pos:x`|`coord`|:x:|The x-position of the object
`pos:y`|`coord`|:x:|The y-position of the object
`size`|`dict`|:x:|The initial size of the object
`size:w`|`coord`|:x:|The width of the object
`size:h`|`coord`|:x:|The height of the object

#### Animation _'command'_ Structure

Key|Type|Required|Description
:-:|:-:|:-:|-
`id`|`string`|:heavy_check_mark:|The ID of the object to apply the animation to
`type`|`string`|:x:|The type of the animation (One of _motion_, _rotation_ or _scale_)
`duration`|`integer`|:heavy_check_mark:|The duration of the animation (in miliseconds)
`offset`|`integer`|:x:|The delay before the animation starts (in miliseconds)
`acc`|`procentage`|:x:|The acceleration (_'ease-in'_) procentage (up to 3 decimal places)
`dec`|`procentage`|:x:|The deceleration (_'ease-out'_) procentage (up to 3 decimal places)
`data`|`dict` / `list`|:heavy_check_mark:|The data of the animation (structure changes based on the type)
