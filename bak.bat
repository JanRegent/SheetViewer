
call backendPull.bat

echo const buildVersion = '%1';  > lib\BL\buildversion.dart 
echo const appVersion = '22.05';  > lib\BL\appversion.dart 
call bakgit.bat %1 %2
call bakzip.bat %1 %2





