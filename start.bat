@echo off
cd /d "%~dp0"

echo Starting Doc mind ai...
start "Doc mind ai - Backend" cmd /k "cd /d %~dp0backend && venv\Scripts\activate && uvicorn main:app --reload --port 8000"
timeout /t 3 /nobreak >nul
start "Doc mind ai - Frontend" cmd /k "cd /d %~dp0frontend && npm run dev"
echo.
echo Backend + Frontend starting in new windows...
echo Open http://localhost:5173 when ready.
