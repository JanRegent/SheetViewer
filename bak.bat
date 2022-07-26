
call backendPull.bat

echo const buildVersion = '%1';     > lib\BL\appConfig\buildversion.dart 
echo const appMode = 'dev';         > lib\BL\appConfig\appmode.dart 
echo const appVersion = '22.08';    > lib\BL\appConfig\appversion.dart 
call bakgit.bat %1 %2
call bakzip.bat %1 %2





