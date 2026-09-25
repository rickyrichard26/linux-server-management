#!/bin/bash
# =========================================
# Linux User Management Script
# Usage: ./user_management.sh {add|delete|list} [username]
# =========================================

action=$1
username=$2

case "$action" in
  add)
    if [ -z "$username" ]; then
      echo "Error: username required. Usage: $0 add <username>"
      exit 1
    fi
    sudo useradd -m "$username" && echo "User '$username' added successfully."
    ;;
  delete)
    if [ -z "$username" ]; then
      echo "Error: username required. Usage: $0 delete <username>"
      exit 1
    fi
    sudo userdel -r "$username" && echo "User '$username' deleted successfully."
    ;;
  list)
    echo "Current system users:"
    cut -d: -f1 /etc/passwd
    ;;

  reset-password)
    if [ -z "$username" ]; then
      echo "Error: username required. Usage: $0 reset-password <username>"
      exit 1
    fi
    sudo passwd "$username"
    ;;

  *)
    echo "Usage: $0 {add|delete|list} [username]"    echo "Usage: $0 {add|delete|list|reset-password} [username]"
    exit 1
    ;;
esac
