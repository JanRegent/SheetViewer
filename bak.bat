
call backendPull.bat
rem $PSDefaultParameterValues['Out-File:Encoding'] = 'ascii'  
rem "\"%1 %2\"" | Out-File -FilePath assets\config\buildVersion.txt
echo const buildVersion = '%1';  > lib\BL\buildversion.dart 
call bakgit.bat %1 %2
call bakzip.bat %1 %2





