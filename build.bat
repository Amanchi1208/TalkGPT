@echo off
if not "%cd:~-3%"=="hal" exit
if "%1"=="clean" goto :a
call :a
del oldhal.cab
ren hal.cab oldhal.cab
dir /b "%cd%">makecabcode
makecab /f makecabcode /l "%cd%"
del makecabcode
move disk1\1.cab 1.cab
rd /q /s disk1
ren 1.cab hal.cab
call :a
cls
:a
echo Cleaning trash
del /f setup.inf
del /f setup.rpt
del /f script.vbs
del cf_failed_*.png
del *.bak
del makecabcode
rd /s /q __pycache__
