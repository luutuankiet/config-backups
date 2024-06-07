#!/usr/bin/osascript
repeat while true
	tell application "System Events"
		try
			set theWindow to window "Notification Center" of application process "NotificationCenter"
			set displaySize to size of theWindow
			# log displaySize
			set _groups to groups of UI element 1 of scroll area 1 of group 1 of theWindow
			repeat with _group in _groups
				# You can limit it to move only certain notifications
				#
				# set primaryLabel to value of static text 1 of _group
				# set secondaryLabel to value of static text 2 of _group
				# 
				# if primaryLabel contains "Slack" then...
				# if secondaryLabel contains "Google Calendar" then...
				
				set notifSize to size of _group
				# log notifSize
				
				# position 0,0 is top right corner
				set position of theWindow to {-((first item of displaySize) - (first item of notifSize)) / 2, ((second item of displaySize) - (second item of notifSize) - 36) / 3}
				-- set position of theWindow to {-((first item of displaySize) - (first item of notifSize)) / 2, 0}
				# log position
			end repeat
		on error errText number errNum
			# Error -1719 == group not found, i.e. it was dismissed
			# Error -1728 == notification window not found, i.e. no notifications
			if ({-1719, -1728} does not contain {errNum}) then
				display dialog "move-notif error: " & errNum & return & errText
			end if
		end try
	end tell
	delay 1
end repeat


--  set displaySize to size of theWindow
--       set notifSize to size of first UI element of first scroll area of first group of theWindow
--       set position of theWindow to {-((first item of displaySize)-(first item of notifSize))/2,((second item of displaySize)-(second item of notifSize)-36)}
--     end repeat