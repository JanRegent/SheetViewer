rem check exist 
rem     git ls-remote git remote add master  https://github.com/JanRegent/SheetViewer
rem add remote
rem     git remote add master  https://github.com/JanRegent/SheetViewer
call git add .
call git status
call git commit -m " %1---%2"
call git push origin main
