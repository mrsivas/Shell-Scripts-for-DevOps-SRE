#!/bin/bash
scheduled_task="/path/to/your_script.sh"
schedule_time="0 2 * * *"

#   0 0 * * *: At midnight, every day.
#   30 7 * * 1-5: At 7:30 a.m., every weekday (Monday to Friday).
#   0 0 1 1 *: At midnight on January 1st, once a year.
#   0 15 10 * * ?: At 10:15 a.m. on the last day of every month.
#   0 0/5 14 * * ?: Every 5 minutes, from 2:00 p.m. to 2:59 p.m. every day. 



# Schedule a task using cron
echo "$schedule_time $scheduled_task" | crontab -
echo "Task scheduled successfully."