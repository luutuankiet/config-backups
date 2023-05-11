@echo OFF
set task_title=%*
set access_token=b57f108e-6ae5-4586-8346-12300468942f

echo adding task "%task_title%"...
set /p task_body=input description if any:


curl -s -X POST -H "Content-Type: application/json" -H "Authorization: Bearer %access_token%" -d "{\"title\":\"%task_title%\", \"content\": \"%task_body%\"}" https://api.ticktick.com/open/v1/task --ssl-no-revoke & exit
