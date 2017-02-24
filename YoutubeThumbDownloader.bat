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
set /p VIDID=<TempFile

:RmLnNum
findstr /R "*:" %VIDID% 
set VIDID=%VIDID:~1%

set DOWNLOCATION= http://img.youtube.com/vi/%VIDID%/maxresdefault.jpg
set LOCLOCATION=%SAVELOCATION%%VIDID%.jpg
bitsadmin /transfer DownloadThumb /download %DOWNLOCATION% %LOCLOCATION%
set /a NUMIN=%NUMIN%-1
if %NUMIN% GTR 0 goto :Loop
del TempFile
