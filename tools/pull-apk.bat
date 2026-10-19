@echo off
echo === Pull APK from Connected Android Device ===
echo.

IF "%~1"=="" (
    echo Usage: pull-apk.bat ^<keyword^>
    echo Example: pull-apk.bat spotify
    echo.
    echo This will search for the package and pull the APK.
    echo.
    echo To list all packages manually:
    echo   adb shell pm list packages
    pause
    exit /b 1
)

SET KEYWORD=%~1
echo Searching for packages matching: %KEYWORD%
echo.
adb shell pm list packages | findstr %KEYWORD%
echo.
echo Copy the full package name from above and run:
echo   adb shell pm path full.package.name
echo   adb pull ^<path shown^> apk\target.apk
echo.
pause
