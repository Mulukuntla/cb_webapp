#!/bin/bash

LOG_FILE="/var/log/httpd_monitor.log"
HTTPD_SERVICE="httpd"

while true; do
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  status=$(systemctl is-active $HTTPD_SERVICE)

  if [ "$status" == "active" ]; then
    echo "$timestamp - $HTTPD_SERVICE is running." >> "$LOG_FILE"
  else
    echo "$timestamp - $HTTPD_SERVICE is not running." >> "$LOG_FILE"
    # You can add additional actions here, like restarting the service
    # systemctl start $HTTPD_SERVICE
  fi

  sleep 300  # Adjust the interval (in seconds) based on your needs
done
