@echo off
cd /d "%~dp0backend"
call venv\Scripts\activate.bat
echo Downloading AI models - please wait...
python download_models.py
pause
