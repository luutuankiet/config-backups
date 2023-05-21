#!/bin/sh

access_token="b57f108e-6ae5-4586-8346-12300468942f"
if [ -z "$1" ]; then
    echo "Usage: $0 your task title"

    exit 1
fi

task_title=$(echo "$@" | sed 's/\\/\\\\/g; s/"/\\"/g')
echo "parsed title $task_title"
json_task='{"title": "'$task_title'"}'
# finally send request to create task
resp_create_task=$(/mnt/us/usbnet/bin/curl -s \
    --fail-with-body \
    --header "Content-Type: application/json" \
    --header "Authorization: Bearer b57f108e-6ae5-4586-8346-12300468942f" \
    --request POST \
    --data "$json_task" \
    https://api.ticktick.com/open/v1/task)

echo "task sent $@"
if (( $? != 0 )); then
    echo "Error on creating task. Server response:"
    echo "$resp_create_task"

    exit 2
fi
