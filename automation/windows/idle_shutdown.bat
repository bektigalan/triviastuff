@echo off
setlocal

REM Time in seconds to wait before shutting down (1800 seconds = 30 minutes)
set WAIT_TIME=1800

REM Command to shut down the computer
set SHUTDOWN_CMD=shutdown /s /f /t 0

REM Command to check for user activity
set IDLE_TIME_CMD=quser /server:localhost | findstr "^[^ ]"

REM Function to get idle time in seconds
:get_idle_time
for /f "tokens=5 delims= " %%a in ('%IDLE_TIME_CMD%') do set IDLE_TIME=%%a
if "%IDLE_TIME%" == "none" set IDLE_TIME=0
goto :eof

:check_idle_time
call :get_idle_time
if %IDLE_TIME% GTR %WAIT_TIME% (
    echo Shutting down due to inactivity...
    %SHUTDOWN_CMD%
) else (
    timeout /t 60 /nobreak >nul
    goto check_idle_time
)

endlocal
