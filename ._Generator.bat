@echo off
setlocal EnableExtensions

title Generate OpenRCT2 Portable

echo ====================================================
echo        OpenRCT2 Portable Generator
echo ====================================================
echo.

where py >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python launcher "py" was not found.
    echo.
    echo Please install the latest Python from:
    echo https://www.python.org/downloads/
    echo.
    echo After installing, close this window and run this batch file again.
    echo.
    pause
    exit /b 1
)

if not exist "generate.py" (
    echo [ERROR] generate.py was not found in this folder.
    echo.
    echo Make sure this BAT file is in the same folder as generate.py.
    echo.
    pause
    exit /b 1
)

echo Python found:
py --version
echo.
echo Running:
echo Generator
echo.

py generate.py

if errorlevel 1 (
    echo.
    echo [ERROR] generate.py failed.
    echo.
    pause
    exit /b 1
)

echo.
echo ====================================================
echo  Done!
echo ====================================================
echo.
echo Generated files should now be generated.
echo.
pause
exit /b 0
