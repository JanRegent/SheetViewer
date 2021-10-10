#Import-Module psftp



$Dir="./"    
 
#ftp server 
$ftp = "ftp://192.168.86.226/public/sheets2mob/" 
$user = "admin" 
$pass = "kamdom"  
 
$webclient = New-Object System.Net.WebClient 
 
$webclient.Credentials = New-Object System.Net.NetworkCredential($user,$pass)  
 
#list every sql server trace file 
foreach($item in (dir $Dir "*.7z")){ 
    "Uploading $item..." 
    $uri = New-Object System.Uri($ftp+$item.Name) 
    try {#exception for parents folder
        $webclient.UploadFile($uri, $item.FullName) 
    }
    catch { }
 } 