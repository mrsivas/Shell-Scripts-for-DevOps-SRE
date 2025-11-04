#!/bin/bash
threshold=90
# Monitor disk usage and trigger alert if threshold exceeded
disk_usage=$(df -h | grep "/dev/sda1" | awk '{print $5}' | cut -d%
-f1)
if [ "$disk_usage" -gt "$threshold" ]; then
echo "High disk usage detected: $disk_usage%"


#--------------------------(Optional)---------------------------------------------------
#1. Sending Email Alerts
#This is a widely used method for server-side monitoring and alerts.
#Prerequisites: An installed Mail Transfer Agent (MTA) like sendmail, postfix, or mailutils. If not installed, you can typically install it using your system's package manager (e.g., sudo apt install mailutils on Debian/Ubuntu).
RECIPIENT="your_email@example.com"
SUBJECT="Alert from CPU Monitor Script: Important Event"
MESSAGE="This is an automated alert from your shell script. Something noteworthy happened! High CPU usage detected: $disk_usage%"
echo "$MESSAGE" | mail -s "$SUBJECT" "$RECIPIENT"


#2. Displaying Desktop Notifications (Linux)
#For alerts on a local desktop environment, notify-send is a common tool.
#Prerequisites: A desktop environment with notify-send installed (usually part of libnotify-bin or similar packages).
TITLE="Script Alert!"
MESSAGE="A critical process has finished."
ICON="/usr/share/icons/gnome/256x256/status/dialog-warning.png" # Optional icon
notify-send -i "$ICON" "$TITLE" "$MESSAGE"


#3. Sending Messages to Chat Platforms (e.g., Slack)
#This typically involves using curl to interact with the platform's API or webhooks.
#Prerequisites: A configured webhook URL for your desired chat platform
SLACK_WEBHOOK_URL="YOUR_SLACK_WEBHOOK_URL"
MESSAGE_TEXT="Alert: CPU usage is high on server X! : $disk_usage%"
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$MESSAGE_TEXT\"}" "$SLACK_WEBHOOK_URL"

#---------------------------(Optional)---------------------------------------------------


fi