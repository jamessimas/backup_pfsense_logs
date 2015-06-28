#!/bin/sh

# This script backs up logs from pfSense and FTPs them to an off-computer location.

FILENAME="pfSense-log-backup-`date "+%Y%m%d-%H%M"`.tgz"
echo ">>> Creating backup to /tmp/$FILENAME"
tar czPf /tmp/$FILENAME \
        /var/squid/logs
echo ">>> Backup file created to /tmp/$FILENAME"

# FTP info
# USER -- Username
# PASSWD -- Password
# ADDR -- FTP server address
USER="username"
PASSWD="password"
ADDR="host.yourdomain.com"

# Do FTP
echo ">>> FTPing /tmp/$FILENAME"
ftp -n $ADDR <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
binary
lcd /tmp
put $FILENAME
quit
END_SCRIPT
echo ">>> FTP done"

# Cleanup
rm -f /tmp/$FILENAME

echo ">>> Backup completed."