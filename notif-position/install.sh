#!/bin/bash

cp move-notif.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/move-notif.plist

# Finally, should you ever need to disable the script, don't forget to unload it with:

# launchctl unload -w ~/Library/LaunchAgents/NAME-OF-YOUR-PLIST.plist
