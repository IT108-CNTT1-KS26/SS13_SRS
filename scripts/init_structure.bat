@echo off
setlocal
rem Tao cac thu muc chuan tu vi tri goc cua script, khong xoa du lieu cu.
for %%I in ("%~dp0..") do set "ROOT=%%~fI"
if not exist "%ROOT%\docs" mkdir "%ROOT%\docs"
if not exist "%ROOT%\scripts" mkdir "%ROOT%\scripts"
if not exist "%ROOT%\data" mkdir "%ROOT%\data"
if not exist "%ROOT%\backup" mkdir "%ROOT%\backup"
if not exist "%ROOT%\.env" if exist "%ROOT%\.env.example" copy /Y "%ROOT%\.env.example" "%ROOT%\.env" >nul
echo Da kiem tra cau truc thu muc GreenTech.
exit /b 0
