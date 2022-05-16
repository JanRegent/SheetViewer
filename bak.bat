
call backendPull.bat

echo const buildVersion = '%1';     > lib\BL\appVersionInfo\buildversion.dart 
echo const appMode = 'dev';         > lib\BL\appVersionInfo\appmode.dart 
echo const appVersion = '22.05';    > lib\BL\appVersionInfo\appversion.dart 
call bakgit.bat %1 %2
call bakzip.bat %1 %2





