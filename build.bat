@echo off
cls
if exist build rmdir /s /q build
mkdir build
cd build
pyinstaller --noconfirm --onefile --nowindowed --name "tmp" --ascii --clean --log-level "DEBUG" "../src/index.py"
cd ..
@echo >> build\index.exe
xcopy /s /q /y /f build\dist\tmp.exe build\index.exe
if exist __pycache__ rmdir /s /q __pycache__
rmdir /s /q build\build
rmdir /s /q build\dist
del build\*.spec
