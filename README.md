# LX-Server-Report
Bash Script for reading health parameters from debian servers and reporting issues via e-mail

Features:
- At the moment only check the free disk space and report when you are running low on free space

Installation instructions:
- Just run install.sh as root like "sudo bash install.sh"
- The system should be able to send mails - This is required for the script to work
- After the installation one should edit the config.sh file i.e. set the tresholds
