echo off
cd backend\gdrive\
rem once! clasp clone https://script.google.com/home/projects/1pYOMB1Ze9EJbeI5FydCNfkL6YCUAEFnTKiwWHnQi-q8xgMn5Rlf-IgA-/edit

call clasp pull
cd  ..\..

cd backend\contentServiceDoc\
rem once! clasp clone https://script.google.com/home/projects/1GbRtnF9akLdslJR2O0aYXhssZQzdcwYfsxRzUfsynC3kt0HiWIK5-O9w/edit
call clasp pull
cd  ..\..
