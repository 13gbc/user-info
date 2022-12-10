#!/bin/bash

# Display a list of logged-in users
logged_in_users=$(who)

# Display the last 5 logins
last_logins=$(last -n 5)

# Display accounts with a user ID of zero
uid_zero_accounts=$(grep ':x:0:' /etc/passwd)

# Display the last 5 lines of the current user's Bash history
bash_history=$(tail -n 5 ~/.bash_history)

# Display the files open by the current user
open_files=$(lsof -u $(whoami))

# Print the results
echo -e "\n########################################"
echo -e "Logged-in users:\n"
echo "$logged_in_users"

echo -e "\n########################################"
echo -e "Last 5 logins:\n"
echo "$last_logins"

echo -e "\n########################################"
echo  -e "Accounts with a user ID of zero:\n"
echo "$uid_zero_accounts"

echo -e "\n########################################"
echo  -e "Last 5 lines of Bash history:\n"
echo "$bash_history"

echo -e "\n########################################"
echo  -e "Files open by the current user:\n"
echo "$open_files"
