@ECHO OFF
CHCP 437>NUL
TASKLIST /FI "WINDOWTITLE eq AudioManagerHTS" |FINDSTR /B /C:"INFO: No tasks are running">nul && ( GOTO A ) || ( EXIT )
:A
TITLE AudioManagerHTS
SET "VERS=A0.430"
SET "VER_MANAGER=00.70.00"
SET "DATA_TMP=%CD%\data\temp"
SET "DATA_TMP_A=%DATA_TMP%\TMP_AUDIO.vbs"
SET "LOGS=%DATA%\logs"
SET "LOG_ERROR=%DATA%\logs\errors.log"
SET "LOG_INFO=%DATA%\logs\info.log"
ECHO.+%TIME% Manager: Started Logging>>"%LOG_INFO%"
:START
IF NOT EXIST "%APPDATA%\HTS_DATA\JAILPLUSESCAPE-%VERS%\SETTINGS\ONSOUNDS.dll" EXIT
MODE CON:COLS=58 LINES=6
TASKLIST /FI "IMAGENAME eq wscript.exe" 2>NUL | FIND /I /N "wscript.exe">NUL
IF /I "%ERRORLEVEL%"=="0" ( ECHO.INFO: Detected audio! ) ELSE ( ECHO.INFO: No audio. )
ECHO.
ECHO.^(!!^)    DO NOT close or click inside this window!    ^(!!^)
ECHO.        If you accidentally did, press backspace.
TIMEOUT /T 1 /NOBREAK>NUL
TASKLIST /FI "WINDOWTITLE eq Jail&Escape*" |FINDSTR /B /C:"INFO: No tasks are running">nul && (TASKLIST /FI "WINDOWTITLE eq Select Jail&Escape*" |FINDSTR /B /C:"INFO: No tasks are running">nul && (GOTO END) || (GOTO START))
GOTO START
:END
TIMEOUT /T 1 /NOBREAK>NUL
TASKLIST /FI "WINDOWTITLE eq Jail&Escape*" |FINDSTR /B /C:"INFO: No tasks are running">nul && (TASKLIST /FI "WINDOWTITLE eq Select Jail&Escape*" |FINDSTR /B /C:"INFO: No tasks are running">nul && (GOTO END-CONFIRM) || (GOTO START))
:END-CONFIRM
ECHO.+%TIME% Manager: Shutting Down>>"%LOG_INFO%"
TASKKILL /F /FI "WINDOWTITLE eq wscript.exe*" /T>NUL
IF EXIST "%DATA_TMP_A%" DEL /Q "%DATA_TMP_A%"
pause
EXIT