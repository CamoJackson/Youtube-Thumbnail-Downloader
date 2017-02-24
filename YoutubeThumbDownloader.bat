echo off
SETLOCAL ENABLEEXTENSIONS
SET me=%~n0
SET parent=%~dp0

set SAVELOCATION=C:\Users\%USERNAME%\Desktop\
set REFFILE=C:\Users\%USERNAME%\Desktop\Ref.txt

findstr /R /N "^" %REFFILE% | find /C ":" > TempFile
set /p NUMIN=<TempFile
:Loop
findstr /r /n "." Ref.txt | findstr "%NUMIN%:" > TempFile
set VIDID=<TempFile

if %NUMIN% GEQ 1000 (
set NUMREM=5
goto :NumDone
)

if %NUMIN% GEQ 100 (
set NUMREM=4
goto :NumDone
)

if %NUMIN% GEQ 10 (
set NUMREM=3
goto :NumDone
)

if %NUMIN% GEQ 1 (
set NUMREM=2
goto :NumDone
)

echo "ERROR: more than 1000 Video ID's"
pause
quit

:NumDone
Pause
set VIDID=!VIDID:~%NUMREM%!
Pause
set DOWNLOCATION= http://img.youtube.com/vi/%VIDID%/maxresdefault.jpg
set LOCLOCATION=%SAVELOCATION%%VIDID%.jpg
bitsadmin /transfer DownloadThumb /download %DOWNLOCATION% %LOCLOCATION%
set /a NUMIN=%NUMIN%-1
if %NUMIN% GTR 0 goto :Loop
del TempFile
