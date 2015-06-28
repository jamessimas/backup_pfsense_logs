# About
This script will backup create a tarball of a single directory and then upload it to a FTP server. This script was created in order to backup pfSense squid logs.

# Usage
1. Upload the script to: **/etc**
2. Make it executable: **chmod +x /etc/backup_pfsense_logs.sh**
3. Download and install the pfSense Cron package
4. Create a cron job to run it as root.

# Example cron job settings
	Minute: 	0
	Hour: 		* 
	Mday: 		*
	Month: 		*
	Wday:		*
	Who: 		root
	Command: 	/etc/backup_pfsense_logs.sh