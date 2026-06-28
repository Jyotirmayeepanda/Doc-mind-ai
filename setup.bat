@echo off
setlocal EnableDelayedExpansion
cd /d "%~dp0"

echo.
echo ========================================
echo   Doc mind ai - Auto Setup (Windows)
echo ========================================
echo.

where python >nul 2>&1
if errorlevel 1 (
  echo [ERROR] Python not found. Install Python 3.10+ and check "Add to PATH"
  echo         https://www.python.org/downloads/
  exit /b 1
)

where node >nul 2>&1
if errorlevel 1 (
  echo [ERROR] Node.js not found. Install Node.js 18+
  echo         https://nodejs.org/
  exit /b 1
)

echo [1/3] Setting up Python backend...
cd backend
if not exist venv (
  python -m venv venv
)
call venv\Scripts\activate.bat
python -m pip install --upgrade pip -q
pip install -r requirements.txt
if errorlevel 1 (
  echo [ERROR] pip install failed
  exit /b 1
)

if not exist .env (
  echo GROQ_API_KEY=your_groq_api_key_here> .env
  echo       Created backend\.env - edit and add your Groq API key!
) else (
  echo       backend\.env already exists
)

echo [2/3] Setting up React frontend...
cd ..\frontend
call npm install
if errorlevel 1 (
  echo [ERROR] npm install failed
  exit /b 1
)

cd ..
echo [3/3] Setup complete!
echo.
echo ========================================
echo   HOW TO RUN (2 VS Code terminals)
echo ========================================
echo.
echo   Terminal 1 - Backend:
echo   cd backend ^&^& venv\Scripts\activate ^&^& uvicorn main:app --reload --port 8000
echo.
echo   Terminal 2 - Frontend:
echo   cd frontend ^&^& npm run dev
echo.
echo   Then open: http://localhost:5173
echo.
echo   Or run: start.bat
echo ========================================
echo.

endlocal
