@echo off
setlocal
for %%I in ("%~dp0..") do set "ROOT=%%~fI"
set "LOG_FILE=%ROOT%\data\log-he-thong.log"
set "REPORT_FILE=%ROOT%\backup\bao-cao-su-co.txt"

if not exist "%LOG_FILE%" (
    echo Khong tim thay tep log: "%LOG_FILE%"
    exit /b 1
)
if not exist "%ROOT%\backup" mkdir "%ROOT%\backup"

>>"%REPORT_FILE%" echo(
>>"%REPORT_FILE%" echo ===== BAO CAO SU CO HE THONG =====
>>"%REPORT_FILE%" echo Thoi gian chay: %date% %time%

type "%LOG_FILE%" | findstr /I /C:"CRITICAL" /C:"ERROR" /C:"TIMEOUT" >>"%REPORT_FILE%"
set "FILTER_EXIT=%ERRORLEVEL%"

if "%FILTER_EXIT%"=="1" (
    >>"%REPORT_FILE%" echo Khong tim thay dong CRITICAL, ERROR hoac TIMEOUT.
)
if "%FILTER_EXIT%"=="2" (
    >>"%REPORT_FILE%" echo LOI: findstr khong the doc hoac loc tep log.
    echo Co loi khi loc log. Kiem tra quyen doc va tep nguon.
    exit /b 2
)

echo Hoan tat loc log. Bao cao: "%REPORT_FILE%"
exit /b 0
