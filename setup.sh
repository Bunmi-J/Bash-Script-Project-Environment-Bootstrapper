#!/bin/bash
set -e

# Defining color codes 
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to Check for an existing Python Virtual environment
log_file="/home/obunm/data/logs/setup.log"
create_virtual_env() {
virtual_env="/home/obunm/linux_tasks/venv"
if [ -d $virtual_env ]; then
   echo -e "${BLUE}[info] Virtual environment $virtual_env exists.$NC "
   echo -e "${BLUE}$(date): Virtual environment exists.${NC}" >> $log_file
else
   echo -e "${YELLOW}[WARNING] Virtual environment $virtual_env does not exist, create virtual env.${NC}"
   echo -e "${YELLOW}$(date): Virtual environment does not exist.${NC}" >> $log_file
   
   python3 -m venv $virtual_env
   if [ $? -eq 0 ]; then
      echo -e "${GREEN}[SUCCESS] Virtual environment :$virtual_env created successfully.${NC}"
      echo -e "${GREEN}$(date): virtual environment created successfully.${NC}" >> $log_file
   else
      echo -e "${RED}[ERROR] Virtual environment creation failed.${NC}"
      echo -e "${RED}$(date): Virtual environment creation failed. ${NC}" >> $log_file
      exit 1
   fi

fi


# Activate the virtual env
echo "Activate the virtual environment"
source "$virtual_env/bin/activate"
if [ $virttual_env !=" " ]; then
   echo -e "${GREEN}[SUCCESS] Virtual environment activated successfully.${NC}"
   echo -e "${GREEN}$(date): Virtual environment activated successfully.${NC}" >> $log_file
else
   echo -e "${RED}[ERROR] activation failed.${NC}"
   echo -e "${RED}$(date): activation failed.${NC}" >> $log_file
fi
}


# function to upgrade pip
upgrade_pip() {
python3 -m pip install --upgrade pip
if [ $? -eq 0 ]; then
   echo -e "${GREEN}[SUCCESS] Pip installation upgrade is successful.${NC}" 
   echo -e "${GREEN}$(date): pip installation upgrade is successful.${NC}" >> $log_file

else 
   echo -e "${RED}[ERROR] Pip installation failed.${NC}"
   echo -e "${RED}$(date): pip installation failed.${NC}" >> $log_file
   exit 1
fi
}


# check if .gitignore exist and create one if missing
gitignore_check() {
git_ignore="/home/obunm/linux_tasks/venv/.gitignore"
if [ -f $git_ignore ]; then
   echo -e "${BLUE}[INFO] gitignore $git_ignore file exists. Skip creation.${NC}"
   echo -e "${BLUE}$(date): gitignore $git_ignore file exists.${NC}" >> $log_file 
else
   echo -e "${YELLOW}[WARNING] gitignore $git_ignore file does not exist. create gitignore.${NC}"
   touch $git_ignore
   chmod u+x $git_ignore
   cat  <<EOF > $git_ignore
   echo -e "${BLUE}$(date): gitignore $git_ignore file created.${NC}" >> $log_file
# Virtual environment
.venv/
venv/
# Visual Studio Code
.vscode/
EOF
fi
}


# Main function that calls the bootstrapper functions
main() {
create_virtual_env
upgrade_pip
gitignore_check

}
main

# install Python packages like Pandas and requests
pip install pandas
if [ $? -eq 0 ]; then
   echo -e "${GREEN}[SUCCESS] Pandas installation is successful.${NC}"
   echo -e "${GREEN}$(date): Pandas installed " >> $log_file
else 
   echo -e "${RED}[ERROR] Pandas installation failed.${NC}"
   echo -e "${RED}$(date): Panda installation failed.${NC}" >> $log_file
   exit 1
fi

# install Python package requests
pip install requests
if [ $? -eq 0 ]; then 
   echo -e "${GREEN}[SUCCESS] Requests installation is successful.${NC}"
   echo -e "${GREEN}$(date): requests installed.${NC}" >> $log_file
else
   echo -e "${RED}[ERROR] requests installation failed.${NC}"
   echo -e "${RED}$(date): requests installation failed.${NC}" >> $log_file
   exit 1
fi

echo "Setup is complete"
