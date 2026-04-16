@echo off
REM One-click startup: launch TradingView with CDP + start MCP server
REM Usage: scripts\start.bat [port]

set PORT=%1
if "%PORT%"=="" set PORT=9222

echo === Step 1: Launching TradingView with CDP on port %PORT% ===
call "%~dp0launch_tv_debug.bat" %PORT%

if %errorlevel% neq 0 (
    echo TradingView launch failed. Aborting.
    exit /b 1
)

echo.
echo === Step 2: Starting MCP server ===
cd /d "%~dp0.."
npm start
