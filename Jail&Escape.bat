::Created by HTS Studios - More info in the Read Me text file (Do not distribute)
::(Use "NotePad++" to view better this file)
::_______ ______ ______ ______ ______ ______ ______ ______ ______ ______ ______ ______
::______//_____//_____//_____//_____//_____//_____//_____//_____//_____//_____//______ \
::     _    _   _______    _____      _____   _                 _   _                 | |
::    | |  | | |__   __|  / ____|    / ____| | |               | | (_)                | |
::    | |__| |    | |    | (___     | (___   | |_   _   _    __| |  _    ___    ___   | |
::    |  __  |    | |     \___ \     \___ \  | __| | | | |  / _` | | |  / _ \  / __|  | |
::    | |  | |    | |     ____) |    ____) | | |_  | |_| | | (_| | | | | (_) | \__ \  | |
::    |_|  |_|    |_|    |_____/    |_____/   \__|  \__,_|  \__,_| |_|  \___/  |___/  | |
::_______ ______ ______ ______ ______ ______ ______ ______ ______ ______ ______ ______| |
::______//_____//_____//_____//_____//_____//_____//_____//_____//_____//_____//______ /
::                
::This is totally safe. Don't be a nerd, bye.
::Do not complain if you don't know how to use BatchScript.
:LAUNCHER
@ECHO OFF
::437
CHCP 437>NUL
SETLOCAL 
FOR /F "TOKENS=4-5 DELIMS= " %%I IN ('VER') DO SET WINVER=%%I
IF "%WINVER:~0,4%" == "10.0" GOTO WINCONFIRMED
IF %WINVER:~2,1% GEQ 1 GOTO WINCONFIRMED
ENDLOCAL
::OS Ver Numbers: "6.3" = Windows 8.1 | "6.2" = Windows 8 | "6.1" = Windows 7 | "6.0" Windows Vista.
ECHO.You are eiher using an old OS version or an unsupported OS build. Update or Change your OS build to Windows 10!
ECHO.
POWERSHELL WRITE-HOST -fore Red ERROR_OLD_WIN_VERSION 0x47E
PAUSE>NUL&EXIT
:WINCONFIRMED
2>NUL ( 9>"%~F0.tmp" ( SET "STARTED=1"&CALL :CHECKCOMPLETE ) )
@IF /I DEFINED STARTED ( 2>NUL ) ELSE ( EXIT /B )
:CHECKCOMPLETE
NET SESSION >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
	ECHO.This program does not support Administrator permissions for Security Reasons.
	ECHO.Make sure you are running this normally.
	ECHO.
	ECHO.Press any key to exit.
	PAUSE>NUL
	EXIT
)
:VARIABLES
::Variables - Changes these may require an uninstall.
SET "VERCODE=04300"
SET "VERS=A0.430"
SET "HTS_DATA=%APPDATA%\HTS_DATA"
SET "MAIN_GAME=%HTS_DATA%\JAILPLUSESCAPE-%VERS%"
SET "DATA_SAVES=%MAIN_GAME%\SAVES"
SET "DATA_SETTINGS=%MAIN_GAME%\SETTINGS"
SET "DATA=%CD%\data"
SET "DATA_TMP=%DATA%\temp"
SET "DATA_FILES=%DATA%\files"
SET "DATA_SCRIPTS=%DATA_FILES%\scripts"
SET "DATA_IMAGES=%DATA_FILES%\images"
SET "TARGET=Jail&Escape"
SET "UDERFINE="
SET "SCSCRIPT="
SET "ERRORLEVEL="
SET "HTS_DIR_ERR="
SET "TEAMNAME=HTS-Team"
SET "TEAMCOMPANY=HTS-StudiosTM"
SET "PROGRAMDISCORD=https://discord.gg/Qst63njdBG"
SET "READMEFILE=Read Me - JailAEscape.txt"
SET "LICENSEILE=License - JailAEscape.txt"
SET "OUTOFDATE="
SET /A EXISTFILESNUM=0
SET "DIRLOGS=%CD%\log.log"
SET "STARTED="
SET "C-SPACE=%DATA_TMP%\space.txt"
SET RTIP=
::-Scripts
SET "SCRIPT_WAIT=%DATA_FILES%\scripts\wait.vbs"
SET "SCRIPT_HTSANI=%DATA_FILES%\scripts\htsani.cmd"
SET "SCRIPT_FACT=%DATA_FILES%\scripts\fact.cmd"
::-Layout
SET LN=ECHO.^^^|                                                                                         ^^^|
SET W=ECHO.
::-Regit
SET "REGIT_1=HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{22d6f312-b0f6-11d0-94ab-0080c74c7e95}a"
SET "REGIT_2=HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{6BF52A52-394A-11d3-B153-00C04F79FAA6}a"
::-Audio Variables
SET "VOLUME=0"
SET "NOAUDIO=NUL"
SET "DATA_AUDIO=%CD%\data\audio"
SET "DATA_AUDIO_1=%CD%\data\audio\1"
SET "DATA_AUDIO_SYS=%CD%\data\audio\sys"
SET "DATA_AUDIO_SYS_MENU=%CD%\data\audio\sys\menu"
SET "DATA_TMP_A=%DATA_TMP%\TMP_AUDIO.vbs"
::-Audio Managers
SET "AudioManager=%DATA_SCRIPTS%\AudioManager.bat"
SET "ADirector=wscript.exe"
::-Logs
SET "LOGS=%DATA%\logs"
SET "LOG_ERROR=%DATA%\logs\errors.log"
SET "LOG_INFO=%DATA%\logs\info.log"
SET "LOG_WARN=%DATA%\logs\warn.log"
::-Saving Configuration
SET "SAVEIS=TRUE"
::-Window Size
IF "%WINVER:~0,4%" == "10.0" (
	SET "COLS=91"
	SET "LINES=38"
) ELSE (
	SET "COLS=92"
	SET "LINES=38"
)
::-DLC Loader
SET "DLC_LO=%DATA%\dlc"
SET /A "MAX_DLC"="%LINES%-4"
::-System Loaders
SET "ML1L=%DATA_TMP%\ML1"
::-Finished
IF NOT EXIST "%LOGS%" IF EXIST "%DATA%" (
	MD "%LOGS%"
	ECHO.+%TIME% - - - - Logger Started - - - ->>"%LOG_INFO%"
	ECHO.+%TIME% The directory "logs" was missing but recreated>>"%LOG_INFO%"
) ELSE ( ECHO.+%TIME% - - - - Logger Started - - - ->>"%LOG_INFO%" )
:FINISHSTARTUPCHECK
MODE CON:COLS=%COLS% LINES=%LINES%
IF NOT EXIST "%MAIN_GAME%\LICENSEAGREEMENT.dll" IF EXIST "License - JailAEscape.txt" (
	ECHO.Please read and make sure that you agree to our License!
	ECHO.By closing the License window you agree, and be able to
	ECHO.continue using this product.
	START /WAIT "" "License - JailAEscape.txt"
	ECHO.AGREED>"%MAIN_GAME%\LICENSEAGREEMENT.dll"
)
:FINISHEDLICENSE
IF EXIST "%MAIN_GAME%\A0-350-STABLE.dll" (
	ECHO. Warning! Seems like you have ran old versions of this game before, such as v0.390 and lower.
	ECHO. To continue, the game's settings must be deleted and restored.
	ECHO.
	ECHO. By pressing any key you accept to reset the game's settings.
	ECHO. Your saves will not be deleted.
	ECHO.
	ECHO. ^(Press any key to continue^)
	PAUSE>NUL
	CLS
	ECHO. Working on it...
	IF EXIST "%DATA_SETTINGS%" @RD /S /Q "%DATA_SETTINGS%"
	DEL /Q "%MAIN_GAME%\A0-350-STABLE.dll"
	CLS
)
IF NOT EXIST "%MAIN_GAME%\0430.0.dll" ECHO.VER=0430.0 > "%MAIN_GAME%\0430.0.dll"
REG QUERY "%REGIT_1%" > NUL
IF %ERRORLEVEL% EQU 1 (
	IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" DEL /Q "%DATA_SETTINGS%\ONSOUNDS.dll"
	SET NOAUDIO=TRUE
)
REG QUERY "%REGIT_2%" > NUL
IF %ERRORLEVEL% EQU 1 (
	IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" DEL /Q "%DATA_SETTINGS%\ONSOUNDS.dll"
	SET NOAUDIO=TRUE
)
IF NOT EXIST "%~n0%~x0" (
	CLS
	ECHO.Unable to launch.
	ECHO.
	ECHO.Make sure the following:
	ECHO.The program isn't running in a zip file or any winrar format.
	ECHO.The program has permissions to add files on the current directory.
	ECHO.Don't launch it directly from a search bar or a run-in, it breaks the directory.
	ECHO.If you are using a shortcut, make sure you added the correct directory.
	PAUSE>NUL
	EXIT /B
)
TASKLIST /FI "IMAGENAME eq wscript.exe" 2>NUL|FIND /I /N "wscript.exe">NUL
IF /I "%ERRORLEVEL%"=="0" (
	TASKKILL /F /IM wscript.exe
	CLS
	ECHO.Something seems to be wrong! Did the program close without stopping the sounds or did you stop the Audio Manager?
	ECHO.If that happened and you didn't cause it, please report this to us RIGHT AWAY.
	ECHO.If this didn't happen please CONTACT US so we can find what caused it.
	ECHO.Find where to contact us in the read me file. Type read me in the menu or find the read me file in the directory.
	ECHO.
	ECHO.Press any key to continue the startup. ^(without any problems, but we highly recommend you to contact us^)
	PAUSE>NUL
)
:RELOADED
SET "START=%TIME%"
ENDLOCAL
MODE CON:COLS=%COLS% LINES=%LINES%
 ECHO.-                                        Loading...                                       -
IF /I NOT EXIST "%MAIN_GAME%\USED.dll" (
	ECHO.- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	ECHO.
) ELSE IF EXIST "%DATA_SETTINGS%\STARTUPLOGS.dll" (
	ECHO.- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	ECHO. )
IF NOT EXIST JAILPLUSESCAPE-%VERS% (
	IF EXIST %HTS_DATA%\JAILPLUSESCAPE_BETATEST_390_1 REN %HTS_DATA%\JAILPLUSESCAPE_BETATEST_390_1 JAILPLUSESCAPE-%VERS%
)
TASKKILL /F /IM wscript.exe>NUL
:WIFI-CHECK
SET /p "=NETWORK: Checking for Internet Access ..." <NUL
PING www.google.nl -n 1 -w 1000 >NUL
IF ERRORLEVEL 1 (
	SET INTERNETCHECK=ECHO. Not connected!^&SET WIFICONNECTION=FALSE
) ELSE SET INTERNETCHECK=SET WIFICONNECTION=EMPTY^&ECHO. Connected!
%INTERNETCHECK%
:CHECKFORNEWVERSIONS-UPDATER
IF EXIST "%DATA_SETTINGS%\CHECKFORUPDATES.dll" GOTO SYSTEM-FEATURE-LOAD
ECHO.UPDATER: Checking for updates in GitHub via HTTPS ... ^(Waiting for a Response^)
IF %WIFICONNECTION%==FALSE (
	ECHO.UPDATER: Failed to check for updates. Please make sure you are connected to internet!
	GOTO SYSTEM-FEATURE-LOAD
)
CURL -s "https://raw.githubusercontent.com/136MasterNR/JailAEscape-UpdateCheck/master/JailAEscapeUpdater.cmd" --ssl-no-revoke >UpdateVersionINFO.cmd
>NUL FIND /I "SET LATESTVERSION=" UpdateVersionINFO.cmd && (
	CALL UpdateVersionINFO.cmd
	DEL /Q UpdateVersionINFO.cmd
)||(
	FOR %%R IN (UpdateVersionINFO.cmd) DO IF %%~zR LSS 1 ( ECHO.UPDATER: Failed to check for updates because the information was empty.
	) ELSE ( ECHO.UPDATER: Failed to check for updates because the information was not recognized. )
	SET OUTOFDATE=UNRE
	DEL /Q UpdateVersionINFO.cmd
	GOTO SYSTEM-FEATURE-LOAD
)
IF %LATESTVERSION%==%VERS% (
	ECHO.UPDATER: You are running the latest version of this program which is "%VERS%"!
	SET OUTOFDATE=FALSE
) ELSE (
	ECHO.UPDATER: You are not running the latest version.
	SET OUTOFDATE=TRUE
)
:: - - - System Configuration - - -
:SYSTEM-FEATURE-LOAD
SET /p "=SYSTEM: Loading Features ..." <NUL
::-Color Text System Loader
PUSHD "%~dp0"
 IF "!![" == "[" (
  GOTO :end)
 FOR /F "TOKENS=1,2 DELIMS=#" %%A IN ('"PROMPT #$H#$E# & ECHO ON & FOR %%B IN (1) DO REM"') DO (SET "DEL=%%A")
 SET "HCOL=FOR %%O IN (1 2)DO IF %%O==2 ( <NUL SET /P ".=%DEL%" > "!OUTS:\N=!" & (FINDSTR /V /A:? /R "^$" "!OUTS:\N=!" NUL & DEL "!OUTS:\N=!" > NUL 2>&1 & SET "TESTOUT=!OUTS:\N=!"&IF NOT "!TESTOUT!" == "!OUTS!" (ECHO/)))ELSE SET OUTS="
FOR /F "TOKENS=1,2 DELIMS=#" %%A IN ('"PROMPT #$H#$E# & ECHO ON & FOR %%B IN (1) DO REM"') DO (SET "DEL=%%A")
::-Text Overwriter System Loader
ECHO 1B 5B>"%ML1L%.hex"
DEL ML1.bin >NUL 2>&1
CERTUTIL -decodehex "%ML1L%.hex" "%ML1L%.bin" >NUL 2>&1
SET /P ML1=<"%ML1L%.bin"
SET "MLL=%ML1%1F%ML1%0J"
::-Complete
ECHO. Completed!
:SETTINGSLOADER
::Settings
SET /p "=SETTINGS: Reading ..." <NUL
IF EXIST "%DATA_SETTINGS%\VOLUME.cmd" ( CALL "%DATA_SETTINGS%\VOLUME.cmd"
) ELSE (
	(
		ECHO.SET VOLUME=80
		ECHO.GOTO :EOF
	)>"%DATA_SETTINGS%\VOLUME.cmd"
	SET VOLUME=80
)
IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ( COLOR F0 ) ELSE ( COLOR 0F )
IF /I NOT EXIST "%MAIN_GAME%\USED.dll" (
	ECHO.
	SET /p "=SETTINGS: Setup started ..." <NUL
	ECHO.ANIMATION==TRUE > "%DATA_SETTINGS%\ONANIMATION.dll"
	ECHO.SOUNDS==TRUE > "%DATA_SETTINGS%\ONSOUNDS.dll"
	ECHO.OUTLINEUPDATED==TRUE > "%DATA_SETTINGS%\OUTLINEUPDATED.dll"
)
ECHO. Finished!
::Data Loader (HTS Setup & Saves Setup & Sounds Setup) & nerd setup
IF NOT EXIST "%HTS_DATA%" (
	ECHO.FILES: Getting ready the HTS appdata files ...
	ECHO.FILES: Creating Folder: "AppData\HTS_DATA" ...
	MD "%HTS_DATA%"
)
IF NOT EXIST "%HTS_DATA%" (
	ECHO.ERROR: Unable to access the HTS APPDATA directory. ^(More info in the logs file^)
	SET HTS_DIR_ERR=TRUE
	GOTO FILESIDENTITY
)
::HTSDATAGAMEFORMAT
IF NOT EXIST "%MAIN_GAME%" (
	ECHO.FILES: Creating Folder: "AppData\..\JAILPLUSESCAPE" ...
	MD "%MAIN_GAME%"
)
::HTSDATASAVESFORMAT
IF NOT EXIST "%DATA_SAVES%" (
	ECHO.FILES: Creating Folder: "AppData\..\DATA_SAVES" ...
	MD "%DATA_SAVES%"
)
::HTSDATASETTINGSFORMAT
IF NOT EXIST "%DATA_SETTINGS%" (
	ECHO.FILES: Getting Ready the Settings ...
	MD "%DATA_SETTINGS%"
	ECHO.SOUNDS==TRUE> "%DATA_SETTINGS%\ONSOUNDS.dll"
	ECHO.ANIMATION==TRUE> "%DATA_SETTINGS%\ONANIMATION.dll"
	ECHO.OUTLINEUPDATED==TRUE> "%DATA_SETTINGS%\OUTLINEUPDATED.dll"
	ECHO.STARTUPLOGS==TRUE> "%DATA_SETTINGS%\STARTUPLOGS.dll"
)
:: - File Verification - ::
:FILESIDENTITY
ECHO.FILES: Verifying files identity ...
IF NOT EXIST "%DATA_TMP%" (
	MD "%DATA_TMP%"
	GOTO VARIABLES
)
:: :: -System
IF NOT EXIST "%DATA_AUDIO_SYS_MENU%\menuloop.mp3" GOTO FILESMISSING
IF NOT EXIST "%DATA_AUDIO_SYS_MENU%\startup.mp3" GOTO FILESMISSING
IF NOT EXIST "%DATA_AUDIO_SYS%\game\ga-wasted.mp3" GOTO FILESMISSING
:: :: -Ingame: One Horror Dream
IF NOT EXIST "%DATA_AUDIO_1%\m\mu-mysterious-door.mp3" GOTO FILESMISSING
IF NOT EXIST "%DATA_AUDIO_1%\m\mu-suspensemoment.mp3" GOTO FILESMISSING
IF NOT EXIST "%DATA_AUDIO_1%\m\mu-scaryatmospher.mp3" GOTO FILESMISSING
IF NOT EXIST "%DATA_AUDIO_1%\e\ef-crowbartool.mp3" GOTO FILESMISSING
IF NOT EXIST "%DATA_AUDIO_1%\e\ef-pickup.mp3" GOTO FILESMISSING
IF NOT EXIST "%DATA_AUDIO_1%\e\ef-reddooropen.mp3" GOTO FILESMISSING
IF NOT EXIST "%DATA_AUDIO_1%\e\ef-running.mp3" GOTO FILESMISSING
IF NOT EXIST "%DATA_AUDIO_1%\e\ef-unableunlock.mp3" GOTO FILESMISSING
IF NOT EXIST "%DATA_AUDIO_1%\e\ef-unlock.mp3" GOTO FILESMISSING
IF NOT EXIST "%DATA_IMAGES%\JailEscapeLogo128.ico" GOTO FILESMISSING
:: :: -Scripts
IF NOT EXIST "%AudioManager%" GOTO FILESMISSING
IF EXIST "%SCRIPT_WAIT%" GOTO SHORTCUTCREATE
:FILESMISSING
COLOR 0F
CLS
ECHO.
SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=04%-  -  -  -  -  -  -  -  -  -  -  -  -  Missing Files  -  -  -  -  -  -  -  -  -  -  -  -  -)&ENDLOCAL
ECHO.
:: :: -System: Audio
IF NOT EXIST "%DATA_AUDIO_SYS_MENU%\menuloop.mp3" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: menuloop.mp3 [AUDIO]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: menuloop.mp3 [AUDIO]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
IF NOT EXIST "%DATA_AUDIO_SYS_MENU%\startup.mp3" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: startup.mp3 [AUDIO]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: startup.mp3 [AUDIO]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
IF NOT EXIST "%DATA_AUDIO_SYS%\game\ga-wasted.mp3" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: ga-wasted.mp3 [AUDIO]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: ga-wasted.mp3 [AUDIO]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
:: :: -Ingame: One Horror Dream
IF NOT EXIST "%DATA_AUDIO_1%\m\mu-mysterious-door.mp3" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: mu-mysterious-door.mp3 [AUDIO]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: mu-mysterious-door.mp3 [AUDIO]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
IF NOT EXIST "%DATA_AUDIO_1%\m\mu-suspensemoment.mp3" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: mu-suspensemoment.mp3 [AUDIO]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: mu-scaryatmospher.mp3 [AUDIO]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
IF NOT EXIST "%DATA_AUDIO_1%\m\mu-scaryatmospher.mp3" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: mu-scaryatmospher.mp3 [AUDIO]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: mu-suspensemoment.mp3 [AUDIO]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
IF NOT EXIST "%DATA_AUDIO_1%\e\ef-crowbartool.mp3" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: ef-crowbartool.mp3 [AUDIO]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: ef-crowbartool.mp3 [AUDIO]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
IF NOT EXIST "%DATA_AUDIO_1%\e\ef-pickup.mp3" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: ef-pickup.mp3 [AUDIO]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: ef-pickup.mp3 [AUDIO]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
IF NOT EXIST "%DATA_AUDIO_1%\e\ef-reddooropen.mp3" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: ef-reddooropen.mp3 [AUDIO]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: ef-reddooropen.mp3 [AUDIO]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
IF NOT EXIST "%DATA_AUDIO_1%\e\ef-running.mp3" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: ef-running.mp3 [AUDIO]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: ef-running.mp3 [AUDIO]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
IF NOT EXIST "%DATA_AUDIO_1%\e\ef-unableunlock.mp3" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: ef-unableunlock.mp3 [AUDIO]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: ef-unableunlock.mp3 [AUDIO]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
IF NOT EXIST "%DATA_AUDIO_1%\e\ef-unlock.mp3" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: ef-unlock.mp3 [AUDIO]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: ef-unlock.mp3 [AUDIO]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
:: :: -System: Other
IF NOT EXIST "%DATA_IMAGES%\JailEscapeLogo128.ico" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: JailEscapeLogo128.ico [IMAGE]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: JailEscapeLogo128.ico [IMAGE]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
IF NOT EXIST "%AudioManager%" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: AudioManager.bat [SCRIPT]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: AudioManager.bat [SCRIPT]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
IF NOT EXIST "%SCRIPT_WAIT%" ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%MISSING)&ECHO.: wait.vbs [SCRIPT]&ENDLOCAL ) ELSE ( SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0A%FOUND)&ECHO.: wait.vbs [SCRIPT]&ENDLOCAL&SET /A EXISTFILESNUM+=1 )
ECHO.
ECHO.Found %EXISTFILESNUM% out of 15 required files.
ECHO.
ECHO.Make sure the following:
ECHO.1. Do not run this in a ZIP^(7-Zip^) file or any WinRAR format.
ECHO.2. Make sure the files displayed above exist in the folder you are launching it from. ^(except from shortcuts^)
ECHO.3. If you are running this from a shortcut, make sure the shortcut's DIRECTORY is in the Jail^&Escape folder.
ECHO.4. Make sure the DATA folder is located inside the folder where the Jail^&Escape launcher is.
ECHO.5. If you made sure the above and still haven't found the problem, redownload the game or contact us.
PAUSE>NUL
EXIT
:SHORTCUTCREATE
ECHO.FILES: Generating workal files ...
IF EXIST "%cd%\Jail&Escape.lnk" GOTO READMEFORMAT
ECHO.FILES: Creating Shortcut ...
SET SCSCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
(
	ECHO Set oWS = WScript.CreateObject^("WScript.Shell"^)
	ECHO sLinkFile = "%cd%\Jail&Escape.lnk"
	ECHO Set oLink = oWS.CreateShortcut^(sLinkFile^)
	ECHO oLink.TargetPath = "%cd%\%TARGET%"
	ECHO oLink.WorkingDirectory = "%cd%"
	ECHO oLink.IconLocation = "%DATA_IMAGES%\JailEscapeLogo350.ico"
	ECHO oLink.Save
) > %SCSCRIPT%
CSCRIPT /nologo %SCSCRIPT%
DEL %SCSCRIPT%
:READMEFORMAT
IF EXIST "%READMEFILE%" GOTO STARTCOMPLETED
:README
ENDLOCAL
ECHO.FILES: Creating the Readme File: "\Read Me - JailAEscape.txt" ...
 (
  ECHO.                                     - R E A D   M E -
  ECHO.                                  ^(THIS FILE IS OUTDATED^)
  ECHO.Hey, if you didn't notice, this is the read me file. If you are curious about how things work, read it.
  ECHO.
  ECHO.For any issues or bugs you can contact us at our discord "%PROGRAMDISCORD%".
  ECHO.
  ECHO.- - AUTO SAVING - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ECHO.This game has AUTO-SAVING,
  ECHO.The DATA of this program are saved on this location: "%HTS_DATA%\JAILPLUSESCAPE".
  ECHO.If this is the first time you use a Game or a Program from HTS, then you will notice
  ECHO.that there was added a new folder called HTS_DATA on your APPDATA. Everything you use from HTS
  ECHO.that includes a saving system will be using that directory. Touching these files may cause problems.
  ECHO.You can clear all Saved Data by the command "clear saves" at the Settings. This will not reset any
  ECHO.of the settings or delete any of its files.
  ECHO.How it works: Every time you make progress, a save file will appear in the saves directory.
  ECHO.
  ECHO.- - SETTINGS LAYOUT - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ECHO.You can find the settings by the command "SETT" or "SETTINGS" at the menu.
  ECHO.The settings are saved on this location:
  ECHO.^> "%DATA_SETTINGS%"
  ECHO.
  ECHO.You can turn off sounds by the Settings, type "sounds" to toggle.
  ECHO.- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ECHO.
  ECHO.- - AUDIO MANAGER - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ECHO.Includes audio. Read the changelog for tons of more information about it.
  ECHO.- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ECHO.
  ECHO.- - HOW TO UNINSTALL? - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ECHO.Type uninstall in the menu. This will delete saves, settings and tmp files and will clear the game
  ECHO.- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ECHO.
  ECHO.POSSIBLE ERRORS:
  ECHO.- ERROR_HANDLE_EOF - REACHED THE END OF THE FILE ^(DIDN'T FOLLOW THE LAYOUT^)
  ECHO.- ERROR_BAD_FORMAT - THE PROGRAM WAS NOT READY TO LAUNCH ^(MISSING FILES OR UNABLE TO START-IN^)
  ECHO.- ERROR_OLD_WIN_VERSION - THE SPECIFIED PROGRAM REQUIRES A NEWER VERSION OF WINDOWS. ^(MAKE SURE YOU ARE USING WINDOWS 10^)
  ECHO.
 ) > "%READMEFILE%"
IF EXIST "Read Me - Premade.txt" DEL /Q "Read Me - Premade.txt"
:STARTCOMPLETED
ECHO.FILES: Completed!
CMD /C %*
SET END=%TIME%
SET TIMEROPTIONS="TOKENS=1-4 DELIMS=:.,"
FOR /F %TIMEROPTIONS% %%A IN ("%START%") DO SET /A START_M=100%%B %% 100&SET /A START_S=100%%C %% 100&SET /A START_MS=100%%D %% 100
FOR /F %TIMEROPTIONS% %%A IN ("%END%") DO SET /A END_M=100%%B %% 100&SET /A END_S=100%%C %% 100&SET /A END_MS=100%%D %% 100
SET /A MINS=%END_M%-%START_M%&SET /A SECS=%END_S%-%START_S%&SET /A MS=%END_MS%-%START_MS%
IF %MS% LSS 0 SET /A SECS = %SECS% - 1 & SET /A MS = 100%MS%
IF %SECS% LSS 0 SET /A MINS = %MINS% - 1 & SET /A SECS = 60%SECS%
IF 1%MS% LSS 100 SET MS=0%MS%
SET /A TOTALSECS = %MINS%*60 + %SECS%
ECHO FINISHED: Load took %MINS%:%SECS%.%MS%ms ^(%TOTALSECS%s %MS%ms^)
SET START=
:START
IF /I NOT EXIST "%MAIN_GAME%\USED.dll" (
	ECHO.
	ECHO.- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	ECHO.
	ECHO.PAUSE: Everything was successfuly setted up.&ECHO.   ^(!^) Press any key to continue and to run the game.
	SET /p "=..." <NUL
	ECHO.USED-ONCE=TRUE > "%MAIN_GAME%\USED.dll"
	PAUSE>NUL
	DEL %DATA_SETTINGS%\STARTUPLOGS.dll
)
IF EXIST "%DATA_SETTINGS%\STARTUPLOGS.dll" ( ECHO.&ECHO.- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -&ECHO.&ECHO.PAUSE: Press any key to continue.&PAUSE>NUL )
IF %WIFICONNECTION%==FALSE (
	CLS
	ECHO.- - - - - - - - - - - - - - - - - - - - WARNING - - - - - - - - - - - - - - - - - - - - - -
	ECHO. You are either not connected to Internet, or the connection is too slow!
	ECHO. Network may be required for some tasks such as checking for updates, but not necessary.
	ECHO.
	ECHO. ^(Press any key to continue without any problems^)
	ECHO.- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	PAUSE>NUL
	GOTO WIFISKIP
)
IF EXIST "%DATA_SETTINGS%\CHECKFORUPDATES.dll" GOTO WIFISKIP
IF DEFINED OUTOFDATE IF "%OUTOFDATE%"=="UNRE" (
	CLS
	ECHO.- - - - - - - - - - - - - - - - - - - - WARNING - - - - - - - - - - - - - - - - - - - - - -
	ECHO. Uh oh, seems like the update failed because the file updater was unrecognized or because
	ECHO. GitHub is down. It can also be caused of an unknown error, you can contact us.
	ECHO. If you keep getting this warning, turn off updates from the settings.
	ECHO.- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	PAUSE>NUL
	GOTO WIFISKIP
)
IF DEFINED OUTOFDATE IF "%OUTOFDATE%"=="TRUE" (
	MODE CON:COLS=%COLS% LINES=%LINES%
	ECHO.- - - - - - - - - - - - - - - - - - - - WARNING - - - - - - - - - - - - - - - - - - - - - -
	ECHO. You are using an old version of the game!
	ECHO. ^(X^) Your current version: %VERS%
	ECHO.      ^(^!^) Latest version: %LATESTVERSION%
	ECHO.
	ECHO. Please update the game from the URL below:
	ECHO. %UPDATEURL%
	ECHO.
	ECHO. Updating will fix bugs and improve experience!
	ECHO.
	ECHO. Do you really wish to continue?
	ECHO. ^(Press any key to continue or update from the URL above^)
	ECHO.
	ECHO.- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	PAUSE>NUL
)
IF DEFINED HTS_DIR_ERR IF "%HTS_DIR_ERR%"=="TRUE" (
	MODE CON:COLS=%COLS% LINES=%LINES%
	ECHO.- - - - - - - - - - - - - - - - - - - - WARNING - - - - - - - - - - - - - - - - - - - - - -
	ECHO. There was an error while accessing the HTS APPDATA directory. Because of that, the saves
	ECHO. system will not be able to work properly.
	ECHO.
	ECHO.- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	PAUSE>NUL
)
:WIFISKIP
SET "ERRORLEVEL="
SET "ERRORLVL="
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" ( TASKKILL /F /FI "WINDOWTITLE eq wscript.exe" /T>NUL&START /min "" "%AudioManager%" )
FOR /F "DELIMS=:" %%A IN ('TASKLIST /FI "WINDOWTITLE eq License - JailAEscape.txt*"') DO IF NOT %%A==INFO ECHO.Audio Manager did not start."%LOG_INFO%"
::TITLE Jail^&Escape (Startup)
IF EXIST "%DATA_SETTINGS%\SKIPSTARTCREDITS.dll" GOTO MENU
IF EXIST "%DATA_SETTINGS%\ONANIMATION.dll" ( CLS ) ELSE GOTO SKIPHTS
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" ( SET "ERRORLEVEL="&TASKLIST /FI "IMAGENAME eq wscript.exe" 2>NUL|FIND /I /N "wscript.exe">NUL&SET "ERRORLVL=%ERRORLEVEL%" ) ELSE ( SET ERRORLVL=NUL )
SET "TARGETAUDIO=%DATA_AUDIO_SYS_MENU%\startup.mp3"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
	IF EXIST "%TARGETAUDIO%" (
		IF /I "%ERRORLVL%"=="0" (
			TASKKILL /F /FI "WINDOWTITLE eq wscript.exe" /T>NUL
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		) ELSE IF /I "%ERRORLVL%"=="1" (
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		)
	)
)
 ECHO.-                                                                                         -
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" IF EXIST "%TARGETAUDIO%" (CSCRIPT "%SCRIPT_WAIT%" 50 >NUL)
IF NOT "%WINVER:~0,4%" == "10.0" ( GOTO SKIPHTS )
MODE CON:COLS=%COLS% LINES=%LINES%
CALL "%SCRIPT_HTSANI%"
CSCRIPT "%SCRIPT_WAIT%" 750 >NUL
GOTO MENU
:SKIPHTS
 CLS
 ECHO.%ML1%0F                                -  H T S   S T U D I O S  - 
CSCRIPT "%SCRIPT_WAIT%" 750 >NUL
IF NOT "%WINVER:~0,4%" == "10.0" ( CSCRIPT "%SCRIPT_WAIT%" 1250 >NUL )
:MENU
@ECHO OFF
SET "DIRECTLOG="
TITLE Jail^&Escape
CLS
IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ( COLOR F0 ) ELSE COLOR 0F
REM	IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
REM	TASKKILL /F /FI "WINDOWTITLE eq cmd005" /T >NUL
REM	TASKKILL /F /IM wscript.exe >NUL
REM	START "cmd005" /MIN soundloop.bat >NUL
REM )
SET "ERRORLEVEL="
SET "ERRORLVL="
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" ( SET "ERRORLEVEL="&TASKLIST /FI "IMAGENAME eq wscript.exe" 2>NUL|FIND /I /N "wscript.exe">NUL&SET "ERRORLVL=%ERRORLEVEL%" & TASKKILL /F /IM wscript.exe>NUL ) ELSE ( SET ERRORLVL=NUL & TASKKILL /F /IM wscript.exe>NUL )
SET "TARGETAUDIO=%DATA_AUDIO_SYS_MENU%\menuloop.mp3"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
	IF EXIST "%TARGETAUDIO%" (
		IF /I "%ERRORLVL%"=="0" (
			TASKKILL /F /FI "WINDOWTITLE eq wscript.exe" /T>NUL
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.settings.setMode "loop", True
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		) ELSE IF /I "%ERRORLVL%"=="1" (
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.settings.setMode "loop", True
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		)
	)
)
:REMENU
:: - - - Game Menu - - -
MODE CON:COLS=%COLS% LINES=%LINES%
SETLOCAL ENABLEDELAYEDEXPANSION
IF NOT EXIST "%DATA_SETTINGS%\COLORWHITE.dll" (
(%hcol:?=07%                                -)&(%hcol:?=0E% J A I L)&(%hcol:?=0F%  ^&)&(%hcol:?=0B%  E S C)&(%hcol:?=0C% A P E)&(%hcol:?=07% -\n)
) ELSE (
(%hcol:?=F8%                                -)&(%hcol:?=F6% J A I L)&(%hcol:?=F0%  ^&)&(%hcol:?=F9%  E S C)&(%hcol:?=FC% A P E)&(%hcol:?=F8% -\n))
ENDLOCAL
%XL26%
ECHO. ________________________________/=======================\________________________________
ECHO.^| Enter "PLAY" to start the game          WELCOME          Enter "SETT" for the settings. ^|
%LN%
%LN%
%LN%
%LN%
%LN%
::                                         Font Name: 3D Diagonal
ECHO.^|                                              ,----,                                     ^|
ECHO.^|                                  ,--,      .'   .'^|                                     ^|
ECHO.^|                                ,--.'^|    .'   .'  ^| .--.--.                             ^|
ECHO.^|                             ,--,  ^| :  .'   .'    //  /    '.                           ^|
ECHO.^|                          ,---.'^|  : ','___,'    ,'^|  :  /`. /                           ^|
ECHO.^|                          ^|   ^| :  ; ^|^|    ^|     ^| ;  ^|  ^|--`                            ^|
ECHO.^|                          :   : ^|.'  ^|^|    ^|.';  ; ^|  :  ;_                              ^|
ECHO.^|                          ^|   ' '  , :`----'  ^|  ^|  \  \    `.                           ^|
ECHO.^|                          :   ^|  .': ^|    ^|   :  ;   `----.   \                          ^|
ECHO.^|                          ^|   ^| :  ^| :    ^|   ^|  '   __ \  \  ^|                          ^|
ECHO.^|                          ^|   : ^|  : ;    ^|   :  ^|  /  /`--'  /                          ^|
ECHO.^|                          ^|   ^| :  :/     :   ^|.'  '--'.     /                           ^|
ECHO.^|                          ;   : ;--'      '---'      `--`---'                            ^|
ECHO.^|                          ^|   ^|/                                                         ^|
ECHO.^|                          '---'                                                          ^|
%LN%
%LN%
::                                                                         Font Name: Small
::																		 __   ____  _ _ ____ __  
:: 																		 \ \ / /  \| | |__ //  \ 
:: 																		  \ V / () |_  _|_ \ () |
:: 																		   \_/ \__(_)|_|___/\__/                          
ECHO.^|______________________________                                 __   ____  _ _ ____ __    ^|
ECHO.^|                              ^|                                \ \ / /  \^| ^| ^|__ //  \   ^|
ECHO.^| This game has AUTO-SAVING    ^|                                 \ V / () ^|_  _^|_ \ () ^|  ^|
ECHO.^| Type "Read Me" for more info ^|                                  \_/ \__(_)^|_^|___/\__/   ^|
ECHO.^|______________________________^|                                                          ^|
%LN%
%LN%
%LN%
%LN%
%LN%
SETLOCAL ENABLEDELAYEDEXPANSION
IF DEFINED DIRECTLOG ( SET /P "=| "<NUL&IF NOT EXIST "%DATA_SETTINGS%\COLORWHITE.dll" (
(%hcol:?=0C%This option doesn't exist)) ELSE ((%hcol:?=F4%This option doesn't exist))) ELSE (SET /P "=|                          "<NUL)
ENDLOCAL
ECHO.                                Copyright (C) 2019 HTS-Studios ^|
ECHO.^|_________________________________________________________________________________________^|
SETLOCAL ENABLEDELAYEDEXPANSION
CALL "%SCRIPT_FACT%"
IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=F1%Type here)) ELSE ((%hcol:?=0B%Type here))
ENDLOCAL
SET UDERFINE=
SET DIRECTLOG=
SET /P UDERFINE=: 
 IF NOT DEFINED UDERFINE GOTO REMENU
  IF /I "%UDERFINE%"==" " GOTO REMENU
 IF /I "%UDERFINE%"=="RELOAD" GOTO RELOADED
  IF /I "%UDERFINE%"=="RESTART" GOTO RELOADED
   IF /I "%UDERFINE%"=="REL" GOTO RELOADED
 IF /I "%UDERFINE%"=="CLOSE" GOTO EXIT
  IF /I "%UDERFINE%"=="STOP" GOTO EXIT
   IF /I "%UDERFINE%"=="EXIT" GOTO EXIT
    IF /I "%UDERFINE%"=="EXI" GOTO EXIT
     IF /I "%UDERFINE%"=="E" GOTO EXIT
	  IF /I "%UDERFINE%"=="QUIT" GOTO EXIT
 IF /I "%UDERFINE%"=="STARTGAME" GOTO GAME-WORKER
  IF /I "%UDERFINE%"=="START GAME" GOTO GAME-WORKER
   IF /I "%UDERFINE%"=="START THE GAME" GOTO GAME-WORKER
    IF /I "%UDERFINE%"=="PLAYGAME" GOTO GAME-WORKER
     IF /I "%UDERFINE%"=="PLAY GAME" GOTO GAME-WORKER
      IF /I "%UDERFINE%"=="PLAY THE GAME" GOTO GAME-WORKER
       IF /I "%UDERFINE%"=="P" GOTO GAME-WORKER
	    IF /I "%UDERFINE%"=="PLAY" GOTO GAME-WORKER
		 IF /I "%UDERFINE%"=="START" GOTO GAME-WORKER
 IF /I "%UDERFINE%"=="HERE" GOTO HERE
 IF /I "%UDERFINE%"=="SETT" GOTO SSETTINGS
  IF /I "%UDERFINE%"=="SET" GOTO SSETTINGS
   IF /I "%UDERFINE%"=="S" GOTO SSETTINGS
    IF /I "%UDERFINE%"=="SETTINGS" GOTO SSETTINGS
     IF /I "%UDERFINE%"=="SETTING" GOTO SSETTINGS
 IF /I "%UDERFINE%"=="README" ( IF EXIST "%READMEFILE%" ( START "" "%READMEFILE%" & GOTO MENU ) ELSE ( CLS & GOTO README ) )
  IF /I "%UDERFINE%"=="READ ME" ( IF EXIST "%READMEFILE%" ( START "" "%READMEFILE%" & GOTO MENU ) ELSE ( CLS & GOTO README ) )
 IF /I "%UDERFINE%"=="CLEARALL" GOTO CLEARDATA
  IF /I "%UDERFINE%"=="UNINSTALL" GOTO CLEARDATA
 IF /I "%UDERFINE%"=="CLEARSAVES" GOTO CLEARSAVES
  IF /I "%UDERFINE%"=="DELETEDATA" GOTO CLEARDATA
   IF /I "%UDERFINE%"=="DELETESAVES" GOTO CLEARDATA
 IF /I "%UDERFINE%"=="UPDATE" GOTO MANUALUPDATE
  IF /I "%UDERFINE%"=="UPDATES" GOTO MENU
   IF /I "%UDERFINE%"=="CHECK FOR UPDATES" GOTO MANUALUPDATE
    IF /I "%UDERFINE%"=="CHECK FOR UPDATE" GOTO MANUALUPDATE
	 IF /I "%UDERFINE%"=="CHECK UPDATE" GOTO MANUALUPDATE
	  IF /I "%UDERFINE%"=="CHECK UPDATES" GOTO MANUALUPDATE
	   IF /I "%UDERFINE%"=="UPDATER" GOTO MENU
 IF /I "%UDERFINE%"=="CREDITS" GOTO CREDITS
 IF /I "%UDERFINE%"=="REFRESH" GOTO WIFISKIP
 IF /I "%UDERFINE%"=="CLEARFILES" GOTO CLEARFILESONLY
::Developer Commands, I recommend you not to use them.
 IF /I "%UDERFINE%"=="FIX" MODE CON:COLS=%COLS% LINES=%LINES%&GOTO MENU
 IF /I "%UDERFINE%"=="DEVWASTED" GOTO WASTED
 IF /I "%UDERFINE%"=="DEVESCAPED" GOTO ESCAPED
 IF /I "%UDERFINE%"=="DEVTEST" GOTO DEV
 IF /I "%UDERFINE%"=="DEVREADME" GOTO README
 IF /I "%UDERFINE%"=="DEVCLEAR" GOTO CLEARALLDEV
 IF /I "%UDERFINE%"=="DEVFILES" GOTO FILESMISSING
 IF /I "%UDERFINE:~0,7%"=="DEVDLC " GOTO DLC-LOADER
::IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ( COLOR FC ) ELSE ( COLOR 0C )
SET "DIRECTLOG=TRUE"
GOTO REMENU
:: -=- DEV -=-
:DEV
SET /p "=| "<NUL
SETLOCAL ENABLEDELAYEDEXPANSION
(%hcol:?=0C%star)
ENDLOCAL
SET /p "=LOL"<NUL
SET /p "=|"<NUL
ECHO.huh
PAUSE>NUL
GOTO DEV
::DLC Loader
:DLC-LOADER
MODE CON:COLS=%COLS% LINES=%LINES%
FOR /F %%A IN ('DIR /B /AD "%DLC-LO%"^|FIND /C /V "" ') DO SET COUNT_DLC=%%A
DIR /A:D "%DLC_LO%" /B
IF %COUNT_DLC% EQU 0 ( ECHO.^(EMPTY^) ) ELSE IF %COUNT_DLC% LSS %MAX_DLC% (
	ECHO.- -                       - -
	ECHO.Choose a DLC from above. ALPHA FEATURE
    ECHO.Counted %COUNT_DLCS% out of max %MAX_DLC% possible shown profiles.
) ELSE IF %COUNT_DLC% GEQ %MAX_DLC% (
	ECHO.- -                       - -
	ECHO.Choose a DLC from above. ALPHA FEATURE
    ECHO.Unable to show all DLC. ^(%COUNT_DLCS%/%MAX_DLCS%^)
)
SET DLC_ERROR=
SET DLC_WARN=
SET DLC_CHOISE=
SET /P DLC_CHOISE=: 
 IF NOT DEFINED DLC_CHOISE GOTO REMENU
  IF /I "%DLC_CHOISE%"==" " GOTO REMENU
IF NOT EXIST "%DLC_LO%\%DLC_CHOISE%" GOTO DLC-LOADER
CALL "%DLC_LO%\%DLC_CHOISE%.inf.cmd"
IF NOT DLC_KEY EQU 0 (
	SET DLC_ERROR=INVALID_DLC_KEY
	SET DLC_WARN=DLC_INNER_ERROR
)
IF DEFINED DLC_ERROR (
	CLS
	ECHO.X=Msgbox^("%DLC_ERROR%",0+48,"%DLC_WARN%"^)> "%DATA_TMP%\TMP_BOX.vbs"
	ECHO.%TIME% Invalid var DLC_KEY provided while accessing the DLC "%DLC_CHOISE%" ^(=%DLC_KEY% . ERROR:%DLC_ERROR% . WARN:%DLC_WARN%^)>>"%LOG_ERROR%"
	START /wait "" "%DATA_TMP%\TMP_BOX.vbs"
	DEL /Q "%DATA_TMP%\TMP_BOX.vbs"
	GOTO REMENU
)
CALL "%DLC_LO%\%DLC_CHOISE%.cmd"
PAUSE
GOTO MENU
:EXIT
CLS
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" TASKKILL /F /IM wscript.exe
EXIT
:HERE
MODE CON:COLS=%COLS% LINES=%LINES%
SETLOCAL ENABLEDELAYEDEXPANSION
CALL :COLORTEXT 4F "Where"
ENDLOCAL
ECHO.?
PING 1.1.1.1 -n 2 -w 500 >NUL
GOTO MENU
:MANUALUPDATE
MODE CON:COLS=%COLS% LINES=%LINES%
ECHO.Retrieving data ...
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
 TASKKILL /F /FI "WINDOWTITLE eq cmd005" /T >NUL
 TASKKILL /F /IM wscript.exe >NUL
)
PING www.google.nl -n 1 -w 1000 >NUL
IF ERRORLEVEL 1 (SET WIFICONNECTION=FALSE) ELSE (SET WIFICONNECTION=EMPTY)
IF %WIFICONNECTION%==FALSE (
	CLS
	ECHO. Failed! You are not connected to internet!
	ECHO. Couldn't check for updates. Please try again later.
	ECHO.
	ECHO. ^(Press any key to go back^)
	PAUSE>NUL
	GOTO MENU
)
CLS
ECHO.               - UPDATER -
ECHO.
ECHO.*Retrieving data from GitHub via HTTPS ...
ECHO.
CURL -s https://raw.githubusercontent.com/136MasterNR/JailAEscape-UpdateCheck/master/JailAEscapeUpdater.cmd --ssl-no-revoke >UpdateVersionINFO.cmd
>NUL FIND /I "SET LATESTVERSION=" UpdateVersionINFO.cmd && (
	CALL UpdateVersionINFO.cmd
	DEL /Q UpdateVersionINFO.cmd
)||(
	FOR %%R IN (UpdateVersionINFO.cmd) DO IF %%~zR LSS 1 ( ECHO. Failed to check for updates because the information was empty.
	) ELSE ( ECHO.UPDATER: Failed to check for updates because the information was not recognized. )
	DEL /Q UpdateVersionINFO.cmd
	ECHO.
	ECHO. ^(Press any key to go back^)
	PAUSE>NUL
	GOTO MENU
)
IF "%LATESTVERSION%"=="%VERS%" (
	SETLOCAL ENABLEDELAYEDEXPANSION
	IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=F2% You are running the latest version of the game)) ELSE ((%hcol:?=0A% You are running the latest version of the game))
	ENDLOCAL
) ELSE (
	SETLOCAL ENABLEDELAYEDEXPANSION
	IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=FC% You are not running the latest version of the game)) ELSE ((%hcol:?=0C% You are not running the latest version of the game))
	ENDLOCAL
)
ECHO.!
ECHO. Current Version: %VERS%
ECHO. Latest Version: %LATESTVERSION%
ECHO. Update URL: %UPDATEURL%
ECHO. Realese Date: %UPDATERELEASEDATE%
ECHO.
ECHO. More Details: %UPDATEDETAILS%
ECHO.
ECHO. ^(Press any key to go back^)
PAUSE>NUL
GOTO MENU
PAUSE
::-del
:CLEARFILESONLY
SET CLEARFILES=TRUE
GOTO CLEARDATA
:CLEARALLDEV
SET DEVMOMMENT=TRUE
:CLEARDATA
MODE CON:COLS=%COLS% LINES=%LINES%
ECHO.Cleaning all game installations and saves from the following directories:
ECHO.- %CD:~0,89%
ECHO.- %DATA_SAVES:~0,89%
ECHO.- %DATA_SETTINGS:~0,89%
TASKKILL /F /FI "WINDOWTITLE eq cmd005" /T >NUL
TASKKILL /F /IM wscript.exe >NUL
 DEL /Q "Jail&Escape.lnk"
 DEL /Q "soundloop.bat"
 DEL /Q "soundplayer-scaryatmospher.bat"
 IF EXIST "ERRORS.txt" ( DEL "ERRORS.txt" )
IF "%CLEARFILES%"=="TRUE" ( EXIT )
 DEL /Q "%MAIN_GAME%\USED.dll"
 DEL /Q "%READMEFILE%"
 @RD /S /Q "%DATA_SETTINGS%"
 @RD /S /Q "%DATA_SAVES%"
 @RD /S /Q "%MAIN_GAME%"
ECHO.Successfuly cleaned up the requested directories.
TIMEOUT /T 8
IF "%DEVMOMMENT%"=="TRUE" ( GOTO RELOADED )
EXIT
:CLEARSAVES
MODE CON:COLS=%COLS% LINES=%LINES%
ECHO. Cleaning up the Saves Directory: "%DATA_SAVES:~0,89%"
TASKKILL /F /FI "WINDOWTITLE eq cmd005" /T
TASKKILL /F /IM wscript.exe
 DEL /Q "%DATA_SAVES%\*"
ECHO. Successfuly cleared all Data from the Saves Directory.
TIMEOUT /T 3
GOTO RELOADED
:LAUNCHREADME
IF EXIST "%READMEFILE%" (
 START "" "%READMEFILE%"
 GOTO MENU
) ELSE (
 CLS
 GOTO RELOADED
)
:: - - - SETTINGS - - -
:SSETTINGS
SET "STBEFOREANSWER"="(Nothing)"
:SETTINGS
CLS
SET FASTSETTING-QU=
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
	TASKKILL /F /FI "WINDOWTITLE eq cmd005" /T >NUL
	TASKKILL /F /IM wscript.exe >NUL
)
IF DEFINED HTS_DIR_ERR IF "%HTS_DIR_ERR%"=="TRUE" (
	MODE CON:COLS=%COLS% LINES=%LINES%
	ECHO.- - - - - - - - - - - - - - - - - - - - WARNING - - - - - - - - - - - - - - - - - - - - - -
	ECHO. There was an error while accessing the HTS APPDATA directory. Because of that, the
	ECHO. settings will not be able to load and the game will not be able to read any information.
	ECHO.
	ECHO.- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	PAUSE>NUL
)
:RESETTINGS
IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ( COLOR F0 ) ELSE COLOR 0F
 SET SLS=^^^|---------------------^^^|------^^^|------------------------------------------------------------^^^|
 SET LSL=^^^|                     ^^^|      ^^^|                                                            ^^^|
MODE CON:COLS=%COLS% LINES=%LINES%
 ECHO.                                    - S E T T I N G S -
 ECHO. ____________________________________/===============\____________________________________
 ECHO.^|    SETTING NAME     ^|STATUS^|                           USAGE                            ^|
 ECHO.%SLS%
SET /p "=|     Play Audio      | " <NUL
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (SETLOCAL ENABLEDELAYEDEXPANSION&IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=F2%ON)&ENDLOCAL) ELSE ((%hcol:?=0A%ON)&ENDLOCAL)
) ELSE (SETLOCAL ENABLEDELAYEDEXPANSION&IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" IF "%NOAUDIO%"=="TRUE" ((%hcol:?=F4%LOCK)&ENDLOCAL) ELSE ((%hcol:?=FC%OFF)&ENDLOCAL
) ELSE IF "%NOAUDIO%"=="TRUE" ((%hcol:?=04%LOCK)&ENDLOCAL) ELSE ((%hcol:?=0C%OFF )&ENDLOCAL))
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" ( ECHO.   ^| Type "audio" to toggle.                                    ^|) ELSE IF "%NOAUDIO%"=="TRUE" (
	ECHO. ^| Your device doesn't meet the audio requirements.           ^|
) ELSE ( ECHO.  ^| Type "audio" to toggle.                            ^(Muted^) ^|)
 ECHO.%SLS%
IF NOT %VOLUME% LSS 10 (SET "SPACE= ") ELSE (SET "SPACE=  ")
SET /p "=|    Audio Volume     |%SPACE%" <NUL
SETLOCAL ENABLEDELAYEDEXPANSION&IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ( IF %VOLUME% LSS 50 ((%hcol:?=F6%%VOLUME%)) ELSE ((%hcol:?=F2%%VOLUME%))&ENDLOCAL) ELSE ( IF %VOLUME% LSS 80 ((%hcol:?=0E%%VOLUME%)) ELSE ((%hcol:?=0A%%VOLUME%))&ENDLOCAL)
IF NOT %VOLUME% LSS 10 ( IF NOT %VOLUME%==100 ( IF %VOLUME% GEQ 10 (SET "SPACE=   ") ) ELSE ( SET "SPACE=  " ) ) ELSE (SET "SPACE=   ")
ECHO.%SPACE%^| Type "volume [number]" to adjust the volume.      ^(20-100^) ^|
 ECHO.%SLS%
SET /p "=|   Text Animation    | " <NUL
IF EXIST "%DATA_SETTINGS%\ONANIMATION.dll" (SETLOCAL ENABLEDELAYEDEXPANSION&IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=F2%ON)) ELSE ((%hcol:?=0A%ON)&ENDLOCAL)
) ELSE (SETLOCAL ENABLEDELAYEDEXPANSION&IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=FC%OFF)&ENDLOCAL) ELSE ((%hcol:?=0C%OFF)&ENDLOCAL))
 IF EXIST "%DATA_SETTINGS%\ONANIMATION.dll" (ECHO.   ^| Type "text" to toggle.                                     ^|
) ELSE ( ECHO.  ^| Type "text" to toggle.                                     ^|)
 ECHO.%SLS%
SET /p "=|  Check for Updates  | " <NUL
IF EXIST "%DATA_SETTINGS%\CHECKFORUPDATES.dll" (SETLOCAL ENABLEDELAYEDEXPANSION&IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=FC%OFF)&ENDLOCAL) ELSE ((%hcol:?=0C%OFF)&ENDLOCAL)
) ELSE (SETLOCAL ENABLEDELAYEDEXPANSION&IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=F2%ON)&ENDLOCAL) ELSE ((%hcol:?=0A%ON)&ENDLOCAL))
 IF EXIST "%DATA_SETTINGS%\CHECKFORUPDATES.dll" (ECHO.  ^| Type "updates" to toggle.                                  ^|
) ELSE ( ECHO.   ^| Type "updates" to toggle.                                  ^|)
 ECHO.%SLS%
SET /p "=|     White Theme     | " <NUL
IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" (SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=F2%ON)&ENDLOCAL
) ELSE (SETLOCAL ENABLEDELAYEDEXPANSION&(%hcol:?=0C%OFF)&ENDLOCAL)
 IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" (ECHO.   ^| Type "theme" to toggle.                           ^(Bright^) ^|
) ELSE ( ECHO.  ^| Type "theme" to toggle.                             ^(Dark^) ^|)
 ECHO.%SLS%
SET /p "=|    Startup Logs     | " <NUL
IF EXIST "%DATA_SETTINGS%\STARTUPLOGS.dll" (SETLOCAL ENABLEDELAYEDEXPANSION&IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=F2%ON)&ENDLOCAL) ELSE ((%hcol:?=0A%ON)&ENDLOCAL)
) ELSE (SETLOCAL ENABLEDELAYEDEXPANSION&IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=FC%OFF)&ENDLOCAL) ELSE ((%hcol:?=0C%OFF)&ENDLOCAL))
 IF EXIST "%DATA_SETTINGS%\STARTUPLOGS.dll" (ECHO.   ^| Type "logs" to toggle.                                     ^|
) ELSE ( ECHO.  ^| Type "logs" to toggle.                                     ^|)
 ECHO.%SLS%
SET /p "=|    Skip Credits     | " <NUL
IF EXIST "%DATA_SETTINGS%\SKIPSTARTCREDITS.dll" (SETLOCAL ENABLEDELAYEDEXPANSION&IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=F2%ON)&ENDLOCAL) ELSE ((%hcol:?=0A%ON)&ENDLOCAL)
) ELSE (SETLOCAL ENABLEDELAYEDEXPANSION&IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=FC%OFF)&ENDLOCAL) ELSE ((%hcol:?=0C%OFF)&ENDLOCAL))
 IF EXIST "%DATA_SETTINGS%\SKIPSTARTCREDITS.dll" (ECHO.   ^| Type "credits" to toggle.                                  ^|
) ELSE ( ECHO.  ^| Type "credits" to toggle.                                  ^|)
ENDLOCAL
 ECHO.%SLS%
 ECHO.%LSL%
 ECHO.%SLS%
 ECHO.%LSL%
 ECHO.%SLS%
 ECHO.%LSL%
 ECHO.%SLS%
 ECHO.%LSL%
 ECHO.%SLS%
 ECHO.%LSL%
 ECHO.%SLS%
SET /p "=|   Quick Settings    |  " <NUL
IF EXIST "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll" (SETLOCAL ENABLEDELAYEDEXPANSION&IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=F2%1)) ELSE ((%hcol:?=0A%1))&ENDLOCAL
) ELSE (SETLOCAL ENABLEDELAYEDEXPANSION&IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=FC%0)) ELSE ((%hcol:?=0C%0))&SETLOCAL ENABLEDELAYEDEXPANSION&ENDLOCAL)
 ECHO.   ^| Type "FAST" to use. Made for slow PCs.                     ^|
 ECHO.^|_____________________^|______^|____________________________________________________________^|
 ECHO.^|                     ^|                                                                   ^|
 ECHO.^|    Clear your saves ^| Clear your Saves with "clearsaves"                                ^|
 ECHO.^|       Or everything ^| Clear everything with "clearall"                                  ^|
 ECHO.^|_____________________^|___________________________________________________________________^|
 ECHO.^|                                                                                         ^|
SETLOCAL ENABLEDELAYEDEXPANSION
IF DEFINED DIRECTLOG ( SET /P "=| "<NUL&IF NOT EXIST "%DATA_SETTINGS%\COLORWHITE.dll" (
	(%hcol:?=0C%This setting doesn't exist)) ELSE ((%hcol:?=F4%This setting doesn't exist))
) ELSE (SET /P "=|                           "<NUL)
ENDLOCAL
ECHO.                                                              ^|
 ECHO.^|_________________________________________________________________________________________^|
SETLOCAL ENABLEDELAYEDEXPANSION
IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ((%hcol:?=F1%Type a setting)&ENDLOCAL) ELSE ((%hcol:?=0B%Type a setting)&ENDLOCAL)&ENDLOCAL
SET UDERFINE=
SET DIRECTLOG=
SET /P UDERFINE=: 
 IF NOT DEFINED UDERFINE GOTO RESETTINGS
 IF /I "%UDERFINE%"=="MENU" GOTO MENU
  IF /I "%UDERFINE%"=="MAIN" GOTO MENU
   IF /I "%UDERFINE%"=="BACK" GOTO MENU
    IF /I "%UDERFINE%"=="B" GOTO MENU
	 IF /I "%UDERFINE%"=="LEAVE" GOTO MENU
 IF /I "%UDERFINE%"=="EXIT" GOTO EXIT
  IF /I "%UDERFINE%"=="EXI" GOTO EXIT
   IF /I "%UDERFINE%"=="E" GOTO EXIT
 IF /I "%UDERFINE%"=="COLOR" GOTO TOGGLECOLOR
  IF /I "%UDERFINE%"=="COLORS" GOTO TOGGLECOLOR
   IF /I "%UDERFINE%"=="THEME" GOTO TOGGLECOLOR
    IF /I "%UDERFINE%"=="WHITE" GOTO TOGGLECOLOR
     IF /I "%UDERFINE%"=="WHITETHEME" GOTO TOGGLECOLOR
      IF /I "%UDERFINE%"=="WHITE THEME" GOTO TOGGLECOLOR
	   IF /I "%UDERFINE%"=="W" GOTO TOGGLECOLOR
 IF /I "%UDERFINE%"=="SOUND" GOTO TOGGLESOUNDS
  IF /I "%UDERFINE%"=="SOUNDS" GOTO TOGGLESOUNDS
   IF /I "%UDERFINE%"=="MUSIC" GOTO TOGGLESOUNDS
    IF /I "%UDERFINE%"=="PLAY AUDIO" GOTO TOGGLESOUNDS
	  IF /I "%UDERFINE%"=="AUDIO" GOTO TOGGLESOUNDS
	   IF /I "%UDERFINE%"=="A" GOTO TOGGLESOUNDS
 IF /I "%UDERFINE%"=="TEXT" GOTO TOGGLETEXTANIMATION
  IF /I "%UDERFINE%"=="ANIMATION" GOTO TOGGLETEXTANIMATION
   IF /I "%UDERFINE%"=="ANIMATIONS" GOTO TOGGLETEXTANIMATION
    IF /I "%UDERFINE%"=="TEXTANIMATION" GOTO TOGGLETEXTANIMATION
     IF /I "%UDERFINE%"=="ANI" GOTO TOGGLETEXTANIMATION
	  IF /I "%UDERFINE%"=="ANIM" GOTO TOGGLETEXTANIMATION
	   IF /I "%UDERFINE%"=="TEXT ANIMATIONS" GOTO TOGGLETEXTANIMATION
	    IF /I "%UDERFINE%"=="TEXT ANIMATION" GOTO TOGGLETEXTANIMATION
		 IF /I "%UDERFINE%"=="TEXT ANI" GOTO TOGGLETEXTANIMATION
		  IF /I "%UDERFINE%"=="TXT ANI" GOTO TOGGLETEXTANIMATION
		   IF /I "%UDERFINE%"=="TXT ANIMATION" GOTO TOGGLETEXTANIMATION
		    IF /I "%UDERFINE%"=="TXT ANIMATIONS" GOTO TOGGLETEXTANIMATION
		     IF /I "%UDERFINE%"=="TA" GOTO TOGGLETEXTANIMATION
			  IF /I "%UDERFINE%"=="T" GOTO TOGGLETEXTANIMATION
 IF /I "%UDERFINE%"=="LOGS" GOTO TOGGLELOGS
  IF /I "%UDERFINE%"=="LOG" GOTO TOGGLELOGS
   IF /I "%UDERFINE%"=="L" GOTO TOGGLELOGS
    IF /I "%UDERFINE%"=="STARTUP" GOTO TOGGLELOGS
     IF /I "%UDERFINE%"=="SHOWLOGS" GOTO TOGGLELOGS
      IF /I "%UDERFINE%"=="SHOWLOG" GOTO TOGGLELOGS
       IF /I "%UDERFINE%"=="SHOW LOG" GOTO TOGGLELOGS
        IF /I "%UDERFINE%"=="SHOW LOGS" GOTO TOGGLELOGS
		 IF /I "%UDERFINE%"=="SHOW LO" GOTO TOGGLELOGS
          IF /I "%UDERFINE%"=="STARTUPLOGS" GOTO TOGGLELOGS
           IF /I "%UDERFINE%"=="STARTUP LOGS" GOTO TOGGLELOGS
            IF /I "%UDERFINE%"=="STARTUP LOG" GOTO TOGGLELOGS
             IF /I "%UDERFINE%"=="STARTUP LO" GOTO TOGGLELOGS
	          IF /I "%UDERFINE%"=="STARTUP L" GOTO TOGGLELOGS
	           IF /I "%UDERFINE%"=="STARTUPL" GOTO TOGGLELOGS
                IF /I "%UDERFINE%"=="START" GOTO TOGGLELOGS
 IF /I "%UDERFINE%"=="CLEARALL" GOTO CLEARDATA
  IF /I "%UDERFINE%"=="CLEAR ALL" GOTO CLEARDATA
   IF /I "%UDERFINE%"=="CLEAREVERYTHING" GOTO CLEARDATA
    IF /I "%UDERFINE%"=="CLEAR EVERYTHING" GOTO CLEARDATA
 IF /I "%UDERFINE%"=="CLEARSAVES" GOTO CLEARSAVES
  IF /I "%UDERFINE%"=="CLEAR SAVES" GOTO CLEARSAVES
 IF /I "%UDERFINE%"=="CLEARFILES" GOTO CLEARFILES
  IF /I "%UDERFINE%"=="UNINSTALL" GOTO CLEARDATA
 IF /I "%UDERFINE%"=="APPLY" GOTO RELOADED
  IF /I "%UDERFINE%"=="APPL" GOTO RELOADED
   IF /I "%UDERFINE%"=="APLY" GOTO RELOADED
    IF /I "%UDERFINE%"=="APL" GOTO RELOADED
	 IF /I "%UDERFINE%"=="RELOAD" GOTO RELOADED
	  IF /I "%UDERFINE%"=="REL" GOTO RELOADED
 IF /I "%UDERFINE%"=="CREDITS" GOTO TOGGLECREDITS
  IF /I "%UDERFINE%"=="CREDIT" GOTO TOGGLECREDITS
   IF /I "%UDERFINE%"=="CRED" GOTO TOGGLECREDITS
    IF /I "%UDERFINE%"=="CR" GOTO TOGGLECREDITS
	 IF /I "%UDERFINE%"=="SK" GOTO TOGGLECREDITS
	  IF /I "%UDERFINE%"=="SKIP" GOTO TOGGLECREDITS
       IF /I "%UDERFINE%"=="SKIP CREDITS" GOTO TOGGLECREDITS
 IF /I "%UDERFINE%"=="UPDATES" GOTO CHECKFORUPDATES
  IF /I "%UDERFINE%"=="UPDATE" GOTO CHECKFORUPDATES
   IF /I "%UDERFINE%"=="CHECK FOR UPDATES" GOTO CHECKFORUPDATES
    IF /I "%UDERFINE%"=="CHECK" GOTO CHECKFORUPDATES
	 IF /I "%UDERFINE%"=="CHECK FOR" GOTO CHECKFORUPDATES
	  IF /I "%UDERFINE%"=="CHECK FOR " GOTO CHECKFORUPDATES
	   IF /I "%UDERFINE%"=="CHECK " GOTO CHECKFORUPDATES
	    IF /I "%UDERFINE%"==" UPDATES" GOTO CHECKFORUPDATES
		 IF /I "%UDERFINE%"==" UPDATE" GOTO CHECKFORUPDATES
		  IF /I "%UDERFINE%"=="UPDATES " GOTO CHECKFORUPDATES
		   IF /I "%UDERFINE%"=="UPDATE " GOTO CHECKFORUPDATES
		    IF /I "%UDERFINE%"=="C" GOTO CHECKFORUPDATES
	         IF /I "%UDERFINE%"=="CFU" GOTO CHECKFORUPDATES
 IF /I "%UDERFINE%"=="FAST" GOTO FASTSETTINGS
  IF /I "%UDERFINE%"=="FAST SETTINGS" GOTO FASTSETTINGS
   IF /I "%UDERFINE%"=="QUICK SETTINGS" GOTO FASTSETTINGS
    IF /I "%UDERFINE%"=="FAST SETTING" GOTO FASTSETTINGS
	 IF /I "%UDERFINE%"=="QUICK SETTING" GOTO FASTSETTINGS
	  IF /I "%UDERFINE%"=="FASTSETTINGS" GOTO FASTSETTINGS
	   IF /I "%UDERFINE%"=="FASTSETTING" GOTO FASTSETTINGS
	    IF /I "%UDERFINE%"=="QUICK" GOTO FASTSETTINGS
	     IF /I "%UDERFINE%"=="QU" GOTO FASTSETTINGS-QU
 IF /I "%UDERFINE%"=="UNLOCKACHIEVEMENT" GOTO UNLOCKACHIEVEMENT
 IF /I "%UDERFINE%"=="LOCKAUDIO" SET "NOAUDIO=TRUE"
 IF /I "%UDERFINE%"=="UNLOCKAUDIO" SET "NOAUDIO="
 IF /I "%UDERFINE:~0,7%"=="VOLUME " CLS&GOTO CHANGE-VOLUME
SET "DIRECTLOG=TRUE"
GOTO SETTINGS
:FASTSETTINGS-QU
DEL /Q "%DATA_SETTINGS%\ONSOUNDS.dll"
SET FASTSETTING-QU=TRUE
:FASTSETTINGS
ECHO.USED=TRUE > "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll"
IF NOT "%FASTSETTING-QU%"=="TRUE" IF NOT "NOAUDIO"=="TRUE" (ECHO.SOUNDS==TRUE> "%DATA_SETTINGS%\ONSOUNDS.dll")
DEL /Q "%DATA_SETTINGS%\COLORWHITE.dll"
DEL /Q "%DATA_SETTINGS%\STARTUPLOGS.dll"
DEL /Q "%DATA_SETTINGS%\CHECKFORUPDATES.dll"
DEL /Q "%DATA_SETTINGS%\ONANIMATION.dll"
::(
:: ECHO.ANIMATION==TRUE
::) > "%DATA_SETTINGS%\ONANIMATION.dll"
ECHO.STARTUPCREDITS==TRUE > "%DATA_SETTINGS%\SKIPSTARTCREDITS.dll"
GOTO SETTINGS
:TOGGLECOLOR
IF EXIST "%DATA_SETTINGS%\COLORWHITE.dll" ( DEL %DATA_SETTINGS%\COLORWHITE.dll ) ELSE ( ECHO.WHITETHEME==TRUE > "%DATA_SETTINGS%\COLORWHITE.dll" )
IF EXIST "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll" ( DEL /Q "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll" )
GOTO SETTINGS
:TOGGLESOUNDS
IF "%NOAUDIO%"=="TRUE" (
	CLS
	ECHO.X=Msgbox^("Audio is unsupported on your device due to lack of audio requirements for this program.",0+48,"Audio is unsupported."^)> "%DATA_TMP%\TMP_BOX.vbs"
	START /wait "" "%DATA_TMP%\TMP_BOX.vbs"
	DEL /Q "%DATA_TMP%\TMP_BOX.vbs"
	GOTO SETTINGS
)
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" ( DEL %DATA_SETTINGS%\ONSOUNDS.dll ) ELSE ( 
	ECHO.SOUNDS==TRUE > "%DATA_SETTINGS%\ONSOUNDS.dll"
	START /min "" "%AudioManager%"
)
IF EXIST "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll" ( DEL /Q "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll" )
GOTO SETTINGS
:TOGGLETEXTANIMATION
IF EXIST "%DATA_SETTINGS%\ONANIMATION.dll" (
DEL %DATA_SETTINGS%\ONANIMATION.dll
) ELSE ( ECHO.ANIMATION=TRUE > "%DATA_SETTINGS%\ONANIMATION.dll" )
IF EXIST "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll" (DEL /Q "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll")
GOTO SETTINGS
:TOGGLELOGS
IF EXIST "%DATA_SETTINGS%\STARTUPLOGS.dll" (
 DEL %DATA_SETTINGS%\STARTUPLOGS.dll
) ELSE ( ECHO.STARTUPLOGS=TRUE > "%DATA_SETTINGS%\STARTUPLOGS.dll" )
IF EXIST "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll" (DEL /Q "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll")
GOTO SETTINGS
:TOGGLECREDITS
IF EXIST "%DATA_SETTINGS%\SKIPSTARTCREDITS.dll" (
 DEL %DATA_SETTINGS%\SKIPSTARTCREDITS.dll
) ELSE ( ECHO.STARTUPCREDITS=TRUE > "%DATA_SETTINGS%\SKIPSTARTCREDITS.dll" )
IF EXIST "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll" (DEL /Q "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll")
GOTO SETTINGS
:CHECKFORUPDATES
IF EXIST "%DATA_SETTINGS%\CHECKFORUPDATES.dll" (
 DEL %DATA_SETTINGS%\CHECKFORUPDATES.dll
) ELSE ( ECHO.CHECKFORUPDATES=FALSE > "%DATA_SETTINGS%\CHECKFORUPDATES.dll" )
IF EXIST "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll" (DEL /Q "%DATA_SETTINGS%\USEDQUICKSETTINGS.dll")
GOTO SETTINGS
:CHANGE-VOLUME
SET "UDERFINE=%UDERFINE:~7,3%"
IF NOT DEFINED UDERFINE (
	ECHO.Please type a number after the volume command.
	TIMEOUT /T 5 >NUL
	GOTO SETTINGS
)
SET "VAR="&FOR /F "DELIMS=0123456789" %%I IN ("%UDERFINE%") DO SET "VAR=%%I"
IF DEFINED VAR (
	ECHO.Please type a number and make sure it's around 20-100.
	TIMEOUT /T 5 >NUL
	GOTO SETTINGS
)
IF %UDERFINE:~0,1% LEQ 0 (
	IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" ( DEL %DATA_SETTINGS%\ONSOUNDS.dll )
	GOTO SETTINGS
)
IF NOT %UDERFINE% GEQ 20 (
	ECHO.Please type a number between 20 and 100. ^(You typed "%UDERFINE%"^)
	TIMEOUT /T 5 >NUL
	GOTO SETTINGS
)
IF NOT %UDERFINE% LEQ 100 (
	SET "UDERFINE=100"
)
IF %UDERFINE% LSS 80 (
	ECHO.X=Msgbox^("Adjusting the volume to lower than 80%% is not recommended! You will not be able to hear audio with dynamic or pre-adjusted volume most of the times.",0+48,"Volume Warning"^)> "%DATA_TMP%\TMP_BOX.vbs"
	START /wait "" "%DATA_TMP%\TMP_BOX.vbs"
	DEL /Q "%DATA_TMP%\TMP_BOX.vbs"
)
(ECHO.SET VOLUME=%UDERFINE%&ECHO.GOTO :EOF)>"%DATA_SETTINGS%\VOLUME.cmd"
CALL "%DATA_SETTINGS%\VOLUME.cmd"
GOTO SETTINGS
:UNLOCKACHIEVEMENT
SET ICON=INFORMATION
SET NTITLE=Achievement Unlocked! - Jail^&Escape
SET NTEXT=Used the unlockachievement command!
START /min "Achievement" cmd /c POWERSHELL -Command "[void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); $objNotifyIcon=New-Object System.Windows.Forms.NotifyIcon; $objNotifyIcon.BalloonTipText='%NTEXT%'; $objNotifyIcon.Icon=[system.drawing.systemicons]::%ICON%; $objNotifyIcon.BalloonTipTitle='%NTITLE%'; $objNotifyIcon.BalloonTipIcon='None'; $objNotifyIcon.Visible=$True; $objNotifyIcon.ShowBalloonTip(6000);"
GOTO SETTINGS
::Icon can be: Application, Asterisk, Error, Exclamation, Hand, Information, Question, Shield, Warning or WinLogo

:: - Credits - ::
:CREDITS
CLS
ECHO.______________________________________.- CREDITS -.________________________________________
ECHO.
ECHO.                                  -=- Script Writer -=-
ECHO.                                       136MasterNR
ECHO.
ECHO.                                 -=- Story Designers -=-
ECHO.                                       136MasterNR
ECHO.                                       Joshua Slui
ECHO.
ECHO.                                      -=- Music -=-
ECHO.                                       Shady Cicada
ECHO.                                      dl-sounds.com
ECHO.
ECHO.                                  -=- Sound Effects -=-
ECHO.                                      freesound.org
ECHO.
ECHO.                                   -=- Programmers -=-
ECHO.                                       136MasterNR
ECHO.
ECHO.                                 -=- ASCII Designers -=-
ECHO.                                       136MasterNR
ECHO.                                       patorjk.com
ECHO.
ECHO.                                 -=- ASCII Animators -=-
ECHO.                                       136MasterNR
ECHO.
ECHO.                                  -=- Logo Designer -=-
ECHO.                                         Naibuu
ECHO.
ECHO.                                     -=- Testers -=-
ECHO.                                         anoos7
ECHO.                                         mefle7
ECHO.                                        2002Spiele
ECHO.                                      JayKayHere3987
ECHO.                                         AboodXD
ECHO.                                      The Purge King
ECHO.                                         Adriell
SET /p "=___________________________________________________________________________________________" <NUL
PAUSE>NUL
GOTO MENU
::-----------------------------------------------------------------------------------------------------------------------------------------------::
															:: - - - Game - - - ::
::-----------------------------------------------------------------------------------------------------------------------------------------------::
:GAME-WORKER
CLS
ECHO.Loading game...
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (TASKKILL /F /IM wscript.exe>NUL)
TITLE Jail^&Escape
:READ-SAVES
IF "%SAVEIS%"=="TRUE" (
	IF EXIST "%DATA_SAVES%\CROWBAR-PART-II-ENDLESSROOM.dll" GOTO CROWBAR-PART-II-ENDLESSROOM
	IF EXIST "%DATA_SAVES%\CROWBAR-PART-III-REDROOM.dll" GOTO CROWBAR-PART-III-REDROOM
	IF EXIST "%DATA_SAVES%\CROWBAR-PART-I.dll" GOTO CROWBAR-PART-I
)
:GAME-BEGGENNING
IF NOT EXIST "%DATA_SAVES%\*.dll" ( ECHO>NUL )
SET CURRENTPARTSTORY=GAME-BEGGENNING
TITLE Jail^&Escape
::CHAPTER NAME "the Prison Gift"
CLS
 ECHO. _________________________________________________________________________________________
 ECHO.^| You and the bois planned to rob a bank full of rare doggos. The goal was to save them.  ^|
 ECHO.^| But, something didn't go as planned and the police caught you.                          ^|
 ECHO.^| After being in jail for 3 years, one of the bois decided to escape,                     ^|
 SET /p "=| but " <NUL
 SETLOCAL ENABLEDELAYEDEXPANSION
 (%hcol:?=0C%he died)
 ENDLOCAL
 ECHO. after stabbing 2 policemen.                                                 ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| One day, a policeman came and told you that you had a package which just came,          ^|
 ECHO.^| it was a gift from a friend.                                                            ^|
 SET /p "=| " <NUL
 SETLOCAL ENABLEDELAYEDEXPANSION
 (%hcol:?=07%Waiting for the package to arrive took a while, thinking about, who)
 ENDLOCAL
 ECHO.                     ^|
 SET /p "=| " <NUL
 SETLOCAL ENABLEDELAYEDEXPANSION
 (%hcol:?=07%may delivered it for you)
 ENDLOCAL
 ECHO.?                                                               ^|
 ECHO.^| As the time arrives, the package gets handed to you. On the box, it says that it was    ^|
 ECHO.^| for your birthday, which was yesterday.                                                 ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| You open it and spot a cake, you touch it, and realize the cake was made of plastic,    ^|
 ECHO.^| even tho it looked very real.                                                           ^|
 ECHO.^| You take the cake out, and notice that there are tools under it!                        ^|
 ECHO.^|                                                                                         ^|
 SET /p "=| You also see a note, "^" <NUL
 SETLOCAL ENABLEDELAYEDEXPANSION
 (%hcol:?=07%The tools will help you escape, don't make mistakes like I made)
 ENDLOCAL
 SET /p ""=""  ^|"" <NUL
 ECHO.
 ECHO.^| After thinking multiple ways to escape, and who finally sent you this, you decide to    ^|
 ECHO.^| start by selecting a tool.                                                              ^|
 ECHO.^|                                                                                         ^|
 SET /p "=| The tools in the box are a " <NUL
 SETLOCAL ENABLEDELAYEDEXPANSION
 (%hcol:?=0B%Crowbar)
 SET /p "=, a "<NUL
 (%hcol:?=0B%Plunger)
 SET /p "=, a "<NUL
 (%hcol:?=0B%Controller)
 SET /p "=, and a "<NUL
 (%hcol:?=0B%Drill)
 ENDLOCAL
 ECHO..               ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| Your choices may affect the story.                                                      ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|_________________________________________________________________________________________^|
SET UDERFINE=
SET /P UDERFINE=Select a tool: 
 IF NOT DEFINED UDERFINE GOTO GAME-BEGGENNING
 IF /I "%UDERFINE%"=="FIX" MODE CON:COLS=%COLS% LINES=%LINES%&GOTO %CURRENTPARTSTORY%
 IF /I "%UDERFINE%"=="MENU" GOTO MENU
  IF /I "%UDERFINE%"=="MAIN MENU" GOTO MENU
   IF /I "%UDERFINE%"=="MAINMENU" GOTO MENU
 IF /I "%UDERFINE%"=="BACK" GOTO MENU
  IF /I "%UDERFINE%"=="LEAVE" GOTO MENU
 IF /I "%UDERFINE%"=="RESTART" GOTO GAME-WORKER
 IF /I "%UDERFINE%"=="CLOSE" GOTO EXIT
  IF /I "%UDERFINE%"=="EXIT" GOTO EXIT
 IF /I "%UDERFINE%"=="HELP" GOTO ANSWERS-GAMEBEG
 IF /I "%UDERFINE%"=="CROWBAR" GOTO CROWBAR-PART-I
  IF /I "%UDERFINE%"=="SELECT THE CROWBAR" GOTO CROWBAR-PART-I
   IF /I "%UDERFINE%"=="SELECT CROWBAR" GOTO CROWBAR-PART-I
    IF /I "%UDERFINE%"=="THE CROWBAR" GOTO CROWBAR-PART-I
 IF /I "%UDERFINE%"=="CONTROLLER" GOTO CONTROLLER-PART-I
  IF /I "%UDERFINE%"=="CHOOSE THE CONTROLLER" GOTO CONTROLLER-PART-I
 IF /I "%UDERFINE%"=="DRILL" GOTO DRILL-PART-I
  IF /I "%UDERFINE%"=="SELECT THE DRILL" GOTO DRILL-PART-I
 IF /I "%UDERFINE%"=="PLUNGER" GOTO PLUNGER-PART-I
  IF /I "%UDERFINE%"=="SELECT THE PLUNGER" GOTO PLUNGER-PART-I
   IF /I "%UDERFINE%"=="SELECT PLUNGER" GOTO PLUNGER-PART-I
    IF /I "%UDERFINE%"=="THE PLUNGER" GOTO PLUNGER-PART-I
	 IF /I "%UDERFINE%"=="TAKE THE PLUNGER" GOTO PLUNGER-PART-I
	  IF /I "%UDERFINE%"=="TAKETHEPLUNGER" GOTO PLUNGER-PART-I
	   IF /I "%UDERFINE%"=="CHOOSE THE PLUNGER" GOTO PLUNGER-PART-I
	    IF /I "%UDERFINE%"=="CHOOSE PLUNGER" GOTO PLUNGER-PART-I
		 IF /I "%UDERFINE%"=="CHOSE THE PLUNGER" GOTO PLUNGER-PART-I
		  IF /I "%UDERFINE%"=="CHOOSETHEPLUNGER" GOTO PLUNGER-PART-I
CLS
ECHO.This is not a choise. Type "help" if you cannot find one. (%UDERFINE%)
TIMEOUT /T 3 > NUL
GOTO GAME-BEGGENNING
:ANSWERS-GAMEBEG
MODE CON:COLS=%COLS% LINES=%LINES%
 ECHO.Select a tool mentioned on the story.
TIMEOUT /T 9 > NUL
GOTO GAME-BEGGENNING

:PLUNGER-PART-I
CLS
ECHO.There is currently no story about the Plunger option.
TIMEOUT /T 5 > NUL
GOTO GAME-BEGGENNING

:CONTROLLER-PART-I
CLS
ECHO.There is currently no story about the Controller option.
TIMEOUT /T 5 > NUL
GOTO GAME-BEGGENNING

:DRILL-PART-I
CLS
ECHO.There is currently no story about the Drill option.
TIMEOUT /T 5 > NUL
GOTO GAME-BEGGENNING

::
:: - - - Crowbar - - -
::

:CROWBAR-PART-I
ECHO.TRUE>"%DATA_SAVES%\CROWBAR-PART-I.dll"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" ( TASKLIST /FI "IMAGENAME eq wscript.exe" 2>NUL|FIND /I /N "wscript.exe">NUL ) ELSE ( SET ERRORLEVEL=NUL )
SET "TARGETAUDIO=%DATA_AUDIO_1%\e\ef-crowbartool.mp3"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
	IF EXIST "%TARGETAUDIO%" (
		IF /I "%ERRORLVL%"=="0" (
			TASKKILL /F /FI "WINDOWTITLE eq wscript.exe" /T>NUL
			(
				ECHO Set Sound = CreateObject("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		) ELSE IF /I "%ERRORLVL%"=="1" (
			(
				ECHO Set Sound = CreateObject("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		)
	)
)
MODE CON:COLS=%COLS% LINES=%LINES%
::CHAPTER NAME "A Horror Dream"
 ECHO. _________________________________________________________________________________________
 ECHO.^| You select the crowbar,                                                                 ^|
 ECHO.^| As the night comes, you take the crowbar and start by attempting to cut the air duct    ^|
 ECHO.^| railings while no one is watching. You successfully break the railings and try to go    ^|
 ECHO.^| through. Fitting through the air duct was quite hard because it was very tight.         ^|
 ECHO.^| After walking for a while into the air duct, you suddenly fall into a room ...          ^|
 ECHO.^|                                                                                         ^|
SETLOCAL ENABLEDELAYEDEXPANSION
SET /p "=| (" <NUL
(%hcol:?=0C%Press any key to continue reading)
ENDLOCAL
ECHO.)                                                     ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
SET /p "=|_________________________________________________________________________________________|" <NUL
PAUSE>NUL
SET "TARGETAEXT=.scaryatmosphere"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" ( SET "ERRORLEVEL="&TASKLIST /FI "IMAGENAME eq wscript.exe%TARGETAEXT%" 2>NUL|FIND /I /N "wscript.exe%TARGETAEXT%">NUL&SET "ERRORLVL=%ERRORLEVEL%" ) ELSE ( SET ERRORLEVEL=NUL )
SET "TARGETAUDIO=%DATA_AUDIO_1%\m\mu-scaryatmospher.mp3"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
	IF EXIST "%TARGETAUDIO%" (
		IF /I "%ERRORLVL%"=="0" (
			TASKKILL /F /FI "WINDOWTITLE eq wscript.exe%TARGETAEXT%" /T>NUL
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.settings.setMode "loop", True
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe%TARGETAEXT%" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		) ELSE IF /I "%ERRORLVL%"=="1" (
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.settings.setMode "loop", True
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe%TARGETAEXT%" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		)
	)
)
::- Storyline: WHATCHA-COOKIN'? PART:I
:CROWBAR-PART-I-FULLSKIP
SET CURRENTPARTSTORY=CROWBAR-PART-I-FULLSKIP
CLS
 ECHO. _________________________________________________________________________________________
 ECHO.^| You select the crowbar,                                                                 ^|
 ECHO.^| As the night comes, you take the crowbar and start by attempting to cut the air duct    ^|
 ECHO.^| railings while no one is watching. You successfully break the railings and try to go    ^|
 ECHO.^| through. Fitting through the air duct was quite hard because it was very tight.         ^|
 ECHO.^| After walking for a while into the air duct, you suddenly fall into a room ...          ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| You see an open flashlight. You pick it up and flash around,                            ^|
 ECHO.^| there are alot of tools for cooking, seems like you are in the cooking station.         ^|
 ECHO.^| Everything around you is wooden, even the walls. But, weren't you in a prison just now? ^|
SETLOCAL ENABLEDELAYEDEXPANSION
SET /p "=| You start to explore a bit more. Around you are a lot of " <NUL
(%hcol:?=0B%cupboards)
SET /p "=, a closed " <NUL
(%hcol:?=0B%red door)
ECHO.   ^|
SET /p "=| and a weird-looking " <NUL
(%hcol:?=0B%window)
ENDLOCAL
ECHO..                                                             ^|
 ECHO.^|                                                                                         ^|
IF EXIST "%DATA_SAVES%\CROWBAR-PI-HASCUPBOARDS.dll" (
 ECHO.^| You have checked the cupboards, and found a key.                                        ^|
) ELSE (
 ECHO.^|                                                                                         ^|)
 ECHO.^|                                                                                         ^|
IF EXIST "%DATA_SAVES%\CROWBAR-PI-DOOR-OLDKEYS.dll" (
 ECHO.^| You have tried to open the door with the Old Key, but it didn't fit.                    ^|
) ELSE (
 ECHO.^|                                                                                         ^|)
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|_________________________________________________________________________________________^|
SET UDERFINE=
SET /P UDERFINE=Type: 
 IF NOT DEFINED UDERFINE GOTO CROWBAR-PART-I-FULLSKIP
 IF /I "%UDERFINE%"=="MENU" GOTO MENU
  IF /I "%UDERFINE%"=="MAIN MENU" GOTO MENU
   IF /I "%UDERFINE%"=="MAINMENU" GOTO MENU
 IF /I "%UDERFINE%"=="BACK" GOTO MENU
  IF /I "%UDERFINE%"=="LEAVE" GOTO MENU
 IF /I "%UDERFINE%"=="RESTART" GOTO GAME-WORKER
 IF /I "%UDERFINE%"=="CLOSE" GOTO EXIT
  IF /I "%UDERFINE%"=="EXIT" GOTO EXIT
 IF /I "%UDERFINE%"=="HELP" GOTO ANSWERS-CROWBAR-PART-I
 IF /I "%UDERFINE%"=="OPEN THE DOOR" GOTO CROWBAR-PART-I-REDDOOR
  IF /I "%UDERFINE%"=="OPEN DOOR" GOTO CROWBAR-PART-I-REDDOOR
   IF /I "%UDERFINE%"=="OPEN THE RED DOOR" GOTO CROWBAR-PART-I-REDDOOR
    IF /I "%UDERFINE%"=="GO TO THE RED DOOR" GOTO CROWBAR-PART-I-REDDOOR
	 IF /I "%UDERFINE%"=="GO TO THE DOOR" GOTO CROWBAR-PART-I-REDDOOR
	  IF /I "%UDERFINE%"=="GO TO DOOR" GOTO CROWBAR-PART-I-REDDOOR
	   IF /I "%UDERFINE%"=="GO DOOR" GOTO CROWBAR-PART-I-REDDOOR
	    IF /I "%UDERFINE%"=="USE DOOR" GOTO CROWBAR-PART-I-REDDOOR
		 IF /I "%UDERFINE%"=="USE THE DOOR" GOTO CROWBAR-PART-I-REDDOOR
		  IF /I "%UDERFINE%"=="USE THE RED DOOR" GOTO CROWBAR-PART-I-REDDOOR
		   IF /I "%UDERFINE%"=="OPEN THE DOOR" GOTO CROWBAR-PART-I-REDDOOR
		    IF /I "%UDERFINE%"=="DOOR" GOTO CROWBAR-PART-I-REDDOOR
			 IF /I "%UDERFINE%"=="RED DOOR" GOTO CROWBAR-PART-I-REDDOOR
			  IF /I "%UDERFINE%"=="UNLOCK THE RED DOOR" GOTO CROWBAR-PART-I-REDDOOR
			   IF /I "%UDERFINE%"=="UNLOCK THE REDDOOR" GOTO CROWBAR-PART-I-REDDOOR
				IF /I "%UDERFINE%"=="UNLOCK REDDOOR" GOTO CROWBAR-PART-I-REDDOOR
				 IF /I "%UDERFINE%"=="UNLOCK RED DOOR" GOTO CROWBAR-PART-I-REDDOOR
				  IF /I "%UDERFINE%"=="USE THE KEY TO UNLOCK THE RED DOOR" GOTO CROWBAR-PART-I-REDDOOR
				   IF /I "%UDERFINE%"=="USE THE KEY AND UNLOCK THE RED DOOR" GOTO CROWBAR-PART-I-REDDOOR
					IF /I "%UDERFINE%"=="UNLOCK THE RED DOOR WITH THE KEY" GOTO CROWBAR-PART-I-REDDOOR
					 IF /I "%UDERFINE%"=="UNLOCK THE DOOR" GOTO CROWBAR-PART-I-REDDOOR
					  IF /I "%UDERFINE%"=="UNLOCK DOOR" GOTO CROWBAR-PART-I-REDDOOR
					   IF /I "%UDERFINE%"=="OPEN THE CLOSED DOOR" GOTO CROWBAR-PART-I-REDDOOR
				        IF /I "%UDERFINE%"=="REDDOOR" GOTO CROWBAR-PART-I-REDDOOR
 IF /I "%UDERFINE%"=="CUPBOARDS" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
  IF /I "%UDERFINE%"=="CHECK CUPBOARDS" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
   IF /I "%UDERFINE%"=="SEARCH CUPBOARDS" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
    IF /I "%UDERFINE%"=="CHECK THE CUPBOARDS" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
	 IF /I "%UDERFINE%"=="SEARCH THE CUPBOARDS" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
	  IF /I "%UDERFINE%"=="CHECK CUPBOARD" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
	   IF /I "%UDERFINE%"=="SEARCH CUPBOARD" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
	    IF /I "%UDERFINE%"=="SEARCH THE CUPBOARD" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
		 IF /I "%UDERFINE%"=="CHECK THE CUPBOARD" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
		  IF /I "%UDERFINE%"=="GO TO THE CUPBOARDS" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
		   IF /I "%UDERFINE%"=="GO TO CUPBOARDS" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
		    IF /I "%UDERFINE%"=="GO TO CUPBOARD" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
			 IF /I "%UDERFINE%"=="GO TO THE CUPBOARD" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
			  IF /I "%UDERFINE%"=="OPEN THE CUPBOARDS" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
			   IF /I "%UDERFINE%"=="OPEN THE CUPBOARD" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
			    IF /I "%UDERFINE%"=="OPEN CUPBOARDS" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
				 IF /I "%UDERFINE%"=="OPEN CUPBOARD" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
				  IF /I "%UDERFINE%"=="OPEN ALL THE CUPBOARDS" GOTO CROWBAR-PART-I-SEARCHCUPBOARDS
 IF /I "%UDERFINE%"=="CHECK WINDOW" GOTO CROWBAR-PI-EXTRA-CHECKWINDOW
  IF /I "%UDERFINE%"=="CHECK THE WINDOW" GOTO CROWBAR-PI-EXTRA-CHECKWINDOW
   IF /I "%UDERFINE%"=="GO TO THE WINDOW" GOTO CROWBAR-PI-EXTRA-CHECKWINDOW
    IF /I "%UDERFINE%"=="SEE THE WINDOW" GOTO CROWBAR-PI-EXTRA-CHECKWINDOW
	 IF /I "%UDERFINE%"=="CHECK OUT OF THE WINDOW" GOTO CROWBAR-PI-EXTRA-CHECKWINDOW
	  IF /I "%UDERFINE%"=="SEE EOUT OF THE WINDOW" GOTO CROWBAR-PI-EXTRA-CHECKWINDOW
	   IF /I "%UDERFINE%"=="SEE WINDOW" GOTO CROWBAR-PI-EXTRA-CHECKWINDOW
	    IF /I "%UDERFINE%"=="WINDOW" GOTO CROWBAR-PI-EXTRA-CHECKWINDOW
   IF /I "%UDERFINE%"=="UNLOCK CUPBOARD" GOTO CROWBAR-PI-UNLOCKED-CUPBOARD
    IF /I "%UDERFINE%"=="UNLOCK CUPBOARDS" GOTO CROWBAR-PI-UNLOCKED-CUPBOARD
	 IF /I "%UDERFINE%"=="UNLOCK THE CUPBOARD" GOTO CROWBAR-PI-UNLOCKED-CUPBOARD
	    IF /I "%UDERFINE%"=="LOCKED CUPBOARD" GOTO CROWBAR-PI-UNLOCKED-CUPBOARD
		 IF /I "%UDERFINE%"=="UNLOCK THE LOCKED CUPBOARD" GOTO CROWBAR-PI-UNLOCKED-CUPBOARD
		  IF /I "%UDERFINE%"=="UNLOCK THE LOCKEDCUPBOARD" GOTO CROWBAR-PI-UNLOCKED-CUPBOARD
		   IF /I "%UDERFINE%"=="GO TO THE LOCKED CUPBOARD" GOTO CROWBAR-PI-UNLOCKED-CUPBOARD
		    IF /I "%UDERFINE%"=="GO TO THE LOCKEDCUPBOARD" GOTO CROWBAR-PI-UNLOCKED-CUPBOARD
			 IF /I "%UDERFINE%"=="GO TO LOCKED CUPBOARD" GOTO CROWBAR-PI-UNLOCKED-CUPBOARD
			  IF /I "%UDERFINE%"=="USE THE LOCKED CUPBOARD" GOTO CROWBAR-PI-UNLOCKED-CUPBOARD
			   IF /I "%UDERFINE%"=="USE THE KEY TO UNLOCK THE CUPBOARD" GOTO CROWBAR-PI-UNLOCKED-CUPBOARD
			    IF /I "%UDERFINE%"=="USE THE KEY TO UNLOCK THE LOCKED CUPBOARD" GOTO CROWBAR-PI-UNLOCKED-CUPBOARD
				 IF /I "%UDERFINE%"=="CUPBOARD" GOTO CROWBAR-PI-UNLOCKED-CUPBOARD
GOTO %CURRENTPARTSTORY%
:ANSWERS-CROWBAR-PART-I
IF EXIST "%DATA_SAVES%\CROWBAR-PI-HASCUPBOARDS.dll" (
MODE CON:COLS=%COLS% LINES=%LINES%
ECHO.You have the key, now you have to unlock the Cupboard.
ECHO.You can use "unlock cupboard" if you can't find an answer in your own.
TIMEOUT /T 5 >NUL
GOTO CROWBAR-PART-I-FULLSKIP
)
MODE CON:COLS=%COLS% LINES=%LINES%
SET /p "=Please choose one of the options marked in " <NUL
SETLOCAL ENABLEDELAYEDEXPANSION
(%hcol:?=0B%blue)
ENDLOCAL
SET /p "=." <NUL                                                           ^|
TIMEOUT /T 3 >NUL
GOTO CROWBAR-PART-I-FULLSKIP
:CROWBAR-PI-EXTRA-CHECKWINDOW
MODE CON:COLS=%COLS% LINES=%LINES%
 ECHO. _________________________________________________________________________________________
 ECHO.^| You tried to see through the window, but you couldn't see anything at all...            ^|
SET /p "=| There seems to be a " <NUL
SETLOCAL ENABLEDELAYEDEXPANSION
(%hcol:?=0C%thick fog outside)
SET /p "=, so thick that you can't even see the ground.     |" <NUL
ENDLOCAL
 ECHO.^|                                                                                         ^|
 ECHO.^| As more you tried to look, the more dizzy you'd get. Quite odd...                       ^|
 ECHO.^|                                                                                         ^|
SET /p "=| (" <NUL
ENDLOCAL
SETLOCAL ENABLEDELAYEDEXPANSION
(%hcol:?=0C%Press any key to go back)
ENDLOCAL
 ECHO.)                                                              ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
SET /p "=|_________________________________________________________________________________________|" <NUL
PAUSE>NUL
GOTO CROWBAR-PART-I-FULLSKIP
::^^^ EXTRA ^^^::
:CROWBAR-PART-I-SEARCHCUPBOARDS
MODE CON:COLS=%COLS% LINES=%LINES%
 ECHO. _________________________________________________________________________________________
 ECHO.^| You started searching the cupboards, but most of them were empty. There was a locked    ^|
 ECHO.^| cupboard which you couldn't open in any way, so you continued searching.                ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| After searching through about 30 cupboards, you finally found a key.                    ^|
 ECHO.^|                                                                                         ^|
SET /p "=| (" <NUL
ENDLOCAL
SETLOCAL ENABLEDELAYEDEXPANSION
(%hcol:?=0C%Press any key to go back)
ENDLOCAL
 ECHO.)                                                              ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
:CUPBOARDS-SEARCH-CHECK-SAVE-I-NOT
SETLOCAL ENABLEDELAYEDEXPANSION
IF NOT EXIST "%DATA_SAVES%\CROWBAR-PI-HASCUPBOARDS.dll" (
SET /p "=| " <NUL
(%hcol:?=0B%+)
(%hcol:?=0E% You now have an)
(%hcol:?=06% Old Key)
(%hcol:?=0E% in your inventory)
 CALL :GODPLEASEMAKETHISGAMEWORK
) ELSE (
SET /p "=| " <NUL
(%hcol:?=0C%[X])
(%hcol:?=0C% You already took this key)
 CALL :GODPLEASEMAKETHISGAMEWORK-2
)
ENDLOCAL
::tpto-reddoor moveto-reddoor [SHORTCUT FOR CTRL+F]
ECHO.TRUE>"%DATA_SAVES%\CROWBAR-PI-HASCUPBOARDS.dll"
SET /p "=|_________________________________________________________________________________________|" <NUL
 PAUSE>NUL
GOTO CROWBAR-PART-I-FULLSKIP
:REDDOOR-I-SECONDTRY-NOKEYS
ECHO.TRUE>"%DATA_SAVES%\CROWBAR-PI-DOOR-OLDKEYS.dll"
ECHO.TRUE>"%DATA_SAVES%\CROWBAR-PART-I.dll"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" ( TASKLIST /FI "IMAGENAME eq wscript.exe" 2>NUL|FIND /I /N "wscript.exe">NUL ) ELSE ( SET ERRORLEVEL=NUL )
SET "TARGETAUDIO=%DATA_AUDIO_1%\e\ef-unableunlock.mp3"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
	IF EXIST "%TARGETAUDIO%" (
		IF /I "%ERRORLVL%"=="0" (
			TASKKILL /F /FI "WINDOWTITLE eq wscript.exe" /T>NUL
			(
				ECHO Set Sound = CreateObject("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		) ELSE IF /I "%ERRORLVL%"=="1" (
			(
				ECHO Set Sound = CreateObject("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		)
	)
)
CLS
 ECHO. _________________________________________________________________________________________ 
 ECHO.^| You tried to unlock the red door with the key you found, but it didn't fit!             ^|
 ECHO.^| The key must be used for something else. Maybe it will work on the locked cupboard?     ^|
 ECHO.^|                                                                                         ^|
SETLOCAL ENABLEDELAYEDEXPANSION
SET /p "=| (" <NUL
(%hcol:?=0C%Press any key to continue...)
 ECHO.)                                                             ^|
ENDLOCAL
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
SET /p "=|_________________________________________________________________________________________|" <NUL
TIMEOUT /T 1 >NUL
PAUSE >NUL
GOTO CROWBAR-PART-I-FULLSKIP
:CROWBAR-PART-I-REDDOOR
:REDDOOR-I-NOKEYS
IF EXIST "%DATA_SAVES%\CROWBAR-PI-HASCUPBOARDS.dll" ( GOTO REDDOOR-I-SECONDTRY-NOKEYS )
MODE CON:COLS=%COLS% LINES=%LINES%
 ECHO. _________________________________________________________________________________________
 ECHO.^| You tried to open the red door, but it seems to be stuck or locked.                     ^|
SETLOCAL ENABLEDELAYEDEXPANSION
SET /p "=| You have to search for a " <NUL
(%hcol:?=0B%key)
SET /p "=, or " <NUL
(%hcol:?=0B%something)
 ECHO. else to open it with.                        ^|
 ECHO.^|                                                                                         ^|
SET /p "=| (" <NUL
ENDLOCAL
SETLOCAL ENABLEDELAYEDEXPANSION
(%hcol:?=0C%Press any key to go back)
ENDLOCAL
 ECHO.)                                                              ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
SET /p "=|_________________________________________________________________________________________|" <NUL
PING 1.1.1.1 -n 1 -w 100 >NUL
PAUSE>NUL
GOTO CROWBAR-PART-I-FULLSKIP
:CROWBAR-PI-UNLOCKED-CUPBOARD
SETLOCAL DISABLEDELAYEDEXPANSION
MODE CON:COLS=%COLS% LINES=%LINES%
IF NOT EXIST "%DATA_SAVES%\CROWBAR-PI-HASCUPBOARDS.dll" ( GOTO CROWBAR-PART-I-SEARCHCUPBOARDS )
 ECHO. _________________________________________________________________________________________
 ECHO.^| You used the key to unlock the cupboard,                                                ^|
 ECHO.^| It fits! The cupboard has been opened!                                                  ^|
 ECHO.^|                                                                                         ^|
SETLOCAL ENABLEDELAYEDEXPANSION
SET /p "=| You find a filthy skull and spot a " <NUL
(%hcol:?=0E%key)
 ECHO. inside it.                                       ^|
SET /p "=| You pick up the skull and take out the " <NUL
(%hcol:?=0E%key)
 ECHO..                                             ^|
 ECHO.^|                                                                                         ^|
SET /p "=| It's a " <NUL
(%hcol:?=04%Red Key)
ENDLOCAL
 ECHO., perhaps you can use it to unlock the door?                              ^|
 ECHO.^|                                                                                         ^|
SETLOCAL ENABLEDELAYEDEXPANSION
SET /p "=| (" <NUL
(%hcol:?=0C%Press any key to unlock the)
(%hcol:?=04% Red Door)
ENDLOCAL
 ECHO.)                                                  ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
SETLOCAL ENABLEDELAYEDEXPANSION
SET /p "=| " <NUL
(%hcol:?=0B%+ You now have the)
(%hcol:?=04% Red Key)
(%hcol:?=0B% in your inventory)
ENDLOCAL
SET /p "=.                                           " <NUL
SET /p "=|" <NUL
ECHO.
SET /p "=|_________________________________________________________________________________________|" <NUL
(ECHO.TRUE)>"%DATA_SAVES%\CROWBAR-PI-HAS-REDKEY.dll"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" ( TASKLIST /FI "IMAGENAME eq wscript.exe" 2>NUL|FIND /I /N "wscript.exe">NUL ) ELSE ( SET ERRORLEVEL=NUL )
SET "TARGETAUDIO=%DATA_AUDIO_1%\e\ef-unlock.mp3"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
	IF EXIST "%TARGETAUDIO%" (
		IF /I "%ERRORLVL%"=="0" (
			TASKKILL /F /FI "WINDOWTITLE eq wscript.exe" /T>NUL
			(
				ECHO Set Sound = CreateObject("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		) ELSE IF /I "%ERRORLVL%"=="1" (
			(
				ECHO Set Sound = CreateObject("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		)
	)
)
PAUSE>NUL
CLS
 ECHO. _________________________________________________________________________________________
 ECHO.^| The key fits! The door is unlocked.                                                     ^|
 ECHO.^| You walk through the door,                                                              ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
SET /p "=|_________________________________________________________________________________________|" <NUL
TIMEOUT /T 5 >NUL
GOTO CROWBAR-PART-II-ENDLESSROOM-SAVE
:: Storyline: ENDLESS-WAYS [PART:II]
:CROWBAR-PART-II-ENDLESSROOM
SET "TARGETAEXT=.scaryatmosphere"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" ( SET "ERRORLEVEL="&TASKLIST /FI "IMAGENAME eq wscript.exe%TARGETAEXT%" 2>NUL|FIND /I /N "wscript.exe%TARGETAEXT%">NUL&SET "ERRORLVL=%ERRORLEVEL%" ) ELSE ( SET ERRORLEVEL=NUL )
SET "TARGETAUDIO=%DATA_AUDIO_1%\m\mu-scaryatmospher.mp3"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
	IF EXIST "%TARGETAUDIO%" (
		IF /I "%ERRORLVL%"=="0" (
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.settings.setMode "loop", True
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe%TARGETAEXT%" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		)
	)
)
ECHO.TRUE>"%DATA_SAVES%\CROWBAR-PART-II-ENDLESSROOM.dll"
:CROWBAR-PART-II-ENDLESSROOM-SAVE
ECHO.TRUE>"%DATA_SAVES%\CROWBAR-PART-II-ENDLESSROOM.dll"
:CROWBAR-PART-II-ENDLESSROOM-SKIP
SET CURRENTPARTSTORY=CROWBAR-PART-II-ENDLESSROOM-SKIP
MODE CON:COLS=%COLS% LINES=%LINES%
 ECHO. _________________________________________________________________________________________
 SET /P "=| "<NUL
 SETLOCAL ENABLEDELAYEDEXPANSION
 (%hcol:?=07%You walk through the door)
 ENDLOCAL
 ECHO.,                                                              ^|
 ECHO.^| The door closes and locks behind you, making it impossible to go back.                  ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| You enter into what seems to be an endless, yet empty room.                             ^|
 SET /p "=| The only way you can go is " <NUL
 SETLOCAL ENABLEDELAYEDEXPANSION
 (%hcol:?=0b%forward)
 ENDLOCAL 
 ECHO.. Red walls made of concrete with a wooden            ^|
 ECHO.^| ceiling and floor, the atmospher is starting to get scary or even crazy.                ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| You are unable to see very far because of the atmosphere, but near you got few stuff.   ^|
 SET /p "=| So far, you can only see an " <NUL
 SETLOCAL ENABLEDELAYEDEXPANSION
 (%hcol:?=0b%artpiece)
 ENDLOCAL
 ECHO. hanging on the wall.                               ^|
 SET /p "=| Amidst the room stands a dust covered "<NUL
 SETLOCAL ENABLEDELAYEDEXPANSION
 (%hcol:?=0b%table)
 ENDLOCAL
 ECHO. located under the art.                      ^|
 SET /p "=| A burning "<NUL
 SETLOCAL ENABLEDELAYEDEXPANSION
 (%hcol:?=0b%candle)
 ENDLOCAL
 ECHO. is placed on the middle of the table.                                  ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|_________________________________________________________________________________________^|
SET UDERFINE=
SET /P UDERFINE=Type: 
IF NOT DEFINED UDERFINE GOTO %CURRENTPARTSTORY%
 IF /I "%UDERFINE%"=="FIX" MODE CON:COLS=%COLS% LINES=%LINES%&GOTO %CURRENTPARTSTORY%
 IF /I "%UDERFINE%"=="MENU" GOTO MENU
  IF /I "%UDERFINE%"=="MAIN MENU" GOTO MENU
   IF /I "%UDERFINE%"=="MAINMENU" GOTO MENU
 IF /I "%UDERFINE%"=="BACK" GOTO MENU
  IF /I "%UDERFINE%"=="LEAVE" GOTO MENU
 IF /I "%UDERFINE%"=="RESTART" GOTO GAME-WORKER
 IF /I "%UDERFINE%"=="CLOSE" GOTO EXIT
  IF /I "%UDERFINE%"=="EXIT" GOTO EXIT
 IF /I "%UDERFINE%"=="GO FORWARD" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD
  IF /I "%UDERFINE%"=="FORWARD" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD
   IF /I "%UDERFINE%"=="WALK FORWARD" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD
    IF /I "%UDERFINE%"=="KEEP WALKING FORWARD" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD
 IF /I "%UDERFINE%"=="CHECK THE ART" GOTO CROWBAR-PART-II-ENDLESSROOM-CHECKART
  IF /I "%UDERFINE%"=="CHECK THE HANGING ART" GOTO CROWBAR-PART-II-ENDLESSROOM-CHECKART
   IF /I "%UDERFINE%"=="CHECK THE HANGING ART ON THE WALL" GOTO CROWBAR-PART-II-ENDLESSROOM-ART
    IF /I "%UDERFINE%"=="CHECK THE ART ON THE WALL" GOTO CROWBAR-PART-II-ENDLESSROOM-ART
	 IF /I "%UDERFINE%"=="CHECK ART" GOTO CROWBAR-PART-II-ENDLESSROOM-ART
	  IF /I "%UDERFINE%"=="ART" GOTO CROWBAR-PART-II-ENDLESSROOM-ART
       IF /I "%UDERFINE%"=="CHECK THE ARTPIECE" GOTO CROWBAR-PART-II-ENDLESSROOM-ART
	    IF /I "%UDERFINE%"=="CHECK THE HANGING ARTPIECE" GOTO CROWBAR-PART-II-ENDLESSROOM-ART
		 IF /I "%UDERFINE%"=="CHECK THE HANGING ARTPIECE ON THE WALL" GOTO CROWBAR-PART-II-ENDLESSROOM-ART
		  IF /I "%UDERFINE%"=="CHECK THE ARTPIECE ON THE WALL" GOTO CROWBAR-PART-II-ENDLESSROOM-ART
		   IF /I "%UDERFINE%"=="CHECK ARTPIECE" GOTO CROWBAR-PART-II-ENDLESSROOM-ART
		    IF /I "%UDERFINE%"=="ARTPIECE" GOTO CROWBAR-PART-II-ENDLESSROOM-ART
			 IF /I "%UDERFINE%"=="ART PIECE" GOTO CROWBAR-PART-II-ENDLESSROOM-ART
 IF /I "%UDERFINE%"=="TABLE" GOTO CROWBAR-PART-II-ENDLESSROOM-CANDLES
  IF /I "%UDERFINE%"=="CHECK TABLE" GOTO CROWBAR-PART-II-ENDLESSROOM-CANDLES
   IF /I "%UDERFINE%"=="CHECK THE TABLE" GOTO CROWBAR-PART-II-ENDLESSROOM-CANDLES
    IF /I "%UDERFINE%"=="GO TO THE TABLE" GOTO CROWBAR-PART-II-ENDLESSROOM-CANDLES
	 IF /I "%UDERFINE%"=="GO CLOSE TO THE TABLE" GOTO CROWBAR-PART-II-ENDLESSROOM-CANDLES
	  IF /I "%UDERFINE%"=="WALK TO THE TABLE" GOTO CROWBAR-PART-II-ENDLESSROOM-CANDLES
	   IF /I "%UDERFINE%"=="CHECK THE CANDLE" GOTO CROWBAR-PART-II-ENDLESSROOM-CANDLES
	    IF /I "%UDERFINE%"=="CANDLE" GOTO CROWBAR-PART-II-ENDLESSROOM-CANDLES
		 IF /I "%UDERFINE%"=="GO TO THE CANDLE" GOTO CROWBAR-PART-II-ENDLESSROOM-CANDLES
 IF /I "%UDERFINE%"=="HELP" (
	CLS
	ECHO.You can "go forward", "check the art" or "check the table".
	TIMEOUT /T 10
	GOTO CROWBAR-PART-II-ENDLESSROOM
)
GOTO %CURRENTPARTSTORY%
:CROWBAR-PART-II-ENDLESSROOM-ART
CLS
 ECHO. _________________________________________________________________________________________
 ECHO.^| You take a look at the artpiece,                                                        ^|
 ECHO.^|                                                                                         ^|
 SET /P "=| it's a unqiue artpiece of a woman's face with a "<NUL
 SETLOCAL ENABLEDELAYEDEXPANSION
 (%hcol:?=0C%cross)
 ENDLOCAL
 ECHO. on her mouth.                     ^|
 ECHO.^| Her hair color is a mix of orange and blue, looking at her eyes only makes you feel     ^|
 ECHO.^| emptiness and loneliness, their color is gray. On the left and right are 2 doors,       ^|
 ECHO.^| but you are unable to see what's behind her.                                            ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| You tried to move it or pick it up, but it seems to be stuck on the wall.               ^|
 ECHO.^|                                                                                         ^|
 SET /P "=| ("<NUL
 SETLOCAL ENABLEDELAYEDEXPANSION
 (%hcol:?=0C%Press any key to go back)
 ENDLOCAL
 ECHO.)                                                              ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
SET /p "=|_________________________________________________________________________________________|" <NUL
PAUSE>NUL
GOTO %CURRENTPARTSTORY%
:CROWBAR-PART-II-ENDLESSROOM-CANDLES
CLS
 ECHO. _________________________________________________________________________________________
 ECHO.^| You walk to the table, covered by dust and spiderwebs.                                  ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| You spot a note under the candle, after moving the candle aside, you pick up the note.  ^|
 SET /P "=| It reads: "^"<NUL
 SETLOCAL ENABLEDELAYEDEXPANSION
 (%hcol:?=0C%The correct door, has the louder of sounds)
 ENDLOCAL
 ECHO.^" in a red color.                  ^|
 ECHO.^| You don't understand, and drop it on the table.                                         ^|
 ECHO.^|                                                                                         ^|
 SETLOCAL ENABLEDELAYEDEXPANSION
 SET /P "=| ("<NUL
 (%hcol:?=0C%Press any key to go back)
 ENDLOCAL
 ECHO.^)                                                              ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
SET /p "=|_________________________________________________________________________________________|" <NUL
PAUSE>NUL
GOTO %CURRENTPARTSTORY%
:CROWBAR-PART-II-ENDLESSROOM-FORWARD
SET /a RADOOR=%RANDOM% %%3
TASKKILL /F /FI "WINDOWTITLE eq wscript.exe.scaryatmosphere" /T>NUL
SET "TARGETAEXT=.mystiriousdoor"
SET "TARGETAUDIO=%DATA_AUDIO_1%\m\mu-mysterious-door.mp3"
SET /A "SUBVOLUME=%VOLUME%-78"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
	IF EXIST "%TARGETAUDIO%" (
		IF /I "%ERRORLVL%"=="0" (
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %SUBVOLUME%
				ECHO Sound.settings.setMode "loop", True
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe%TARGETAEXT%" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		)
	)
)
CLS
 ECHO. _________________________________________________________________________________________
 ECHO.^| You walk forward,                                                                       ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| The artpiece along with the table and candle reappear constantly as you walk on,        ^|
 ECHO.^| nothing about them changes, while the candle remains on and the art remains unchanged.  ^|
 ECHO.^| This room feels like a loop...                                                          ^|
 ECHO.^|                                                                                         ^|
 SETLOCAL ENABLEDELAYEDEXPANSION
 SET /P "=| ("<NUL
 (%hcol:?=0C%Press any key to continue walking forward)
 ENDLOCAL
 ECHO.)                                             ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
SET /p "=|_________________________________________________________________________________________|" <NUL
PAUSE>NUL
:CROWBAR-PART-II-ENDLESSROOM-FORWARD-SKIP-L
TASKKILL /F /FI "WINDOWTITLE eq wscript.exe.mystiriousdoor" /T>NUL
SET "TARGETAEXT=.mystiriousdoor"
SET "TARGETAUDIO=%DATA_AUDIO_1%\m\mu-mysterious-door.mp3"
SET /A "SUBVOLUME=%VOLUME%-75"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
	IF EXIST "%TARGETAUDIO%" (
		IF /I "%ERRORLVL%"=="0" (
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %SUBVOLUME%
				ECHO Sound.settings.setMode "loop", True
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe%TARGETAEXT%" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		)
	)
)
:CROWBAR-PART-II-ENDLESSROOM-FORWARD-SKIP
SET "CURRENTPARTSTORY=CROWBAR-PART-II-ENDLESSROOM-FORWARD-SKIP"
CLS
 ECHO. _________________________________________________________________________________________
 ECHO.^| You walk forward,                                                                       ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| The artpiece along with the table and candle reappear constantly as you walk on,        ^|
 ECHO.^| nothing about them changes, while the candle remains on and the art remains unchanged.  ^|
 ECHO.^| This room feels like a loop...                                                          ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| You see something far away, looking like a row of doors.                                ^|
 ECHO.^| As you continue walking, you see there are three doors.                                 ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| Upon coming closer, you hear music. Each door has a symbol above them;                  ^|
 SET /a RADOOR=1
 SET /p "=| " <NUL
 IF %RADOOR% EQU 1 (
 CALL :CROWBAR-PART-II-ENDLESSROOM-FORWARD-SKIP-FIX_1
 ) ELSE IF %RADOOR% EQU 2 (
    SET /P "=first door has a "<NUL
	ECHO.a moon with a star, second door has a cross and the third has a          ^|
	ECHO.^| pentagram. The doors seem out of the ordinary, you realize one of the doors is where    ^|
 ) ELSE (
	ECHO.first door has a cross, second door has a pentagram and the third has a moon with a     ^|
	ECHO.^| star. The doors seem out of the ordinary, and you realize one of the doors is where     ^|
 )
 ECHO.^| this music comes from.                                                                  ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| You can go close to the doors to hear if the sound is coming from there, and afterwards ^|
 ECHO.^| choose a door.                                                                          ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|_________________________________________________________________________________________^|
SET UDERFINE=
SET /P UDERFINE=Type: 
IF NOT DEFINED UDERFINE GOTO %CURRENTPARTSTORY%
 IF /I "%UDERFINE%"=="MENU" GOTO MENU
  IF /I "%UDERFINE%"=="MAIN MENU" GOTO MENU
   IF /I "%UDERFINE%"=="MAINMENU" GOTO MENU
 IF /I "%UDERFINE%"=="BACK" GOTO MENU
  IF /I "%UDERFINE%"=="LEAVE" GOTO MENU
 IF /I "%UDERFINE%"=="RESTART" GOTO GAME-WORKER
 IF /I "%UDERFINE%"=="CLOSE" GOTO EXIT
  IF /I "%UDERFINE%"=="EXIT" GOTO EXIT
 IF /I "%UDERFINE%"=="GO TO THE DOOR WITH THE CROSS" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
  IF /I "%UDERFINE%"=="DOOR CROSS" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
   IF /I "%UDERFINE%"=="CROSS DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
    IF /I "%UDERFINE%"=="SELECT THE DOOR WITH THE CROSS" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
	 IF /I "%UDERFINE%"=="CHOOSE THE DOOR WITH THE CROSS" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
	  IF /I "%UDERFINE%"=="GO NEAR TO THE DOOR WITH THE CROSS" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
	   IF /I "%UDERFINE%"=="GO TO THE DOOR WITH THE CROSS" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
	    IF /I "%UDERFINE%"=="APPROACH THE DOOR WITH THE CROSS" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
		 IF /I "%UDERFINE%"=="OPEN THE DOOR WITH THE CROSS" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
		  IF /I "%UDERFINE%"=="GO TO DOOR WITH CROSS" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
		   IF /I "%UDERFINE%"=="CHOOSE THE DOOR WITH CROSS" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
		    IF /I "%UDERFINE%"=="SELECT THE DOOR WITH CROSS" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
			 IF /I "%UDERFINE%"=="GO TO THE SECOND DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
			  IF /I "%UDERFINE%"=="GO TO THE MIDDLE DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
			   IF /I "%UDERFINE%"=="SELECT THE MIDDLE DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
			    IF /I "%UDERFINE%"=="GO TO THE SECOND DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
				 IF /I "%UDERFINE%"=="GO THROUGH THE SECOND DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
				  IF /I "%UDERFINE%"=="SELECT THE SECOND DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
				   IF /I "%UDERFINE%"=="SECOND DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
				    IF /I "%UDERFINE%"=="APPROACH THE SECOND DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
 IF /I "%UDERFINE%"=="GO TO THE DOOR WITH THE MOON AND A STAR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORMOONSTAR
  IF /I "%UDERFINE%"=="DOOR MOON WITH A STAR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORMOONSTAR
   IF /I "%UDERFINE%"=="MOON WITH A STAR DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORMOONSTAR
    IF /I "%UDERFINE%"=="SELECT THE DOOR WITH THE MOON AND A STAR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORMOONSTAR
	 IF /I "%UDERFINE%"=="CHOOSE THE DOOR WITH THE MOON AND A STAR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORMOONSTAR
	  IF /I "%UDERFINE%"=="GO NEAR TO THE DOOR WITH THE MOON AND A STAR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORMOONSTAR
	   IF /I "%UDERFINE%"=="GO TO THE DOOR WITH THE MOON AND A STAR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORMOONSTAR
	    IF /I "%UDERFINE%"=="APPROACH THE DOOR WITH THE MOON AND A STAR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORMOONSTAR
		 IF /I "%UDERFINE%"=="OPEN THE DOOR WITH THE MOON AND A STAR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORMOONSTAR
		  IF /I "%UDERFINE%"=="GO TO THE LAST DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORMOONSTAR
		   IF /I "%UDERFINE%"=="GO THROUGH THE LAST DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORMOONSTAR
		    IF /I "%UDERFINE%"=="GO TO THE THIRD DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORMOONSTAR
 IF /I "%UDERFINE%"=="GO TO THE DOOR WITH THE PENTAGRAM" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORPENTAGRAM
  IF /I "%UDERFINE%"=="DOOR PENTAGRAM" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORPENTAGRAM
   IF /I "%UDERFINE%"=="PENTAGRAM DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORPENTAGRAM
    IF /I "%UDERFINE%"=="SELECT THE DOOR WITH THE PENTAGRAM" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORPENTAGRAM
	 IF /I "%UDERFINE%"=="CHOOSE THE DOOR WITH THE PENTAGRAM" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORPENTAGRAM
	  IF /I "%UDERFINE%"=="GO NEAR TO THE DOOR WITH THE PENTAGRAM" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORPENTAGRAM
	   IF /I "%UDERFINE%"=="GO TO THE DOOR WITH THE PENTAGRAM" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORPENTAGRAM
	    IF /I "%UDERFINE%"=="APPROACH THE DOOR WITH THE PENTAGRAM" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORPENTAGRAM
		 IF /I "%UDERFINE%"=="OPEN THE DOOR WITH THE PENTAGRAM" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORPENTAGRAM
          IF /I "%UDERFINE%"=="GO TO THE FIRST DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORPENTAGRAM
		   IF /I "%UDERFINE%"=="GO THROUGH THE FIRST DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORPENTAGRAM
		    IF /I "%UDERFINE%"=="APPROACH THE FIRST DOOR" GOTO CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORPENTAGRAM
GOTO %CURRENTPARTSTORY%
:CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORCROSS
TASKKILL /F /FI "WINDOWTITLE eq wscript.exe.mystiriousdoor" /T>NUL
SET "TARGETAEXT=.mystiriousdoor"
SET "TARGETAUDIO=%DATA_AUDIO_1%\m\mu-mysterious-door.mp3"
SET /A "SUBVOLUME=%VOLUME%-65"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
	IF EXIST "%TARGETAUDIO%" (
		IF /I "%ERRORLVL%"=="0" (
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %SUBVOLUME%
				ECHO Sound.settings.setMode "loop", True
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe%TARGETAEXT%" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		)
	)
)
CLS
 ECHO. _________________________________________________________________________________________
 SETLOCAL ENABLEDELAYEDEXPANSION
 SET /P "=| You "<NUL
 (%hcol:?=0E%move)
 ENDLOCAL
 ECHO. to the door with the cross...                                                  ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| The music gets louder, the door being open a bit. What might be making this noise,      ^|
 ECHO.^| and why is it here?                                                                     ^|
 ECHO.^| Something about this feels weird...                                                     ^|
 ECHO.^|                                                                                         ^|
 SETLOCAL ENABLEDELAYEDEXPANSION
 SET /P "=| ("<NUL
 (%hcol:?=0B%You can go through this door or go back and try another)
 ENDLOCAL
 ECHO.)                               ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|_________________________________________________________________________________________^|
SET UDERFINE=
SET /P UDERFINE=!Coming Soon: 
GOTO %CURRENTPARTSTORY%-L
:CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORMOONSTAR
TASKKILL /F /FI "WINDOWTITLE eq wscript.exe.mystiriousdoor" /T>NUL
SET "TARGETAEXT=.mystiriousdoor"
SET "TARGETAUDIO=%DATA_AUDIO_1%\m\mu-mysterious-door.mp3"
SET /A "SUBVOLUME=%VOLUME%-79"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
	IF EXIST "%TARGETAUDIO%" (
		IF /I "%ERRORLVL%"=="0" (
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %SUBVOLUME%
				ECHO Sound.settings.setMode "loop", True
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe%TARGETAEXT%" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		)
	)
)
CLS
 ECHO. _________________________________________________________________________________________
 SETLOCAL ENABLEDELAYEDEXPANSION
 SET /P "=| You "<NUL
 (%hcol:?=0E%move)
 ENDLOCAL
 ECHO. to the door with the moon and star...                                     ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 SETLOCAL ENABLEDELAYEDEXPANSION
 SET /P "=| ("<NUL
 (%hcol:?=0B%You can go through this door or go back and try another)
 ENDLOCAL
 ECHO.)                               ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|_________________________________________________________________________________________^|
SET UDERFINE=
SET /P UDERFINE=!Coming Soon: 
GOTO %CURRENTPARTSTORY%-L
:CROWBAR-PART-II-ENDLESSROOM-FORWARD-DOORPENTAGRAM
TASKKILL /F /FI "WINDOWTITLE eq wscript.exe.mystiriousdoor" /T>NUL
SET "TARGETAEXT=.mystiriousdoor"
SET "TARGETAUDIO=%DATA_AUDIO_1%\m\mu-mysterious-door.mp3"
SET /A "SUBVOLUME=%VOLUME%-79"
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
	IF EXIST "%TARGETAUDIO%" (
		IF /I "%ERRORLVL%"=="0" (
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %SUBVOLUME%
				ECHO Sound.settings.setMode "loop", True
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP%\TMP_AUDIO.vbs"
			START /min "wscript.exe%TARGETAEXT%" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP%\TMP_AUDIO.vbs"^&EXIT
		)
	)
)
CLS
 ECHO. _________________________________________________________________________________________
 SETLOCAL ENABLEDELAYEDEXPANSION
 SET /P "=| You "<NUL
 (%hcol:?=0E%move)
 ENDLOCAL
 ECHO. to the door with the petagram                                      ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 SETLOCAL ENABLEDELAYEDEXPANSION
 SET /P "=| ("<NUL
 (%hcol:?=0B%You can go through this door or go back and try another)
 ENDLOCAL
 ECHO.)                               ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|_________________________________________________________________________________________^|
SET UDERFINE=
SET /P UDERFINE=!Coming Soon: 
GOTO %CURRENTPARTSTORY%-L














































































































::- Storyline: THE|REDROOM. Part:III
:CROWBAR-PART-III-REDROOM
TASKLIST /FI "IMAGENAME eq wscript.exe" 2>NUL | FIND /I /N "wscript.exe">NUL
IF /I "%ERRORLEVEL%"=="1" (
 IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (
  TASKKILL /F /FI "WINDOWTITLE eq cmd005" /T >NUL
  TASKKILL /F /IM wscript.exe >NUL
  START "cmd005" /MIN %SOUNDSMANAGER-MULTI%
 )
)
(ECHO.TRUE)>"%DATA_SAVES%\CROWBAR-PART-III-REDROOM.dll"
MODE CON:COLS=%COLS% LINES=%LINES%
 ECHO. _________________________________________________________________________________________
 ECHO.^| Suddenly you enter a scary, red-lit room... There's a lot of symbolistic words writen   ^|
 ECHO.^| in blood on the walls. The light coming through the windows turn red, which shocks you. ^|
 ECHO.^| A voice in your head starts talking to you, making your dizzy.                          ^|
 ECHO.^|                                                                                         ^|
SETLOCAL ENABLEDELAYEDEXPANSION&FOR /F "TOKENS=1,2 DELIMS=#" %%A IN ('"PROMPT #$H#$E# & ECHO ON & FOR %%B IN (1) DO REM"') DO (SET "DEL=%%A")
ENDLOCAL
SET /p "=| (" <NUL
CALL :COLORTEXT 0C "Press any key to continue..."
 ECHO.)                                                             ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
SET /p "=|_________________________________________________________________________________________|" <NUL
PAUSE>NUL
MODE CON:COLS=%COLS% LINES=%LINES%
 ECHO. _________________________________________________________________________________________
 ECHO.^| Suddenly you enter a scary, red-lit room... There's a lot of symbolistic words writen   ^|
 ECHO.^| in blood on the walls. The light coming through the windows turn red, which shocks you. ^|
 ECHO.^| A voice in your head starts talking to you, making your dizzy.                          ^|
SETLOCAL ENABLEDELAYEDEXPANSION&FOR /F "TOKENS=1,2 DELIMS=#" %%A IN ('"PROMPT #$H#$E# & ECHO ON & FOR %%B IN (1) DO REM"') DO (SET "DEL=%%A")
ENDLOCAL
SET /p "=| '" <NUL
CALL :COLORTEXT 09 "W- What's going on"
SET /p "=?" <NUL
CALL :COLORTEXT 09 " Wha- What is happening to me"
 ECHO.?!' You said outloud.                  ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| After sitting on the floor got a while, you finally calm down. But the scary atmospher  ^|
 ECHO.^| remains. You can finally see the room clearly and start to explore it. There's alot of  ^|
 ECHO.^| bloody stuff, and even the ceiling drips blood.                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^| It's a rather small room, with everything flooded with blood, you can see a bed with a  ^|
 ECHO.^| knife on it. Next to is a bedpost. On the other side of the room is alot of boxes,      ^|
 ECHO.^| and there's a mirror next to you.                                                       ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|_________________________________________________________________________________________^|
ENDLOCAL
IF EXIST "%DATA_SETTINGS%\ONSOUNDS.dll" (START "" "MF-SUSPENSEMOMENT.vbs")
SET UDERFINE=
SET /p "=Coming Soon." <NUL
PAUSE>NUL
::GOTO CROWBAR-REDROOM-I
MODE CON:COLS=%COLS% LINES=%LINES%
 ECHO. _________________________________________________________________________________________
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
 ECHO.^|                                                                                         ^|
SET /p "=|_________________________________________________________________________________________|" <NUL
TIMEOUT /T 4 >NUL
GOTO MENU
EXIT
:: - - - SYSTEM THAT IS NO LONGER WORKING BUT I HAVE IT HERE FOR LATER ... - - - ::
:COLORTEXT
<NUL SET /P ".=%DEL%" > "%~2"
FINDSTR /V /A:%1 /R "^$" "%~2" NUL
DEL "%~2" > NUL 2>&1
GOTO :EOF
:: - - - THESE ARE HERE SO I CAN MAKE THIS GOD DAMN GAME WORK. - - - ::
:CROWBAR-PART-II-ENDLESSROOM-FORWARD-SKIP-FIX_1
SET /P "=first door has a "<NUL
SETLOCAL ENABLEDELAYEDEXPANSION
(%hcol:?=0C%pentagram)
SET /P "=, second door has a "<NUL
(%hcol:?=0C%cross)
SET /P "=, and the third has a "<NUL
(%hcol:?=0C%moon with a)
ECHO.    ^|
SET /p "=| "<NUL
(%hcol:?=0C%star)
ENDLOCAL
SET /p ""=". The doors seem out of the ordinary, and you realize one of the doors is where     " <NUL
ECHO.^|
GOTO :EOF
:CROWBAR-PART-II-ENDLESSROOM-FORWARD-SKIP-FIX_2
COMING SOON
GOTO :EOF
:GODPLEASEMAKETHISGAMEWORK
ECHO..                                            ^|
GOTO :EOF
:GODPLEASEMAKETHISGAMEWORK-2
ECHO..                                                          ^|
GOTO :EOF