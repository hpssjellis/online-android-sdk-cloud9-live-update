

#!/bin/bash  

# Find or copy this file to your cloud9 Android-SDK workspace
# run it with the command
# bash live-update-WARNING.sh

#graps the live update repository from github and merges new files with your workspace.



sudo git clone https://github.com/hpssjellis/online-android-sdk-cloud9-live-update.git /home/temp

rsync -avh --progress /home/temp/ubuntu /home

sudo rm -rf /home/temp
