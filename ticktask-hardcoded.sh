#!/bin/sh

access_token="b57f108e-6ae5-4586-8346-12300468942f"
if [ -z "$1" ]; then
    echo "Usage: $0 your task title"

    exit 1
fi

task_title=$(echo "$@")
echo "adding task $task_title"
# finally send request to create task
resp_create_task=$(/mnt/us/usbnet/bin/curl -X POST \
  -H 'Content-Type: text/plain' \
  -d "$task_title" \
  https://hook.us1.make.com/mt0sveegbtqbsdhgobsqtph9nycwx7t6)
  
if (( $? != 0 )); then
    echo "Error on creating task. Server response:"
    echo "$resp_create_task"

    exit 2
fi
