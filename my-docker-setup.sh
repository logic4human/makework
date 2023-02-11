## This file is an instruction on the basic server configuration and to add Docker and Compose support
##
## below file is used as foundation for below instructions
## https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04


##
## Follow steps 1 - 2 on target server via command prompt or SSH to prepare for step 3
##



## 1.
## - update packages
## - Add admin user
## - add admin user to sudoers

sudo apt update
sudo adduser admin
usermod -aG sudo admin


## 2.
## Upload this script to your serveradmin
##
## - switch user to become admin
## - create folder serveradmin inside user admin home directory
## - copy this script to the serveradmin folder

su admin
mkdir /home/admin/serveradmin
scp my-docker-setup admin@host:/home/admin/serveradmin/.


sudo apt install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

apt-cache policy docker-ce

sudo apt install docker-ce

sudo systemctl status docker


# Executing Docker Command Without Sudo
sudo usermod -aG docker ${USER}
su - ${USER}

# check if user is part of docker group
groups

# add user to group docker, replace username with your username
sudo usermod -aG docker username


#install docker-compose
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04
#
#Take latest version from:
https://github.com/docker/compose/releases

mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.14.2/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose

chmod +x ~/.docker/cli-plugins/docker-compose

