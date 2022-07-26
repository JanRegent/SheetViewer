
call backendPull.bat
set SUBFILENAME='%1' %CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%
echo const buildVersion = SUBFILENAME;     > lib\BL\appConfig\buildversion.dart 
echo const appVersion = '22.08';    > lib\BL\appConfig\appversion.dart 
call bakgit.bat %1 %2
call bakzip.bat %1 %2





