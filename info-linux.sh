#!/bin/bash

# Display a list of logged-in users
logged_in_users=$(who)

# Display the last 5 logins
last_logins=$(last -Faiwx -n 10)

# Display accounts with a user ID of zero
uid_zero_accounts=$(grep ':x:0:' /etc/passwd)

# Display the last 5 lines of the current user's Bash history
bash_history=$(tail -n 5 ~/.bash_history)

# Display the files open by the current user
open_files=$(lsof -u $(whoami))

# Print the results
date
hostname
whoami
id
echo -e "\n################################################################################"
echo -e "Logged-in users:\n"
echo "$logged_in_users"

echo -e "\n################################################################################"
echo -e "Last 5 logins:\n"
echo "$last_logins"

echo -e "\n################################################################################"
echo  -e "Accounts with a user ID of zero:\n"
echo "$uid_zero_accounts"

echo -e "\n################################################################################"
echo  -e "/etc/passwd\n"
cat /etc/passwd

echo -e "\n################################################################################"
echo  -e "Crontab:\n"
crontab -l

echo -e "\n################################################################################"


echo -e "\n################################################################################"
echo  -e "Files open by the current user:\n"
echo "$open_files"
