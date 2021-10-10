@echo off
set yy=%date:~-4%
set mm=%date:~-7,2%
set dd=%date:~-10,2%

set MYDATE=---%2__%yy%_%mm%%dd%

del *.7z

C:\uti\7-Zip\7z.exe a %1%-%%MYDATE%  *.rules fire*.* depl*.* lib\* test\* web\*.* web\help\*.* docs\* web\appsScript\*.*  pubspec.yaml *.bat *.ps1  -r

xcopy *.7z  "c:\dev\zBak\SheetViewer\" /C /Y
xcopy *.7z  "C:\Users\janre\OneDrive\SheetViewer\" /C /S /M  /Y
xcopy *.7z  "C:\Users\janre\Dropbox\Drop2NAS\" /C /Y

xcopy *.7z  "p:\pCloud"  /C /Y
xcopy *.7z  "g:\Můj disk\z.rest\_dev\SheetViewer\"  /C /Y
xcopy *.7z  "C:\Asus WebStorage\jan.regent@gmail.com\MySyncFolder\backup\SheetViewer" /C /Y
pause
call powershell .\bakftp.ps1
del *.7z





