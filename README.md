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



`Example output
<img width="453" height="593" alt="image" src="https://github.com/user-attachments/assets/07d584ea-0f1e-404b-b921-84ca3444f4d0" />


Challenges`
setup.log challenges
using ls -l on the setup.log, it displays the following permission after creation
-rw-r--r-- 1 obunm obunm    0 Nov 15 09:22 

After changing permission with this command chmod -u+x setup.log, I got the following error message when I "nano setup.log"
getting error: [ Error reading setup.log: Permission denied ]

I checked the permission and it shows : ---x--x--x 1 obunm obunm    0 Nov 15 09:22 setup.log
I had to investigate what I did wrong.

Error identified and Solution
Error:I used chmod -u+x setup.log instead of chmod u+x setup.log
      -u removes read/write and grants execute to all users
Solution: deleted the setup.log file, re-create setup.log
         and granted necessary permission with chmod u+x setup.log

Setup.sh challenges
error: this message appeared "./setup.sh: line 39: $log_file: ambiguous redirect
The reason for the above error is bacause log_file variable was defined after the function that calls the variable.
Solution: define the log_file variable at the begin of the script 
It was difficult to apply color codes for success, info, warning and error but with a little research I figured it out.

EOF error: While trying to run the ./setup.sh
unexpected EOF while looking for matching `"'
syntax error: unexpected end of file
Solution: It was challenging to find the missing matching ". I installed shellcheck package (i.e sudo apt install shellcheck) The shellcheck is able to check and specify the line with the error after running shellcheck on setup.sh i.e shellcheck setup.sh. I had NC enclosed in different brackets [NC} instead of {NC}. See the image below

<img width="254" height="108" alt="image" src="https://github.com/user-attachments/assets/ba47869d-50d9-4250-9d7f-30a21506fae6" />


