# LX-Server-Report
Bash Script for reading health parameters from debian servers and reporting issues via e-mail

Features:
- By now only check the free disk space and report when you are running low on free space

Additional Information:
- There is no error catching implemented yet
- The installation was successful when the following files are there:
  - Cron entry /etc/cron.d/lx_server-report
  - Main script file report.sh in the installation directory

Installation instructions:
- Download install.sh: https://raw.githubusercontent.com/FreeQster/lx_server-report/main/install.sh
- Execute "chmod +x install.sh" to make the install-script executable
- Run install.sh as root like "sudo bash install.sh"
- The system should be able to send mails - This is required for the script to work
- After the installation one should edit the config.sh file i.e. set the tresholds
