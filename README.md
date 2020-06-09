# PowerPoint Animation Generator

PowerPoint Animation Generator is a simple python program made to easily generate PowerPoint Animations. It uses json file as an input.


## Compiling

Compiling is optional. It uses pyinstaller to create an exe.
```bash
pyinstaller --noconfirm --onefile --nowindowed --name "index" --ascii --clean --log-level "DEBUG" "index.py"
```
The file `build.bat` simplifies that process and automaticly removes all unwanted pyinstaller files.


## Usage

```bash
python index.py <path to json file>
```
_OR_&nbsp;&nbsp;(build version)

```bash
index.exe <path to json file>
```

### Json File Structure

The json file must have the structrue presented below or else the program will fail with an error.

***Note:** The `coord` type can be an intiger or a valid equasion. It can contain procentages (ex. `20%+80`) which will be replaced by the procent of the width / height (for x-position / width if will be the width of the slide and for y-position / height the height of the slide)*

Key|Type|Required|Description
:-:|:-:|:-:|-
`name`|`string`|:heavy_check_mark:|The name of the PowerPoint file that will be generated
`objects`|`dict`|:heavy_check_mark:|Dict of key-pair values The keys are the object id's and the values are object definitions used in the animation (structure defined [here](#object-definition-structure))
`animations`|`list`|:heavy_check_mark:|List of animation _'commands'_ (structure defined [here](#animation-command-structure))

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

#### **The `data` value for the structure above has the following structure if the `type` is set to `motion`:**

**General Type:** `list`
Key|Type|Required|Description
:-:|:-:|:-:|-
`x`|`coord`|:heavy_check_mark:|The x-position of the given point
`y`|`coord`|:heavy_check_mark:|The y-position of the given point
`ax`|`coord`|:x:|The x-position of the 1st control point of the curve
`ay`|`coord`|:x:|The y-position of the 1st control point of the curve
`bx`|`coord`|:x:|The x-position of the 2nd control point of the curve
`by`|`coord`|:x:|The y-position of the 2nd control point of the curve

***Note:** A curve will only be generated if all of the control points are specified, otherwise all of them will be ignored*

***Note 2:** The 1st point in the list is the starting point and will always ignore the `ax`, `ay`, `bx` and `by` parameters*

#### **The `data` value for the animation structure has the following structure if the `type` is set to `rotation`:**

**General Type:** `dict`
Key|Type|Required|Description
:-:|:-:|:-:|-
`by`|`float`|:x:|The relative rotation of the given object (60 000 units per angle)
`from`|`float`|:x:|The start rotation of the object (60 000 units per angle)
`to`|`float`|:x:|The end rotation of the object (60 000 units per angle)

***Note:** If the `by` key is specified, it will always use it. Otherwise, it will use `from` and `to`*

#### **The `data` value for the animation structure has the following structure if the `type` is set to `scale`:**

**General Type:** `dict`
Key|Type|Required|Description
:-:|:-:|:-:|-
`by`|`dict`|:x:|The relative scale of the given object
`by:x`|`float`|:heavy_check_mark:|The relative x-scale value
`by:y`|`float`|:heavy_check_mark:|The relative y-scale value
`from`|`dict`|:x:|The start scale of the object
`from:x`|`float`|:heavy_check_mark:|The start x-scale value
`from:y`|`float`|:heavy_check_mark:|The start y-scale value
`to`|`dict`|:x:|The end scale of the object
`nd:x`|`float`|:heavy_check_mark:|The end x-scale value
`end:y`|`float`|:heavy_check_mark:|The end y-scale value

***Note:** If the `by` key is specified, it will always use it. Otherwise, it will use `from` and `to`*

