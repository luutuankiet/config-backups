@echo OFF
set task_title=%*
set access_token=b57f108e-6ae5-4586-8346-12300468942f

rem windows dont support python natively so using a python wrapper

set py_script=regex_helper.py
set py_cmd=python %py_script% %task_title%
rem execute script
for /f "delims=" %%i in ('%py_cmd%') do set task_title=%%i

echo adding task "%task_title%"...



set /p task_body=input description if any:



curl -s -X POST -H "Content-Type: application/json" -H "Authorization: Bearer %access_token%" -d "{\"title\":\"%task_title%\", \"content\": \"%task_body%\"}" https://api.ticktick.com/open/v1/task --ssl-no-revoke & exit
