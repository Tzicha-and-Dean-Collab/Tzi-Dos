@echo off
title Tzi-Dos Emulator
color 07

:main
cls
echo Tzi-Dos Emulator
echo.
:loop
set /p "cmd=C:\>"
if "%cmd%"=="dir" goto dir
if "%cmd%"=="cd" goto cd
if "%cmd%"=="echo" goto echo
if "%cmd%"=="exit" goto exit
if "%cmd%"=="create" goto create
if "%cmd%"=="cmds" goto cmds
if "%cmd%"=="del" goto del
if "%cmd%"=="ren" goto ren
if "%cmd%"=="ren-dir" goto ren-dir
if "%cmd%"=="type" goto type
if "%cmd%"=="mkdir" goto mkdir
if "%cmd%"=="rmdir" goto rmdir
if "%cmd%"=="cls" goto clear
if "%cmd%"=="copy" goto copy
if "%cmd%"=="move" goto move
if "%cmd%"=="append" goto append
if "%cmd%"=="time" goto time
if "%cmd%"=="find" goto find
if "%cmd%"=="run" goto run
if "%cmd%"=="notepad" goto notepad
if "%cmd%"=="ls" goto ls
if "%cmd%"=="details" goto details
if "%cmd%"=="disk" goto disk
if "%cmd%"=="env" goto env
if "%cmd%"=="drive" goto drive
if "%cmd%"=="taskmgr" goto taskmgr
if "%cmd%"=="help" goto help
echo '%cmd%' is not recognized as an internal or external command, operable program, or batch file.
goto loop

:dir
dir
goto loop

:cd
set /p "path=Enter directory: "
cd "%path%"
goto loop

:echo
set /p "msg=Enter message: "
echo %msg%
goto loop

:create
set /p "filename=Enter the filename: "
echo. > "%filename%"
if exist "%filename%" (
    echo File '%filename%' created successfully.
) else (
    echo Failed to create file '%filename%'.
)
goto loop

:del
set /p "filename=Enter the filename to delete: "
del "%filename%"
if not exist "%filename%" (
    echo File '%filename%' deleted successfully.
) else (
    echo Failed to delete file '%filename%'.
)
goto loop

:ren
set /p "oldname=Enter the current filename: "
set /p "newname=Enter the new filename: "
ren "%oldname%" "%newname%"
if exist "%newname%" (
    echo File renamed to '%newname%'.
) else (
    echo Failed to rename file '%oldname%'.
)
goto loop

:ren-dir
set /p "olddir=Enter the current directory name: "
set /p "newdir=Enter the new directory name: "
ren "%olddir%" "%newdir%"
if exist "%newdir%" (
    echo Directory renamed to '%newdir%'.
) else (
    echo Failed to rename directory '%olddir%'.
)
goto loop

:type
set /p "filename=Enter the filename to view: "
type "%filename%"
goto loop

:mkdir
set /p "dirname=Enter the directory name to create: "
mkdir "%dirname%"
if exist "%dirname%" (
    echo Directory '%dirname%' created successfully.
) else (
    echo Failed to create directory '%dirname%'.
)
goto loop

:rmdir
set /p "dirname=Enter the directory name to remove: "
rmdir "%dirname%"
if not exist "%dirname%" (
    echo Directory '%dirname%' removed successfully.
) else (
    echo Failed to remove directory '%dirname%'. Make sure it is empty.
)
goto loop

:copy
set /p "src=Enter the source file to copy: "
set /p "dest=Enter the destination path or filename: "
copy "%src%" "%dest%"
if exist "%dest%" (
    echo File copied successfully to '%dest%'.
) else (
    echo Failed to copy file '%src%'.
)
goto loop

:move
set /p "src=Enter the source file to move: "
set /p "dest=Enter the destination path or filename: "
move "%src%" "%dest%"
if exist "%dest%" (
    echo File moved successfully to '%dest%'.
) else (
    echo Failed to move file '%src%'.
)
goto loop

:append
set /p "filename=Enter the filename to append to: "
set /p "text=Enter the text to append: "
echo %text% >> "%filename%"
echo Text appended to '%filename%'.
goto loop

:time
echo Current Date and Time:
date /t
time /t
goto loop

:find
set /p "filename=Enter the filename to search: "
set /p "text=Enter the text to search for: "
find "%text%" "%filename%"
goto loop

:run
set /p "exec=Enter the executable or script to run: "
start "" "%exec%"
goto loop

:notepad
set /p "filename=Enter the filename to open in Notepad: "
notepad "%filename%"
goto loop

:ls
dir /b
goto loop

:details
set /p "filename=Enter the filename to show details: "
for %%f in ("%filename%") do (
    echo File: %%f
    echo Size: %%~zf bytes
    echo Created: %%~tf
    echo Last Modified: %%~tf
)
goto loop

:disk
echo Disk Space Usage:
wmic logicaldisk get size,freespace,caption
goto loop

:env
echo Environment Variables:
set
goto loop

:drive
set /p "drive=Enter the drive to switch to (e.g., D:): "
cd /d "%drive%"
goto loop

:taskmgr
start taskmgr
goto loop

:clear
cls
goto loop

:cmds
echo Available commands:
echo -------------------
echo dir      - List files and directories
echo cd       - Change directory
echo echo     - Display a message
echo create   - Create a new file
echo del      - Delete a file
echo ren      - Rename a file
echo ren-dir  - Rename a directory
echo type     - Display file content
echo mkdir    - Create a new directory
echo rmdir    - Remove an empty directory
echo cls      - Clear the screen
echo copy     - Copy a file
echo move     - Move a file
echo append   - Append text to a file
echo time     - Show the current date and time
echo find     - Search for text in a file
echo run      - Run an executable or script
echo notepad  - Open a file in Notepad
echo ls       - List directory contents
echo details  - Show file details
echo disk     - Check disk space
echo env      - Show environment variables
echo drive    - Change drive
echo taskmgr  - Open Task Manager
echo help     - Show detailed help for commands
echo cmds     - List available commands
echo exit     - Exit Tzi-Dos
goto loop

:help
echo Help:
echo -------
echo dir - List files and directories
echo cd - Change directory
echo echo - Display a message
echo create - Create a new file
echo del - Delete a file
echo ren - Rename a file
echo ren-dir - Rename a directory
echo type - Display file content
echo mkdir - Create a new directory
echo rmdir - Remove an empty directory
echo cls - Clear the screen
echo copy - Copy a file
echo move - Move a file
echo append - Append text to a file
echo time - Show the current date and time
echo find - Search for text in a file
echo run - Run an executable or script
echo notepad - Open a file in Notepad
echo ls - List directory contents
echo details - Show file details
echo disk - Check disk space
echo env - Show environment variables
echo drive - Change drive
echo taskmgr - Open Task Manager
echo help - Show detailed help for commands
goto loop

:exit
exit
