
call backendPull.bat
rem $PSDefaultParameterValues['Out-File:Encoding'] = 'ascii'  
rem "\"%1 %2\"" | Out-File -FilePath assets\config\buildVersion.txt
echo %1 > assets\config\buildVersion.txt
echo %2 >> assets\config\buildVersion.txt
call bakgit.bat %1 %2
call bakzip.bat %1 %2





