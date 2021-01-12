@echo off
cls
del *.exe
rm -rf build
mkdir build
cd build
pyinstaller --noconfirm --onefile --nowindowed --name "tmp" --ascii --clean --log-level "DEBUG" "../src/index.py"
cd ../
xcopy build\dist\tmp.exe index.exe*
rm -rf build __pycache__
