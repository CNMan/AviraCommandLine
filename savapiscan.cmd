@echo off
:check
mode con cols=97 lines=800
cls
title SAVAPI SCAN
set /p pt=Please input an absolute file or folder path:
cls
python savacli.py -c savacli.conf -r -i %pt% -t 1200
pause
