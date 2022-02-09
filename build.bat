cls
cd web
cd assets
cd config
xcopy ..\..\..\assets\config\contentServiceUrl.txt /y
cd ..\..\..\
rem flutter build web
flutter build web --web-renderer html --release




