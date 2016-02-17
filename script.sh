#!/bin/bash
#
# This script installs the following packages
# - HTCondor
# - MPI
# - Docker
# - Octave
# - R
#
sudo apt-get update
echo "Installing ca-certificates"
apt-get install -y apt-transport-https ca-certificates
echo "Preparing for Docker installation"
sudo apt-get install -y linux-image-extra-$(uname -r) build-essential
sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list'
sudo apt-get update
echo "Installing Docker"
sudo apt-get install -y docker-engine
echo "Installing openmpi"
sudo apt-get install -y openmpi-bin openmpi-doc libopenmpi-dev
sudo export DEBIAN_FRONTEND=noninteractive ; apt-get install -y opencpu
sudo apt-get install -y htcondor 
echo "Preparing for R installation"
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
sudo gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
sudo gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
echo "Installing R"
sudo apt-get -y install r-base
echo "Preparing for Octave installation"
sudo apt-add-repository ppa:octave/stable
sudo apt-get update
echo "Installing Octave"
sudo apt-get install -y octave
echo "Creating the 'hpuser' user"
# http://askubuntu.com/questions/94060/run-adduser-non-interactively
sudo useradd -m -p "paM.CJX3dGIs6" -s /bin/bash hpuser # passwd 'hpuser'
sudo usermod -aG sudo hpuser
