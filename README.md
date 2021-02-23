# LX-Server-Report
Bash Script for reading health parameters from debian servers and reporting issues via e-mail

Features:
- By now only check the free disk space and report when you are running low on free space

Installation instructions:
- Download install.sh: https://raw.githubusercontent.com/FreeQster/lx_server-report/main/install.sh
- Execute "chmod +x install.sh" to make the install-script executable
- Run install.sh as root like "sudo bash install.sh"
- The system should be able to send mails - This is required for the script to work
- After the installation one should edit the config.sh file i.e. set the tresholds
