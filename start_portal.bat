@echo off
title CC Issuance & Partner Portal
cd /d "%~dp0"
echo ========================================================
echo Starting Credit Card Issuance & Partner Portal...
echo ========================================================
echo.
echo Opening browser at http://127.0.0.1:5000 ...
start http://127.0.0.1:5000
python app.py
pause
