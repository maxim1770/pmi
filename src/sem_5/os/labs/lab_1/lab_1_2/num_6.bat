@echo off

:: Пункт 1

:: C:\Users\MaxDroN\python_projects\python_work\pmi
set dir_path=%1

set /a number_hidden_subdirectories = 0
for /r %dir_path% %%i in (.*) do echo %%~fi
for /r %dir_path% %%i in (.*) do set /a number_hidden_subdirectories = number_hidden_subdirectories + 1

echo Number of hidden subdirectories = %number_hidden_subdirectories%


for /f "tokens=*" %%i in ('dir /a:DH /b C:\Users\MaxDroN\python_projects\python_work\pmi') do echo %%~i

set /a number_hidden_subdirectories = 0
for /f "tokens=*" %%i in ('dir /a:DH /b C:\Users\MaxDroN\python_projects\python_work\pmi') do (
    set /a number_hidden_subdirectories = number_hidden_subdirectories + 1
)
echo Number of hidden subdirectories = %number_hidden_subdirectories%



:: Пункт 2
echo -------------------------------

set /a number_text_files = 0
for /r %dir_path% %%i in (*.txt) do (
    echo %%~fi
)

for /r %dir_path% %%i in (*.txt) do (
    set /a number_text_files = number_text_files + 1
)

echo Number of text files = %number_text_files%


echo -------------------------------

::for /r %%i in ('dir /A:DH /B "%dir_path%"') do (
::    echo %%~fi
::)



for /r %dir_path% %%i in () do echo %%~fi

echo -------------------------------



set t=dir %dir_path% /a:DH /B
::echo %t%


echo -------------------------------

for %dir_path% %%i in (*) do echo %%~i

echo -------------------------------

