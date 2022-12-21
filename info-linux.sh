#!/bin/bash
set -euo pipefail

# Set strict error checking and exit on non-zero status codes

# Display usage message
usage() {
  echo "Usage: $0 [OPTION]..."
  echo "Generate a system report."
  echo ""
  echo "  -h, --help    display this help and exit"
  echo "  -v, --verbose increase verbosity"
}

# Parse command line options
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    -v|--verbose)
      verbose=true
      shift
      ;;
    *)
      usage
      exit 1
      ;;
  esac
done

# Function to display logged-in users
display_logged_in_users() {
  who
}

# Function to display last logins
display_last_logins() {
  last -Faiwx -n 10
}

# Function to display accounts with a user ID of zero
display_uid_zero_accounts() {
  grep ':x:0:' /etc/passwd
}

# Function to display the last 5 lines of the current user's Bash history
display_bash_history() {
  tail -n 5 ~/.bash_history
}

# Function to display the files open by the current user
display_open_files() {
  lsof -u "$(whoami)"
}

# Function to display the most recent login of all users or of a given user
display_lastlog() {
  lastlog
}

# Print the results
echo "################################################################################"
echo "Reference:"
date
hostname
whoami
id
echo "################################################################################"
echo "Logged-in users:"
display_logged_in_users

echo "################################################################################"
echo "Last logins:"
display_last_logins

echo "################################################################################"
echo "Accounts with a user ID of zero:"
display_uid_zero_accounts

echo "################################################################################"
echo "/etc/passwd"
cat /etc/passwd

echo "################################################################################"
echo "Crontab:"
crontab -l
