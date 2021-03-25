#!/bin/bash

sudo apt-get update # ! for installing software - updates linux machine to recognise any new software added to the central repo for ubuntu software

# Docker installed
#get any updates
# sudo apt-get update
# sudo apt install curl -y

#install docker
curl https://get.docker.com | sudo bash
#add user to docker user group - sorts permissions
sudo usermod -aG docker jenkins
#restart terminal
# newgrp docker

# Docker Compose Installed
# make sure jq & curl is installed
sudo apt-get install -y curl jq
# set which version to download (latest)
version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
# download to /usr/local/bin/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# make the file executable
sudo chmod +x /usr/local/bin/docker-compose

echo $DOCKER_PASSWORD | docker login --username jp22237 --password-stdin