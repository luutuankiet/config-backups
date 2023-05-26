@echo OFF
set task_title=%*
echo adding task "%task_title%"...

rem comment this part if you dont want task body
rem set /p task_body=input description if any:

curl -X POST -H "Content-Type: text/plain" -d "%task_title%" --ssl-no-revoke https://hook.us1.make.com/mt0sveegbtqbsdhgobsqtph9nycwx7t6 & exit
