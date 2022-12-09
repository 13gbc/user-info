#!/bin/bash

# Display a list of logged-in users
echo -e "\n########################################"
echo -e "Logged-in users:\n"
who

# Display the last 5 logins
echo -e "\n########################################"
echo -e "Last 5 logins:\n"
last -n 5

# Display accounts with a user ID of zero
echo -e "\n########################################"
echo  -e "Accounts with a user ID of zero:\n"
grep ':x:0:' /etc/passwd

# Display the last 5 lines of the current user's Bash history
echo -e "\n########################################"
echo  -e "Last 5 lines of Bash history:\n"
tail -n 5 ~/.bash_history

# Display the files open by the current user
echo -e "\n########################################"
echo  -e "Files open by the current user:\n"
lsof -u $(whoami)
