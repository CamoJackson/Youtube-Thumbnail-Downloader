echo off
SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION
SET me=%~n0
SET parent=%~dp0

set SAVELOCATION=C:\Users\%USERNAME%\Desktop\
set REFFILE=%parent%Ref.txt

findstr /R /N "^" %REFFILE% | find /C ":" > TempFile
set /p NUMIN=<TempFile
:Loop
findstr /r /n "." Ref.txt | findstr %NUMIN%":" > TempFile
set /p VIDID=<TempFile

if %NUMIN% GEQ 1000 goto :N5
if %NUMIN% GEQ 100 goto :N4
if %NUMIN% GEQ 10 goto :N3
if %NUMIN% GEQ 1 goto :N2

:N5
set VIDID=%VIDID:~5%
goto :NumDone
:N4
set VIDID=%VIDID:~4%
goto :NumDone
:N3
set VIDID=%VIDID:~3%
goto :NumDone
:N2
set VIDID=%VIDID:~2%
goto :NumDone

:NumDone
echo %VIDID%
Pause
set DOWNLOCATION= http://img.youtube.com/vi/%VIDID%/maxresdefault.jpg
set LOCLOCATION=%SAVELOCATION%%VIDID%.jpg
bitsadmin /transfer DownloadThumb /download %DOWNLOCATION% %LOCLOCATION%
set /a NUMIN=%NUMIN%-1
if %NUMIN% GTR 0 goto :Loop
del TempFile
