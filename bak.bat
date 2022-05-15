
call backendPull.bat
$PSDefaultParameterValues['Out-File:Encoding'] = 'ascii'  
"\"%1 %2\"" > Out-File -FilePath assets\config\buildVersion.txt
call bakgit.bat %1 %2
call bakzip.bat %1 %2





