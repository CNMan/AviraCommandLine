@echo off
savapi --install
ping -n 30 127.0.0.1 > nul
savapi --status
savapi --version
pause
