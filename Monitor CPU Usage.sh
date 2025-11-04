#!/bin/bash
threshold=90 #Threshold limit to create alert in %

# Monitor CPU usage and trigger alert if threshold exceeded
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)

if [ "$cpu_usage" -gt "$threshold" ]; then
echo "High CPU usage detected: $cpu_usage%"

#--------------------------(Optional)---------------------------------------------------
#1. Sending Email Alerts
#This is a widely used method for server-side monitoring and alerts.
#Prerequisites: An installed Mail Transfer Agent (MTA) like sendmail, postfix, or mailutils. If not installed, you can typically install it using your system's package manager (e.g., sudo apt install mailutils on Debian/Ubuntu).
RECIPIENT="your_email@example.com"
SUBJECT="Alert from CPU Monitor Script: Important Event"
MESSAGE="This is an automated alert from your shell script. Something noteworthy happened! High CPU usage detected: $cpu_usage%"
echo "$MESSAGE" | mail -s "$SUBJECT" "$RECIPIENT"


#2. Displaying Desktop Notifications (Linux)
#For alerts on a local desktop environment, notify-send is a common tool.
#Prerequisites: A desktop environment with notify-send installed (usually part of libnotify-bin or similar packages).
TITLE="Script Alert!"
MESSAGE="A critical process has finished."
ICON="/usr/share/icons/gnome/256x256/status/dialog-warning.png" # Optional icon
notify-send -i "$ICON" "$TITLE" "$MESSAGE"

#---------------------------(Optional)---------------------------------------------------

fi