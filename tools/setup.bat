@echo off
echo === REA Reverse Engineering Workspace Setup ===
echo.

REM Check Node.js
echo [1/5] Checking Node.js...
node --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo ERROR: Node.js not found. Install from https://nodejs.org (v22+)
    pause
    exit /b 1
)
node --version
echo OK

REM Check npm
echo.
echo [2/5] Checking npm...
npm --version
echo OK

REM Check ADB
echo.
echo [3/5] Checking ADB...
adb --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo WARNING: adb not found in PATH. Add Android Platform Tools to PATH.
    echo Download: https://developer.android.com/tools/releases/platform-tools
) ELSE (
    adb --version
    echo OK
)

REM Check connected device
echo.
echo [4/5] Checking connected Android device...
adb devices

REM Install REA
echo.
echo [5/5] Setting up REA agents...
call npx rea-agents setup
echo.
echo === Setup complete! ===
echo.
echo Next steps:
echo   1. Pull your target APK:  adb shell pm list packages ^| findstr keyword
echo   2. Get the APK path:      adb shell pm path full.package.name
echo   3. Pull the APK:          adb pull ^<path^> apk\target.apk
echo   4. Open this folder in VS Code and start Claude Code
echo   5. Tell Claude: "Follow the pipeline in CLAUDE.md"
echo.
pause
