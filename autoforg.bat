@echo off
setlocal EnableDelayedExpansion

set "ROOT=%~dp0"
set "SCRIPT=%~nx0"

echo.
echo ==============================
echo       DIRECTORY ORGANIZER
echo ==============================
echo.
echo Folder: %ROOT%
echo.

for %%F in ("%ROOT%*.*") do (
    if /I not "%%~nxF"=="%SCRIPT%" (

        set "EXT=%%~xF"
        set "EXT=!EXT:~1!"
        set "FOLDER="

        for %%E in (pdf doc docx txt rtf odt md) do if /I "!EXT!"=="%%E" set "FOLDER=Documents"
        for %%E in (xls xlsx xlsm csv ods) do if /I "!EXT!"=="%%E" set "FOLDER=Spreadsheets"
        for %%E in (ppt pptx pptm odp) do if /I "!EXT!"=="%%E" set "FOLDER=Presentations"
        for %%E in (jpg jpeg png gif bmp webp svg ico tif tiff heic avif) do if /I "!EXT!"=="%%E" set "FOLDER=Images"
        for %%E in (mp4 mkv avi mov wmv webm flv m4v) do if /I "!EXT!"=="%%E" set "FOLDER=Videos"
        for %%E in (mp3 wav flac aac m4a ogg wma) do if /I "!EXT!"=="%%E" set "FOLDER=Music"
        for %%E in (zip rar 7z tar gz bz2 xz) do if /I "!EXT!"=="%%E" set "FOLDER=Archives"
        for %%E in (exe msi msix appx) do if /I "!EXT!"=="%%E" set "FOLDER=Installers"
        for %%E in (c cpp h hpp py js ts java cs go rs php html css json xml yaml yml toml sql ps1 sh) do if /I "!EXT!"=="%%E" set "FOLDER=Code"
        for %%E in (iso img vhd vhdx) do if /I "!EXT!"=="%%E" set "FOLDER=Disk Images"
        for %%E in (ttf otf woff woff2) do if /I "!EXT!"=="%%E" set "FOLDER=Fonts"
        for %%E in (epub mobi azw azw3) do if /I "!EXT!"=="%%E" set "FOLDER=Ebooks"

        if defined FOLDER (
            if not exist "%ROOT%!FOLDER!\" mkdir "%ROOT%!FOLDER!"

            if exist "%ROOT%!FOLDER!\%%~nxF" (
                echo [SKIP] %%~nxF
            ) else (
                move "%%F" "%ROOT%!FOLDER!\" >nul

                if errorlevel 1 (
                    echo [ERROR] %%~nxF
                ) else (
                    echo [MOVE] %%~nxF ^> !FOLDER!
                )
            )
        )
    )
)

echo.
echo ==============================
echo           COMPLETE
echo ==============================
echo.
pause
