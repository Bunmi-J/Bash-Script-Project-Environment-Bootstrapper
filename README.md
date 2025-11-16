# Bash-Script-Project-Environment-Bootstrapper
This project automates a ready-to-use development environment for your project. Rather than spending hours manually setting up a development environment each time a developer joins the team, just with one command, the bash script will automatically create virtual environments, upgrade pip, set up .gitignore files, and install essential tools.
The benefit of automating the process is to ensure consistency across all machines. This also ensures developers are using the same Python and packages versions. The virtual environment created will eliminate dependency on system Python packages and project conflicts.
Overall this automation process saves time and ensures consistency and efficiency acrosss the team.

Essentially, the script checks if a virtual enevironment exist and if there is none, a virtual environment is created. If a virtual environment exists, the script activate the virtual environment and displays success or failure depending on the outcome of the command.
if the activation is successfull, it will upgrade pip and display message outcome of the upgrade if it was successfull or failed.
The script will install Pandas and Requests, check if.gitignore exists and if missing create one.

In addition to the above the script prints progress messages with different colors for clarity.

The script writes logs to a log file indicating the time, date and outcome of each process.
To activate the script, run ./setup.sh from home directory.



