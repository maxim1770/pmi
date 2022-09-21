@echo off

:: Пункт 1

:: C:\Users\MaxDroN\python_projects\python_work\pmi
set dir_path=%1

set /a number_hidden_subdirectories = 0

for /f "tokens=*" %%i in ('dir /a:DH /b %dir_path%') do (
    echo %dir_path%\%%~i
)

for /f "tokens=*" %%i in ('dir /a:DH /b %dir_path%') do (
    set /a number_hidden_subdirectories = number_hidden_subdirectories + 1
)

echo Number of hidden subdirectories = %number_hidden_subdirectories%


:: Пункт 2
echo -------------------------------

set /a number_text_files = 0

for /f "tokens=*" %%i in ('dir /b %dir_path%\*.txt') do (
    echo %dir_path%\%%~i
)

for /f "tokens=*" %%i in ('dir /b %dir_path%\*.txt') do (
    set /a number_text_files = number_text_files + 1
)

echo Number of text files = %number_text_files%


