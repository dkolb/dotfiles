#!/usr/bin/env fish
sudo launchctl unload /Library/LaunchDaemons/com.jamfsoftware.jamf.daemon.plist
sudo launchctl unload /Library/LaunchDaemons/com.jamfsoftware.task.1.plist
sudo launchctl unload /Library/LaunchDaemons/com.jamfsoftware.startupItem.plist
