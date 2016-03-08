#!/bin/bash
#
# This script installs the following packages
# - HTCondor
# - MPI
# - Docker
# - Octave
# - R
#
export USER="hpuser"
export USERHOME="/home/${USER}"
sudo -i # All this script is run as root
apt-get update
#
#
echo "Installing ca-certificates"
apt-get install -y apt-transport-https ca-certificates
#
#
echo "Preparing for Docker installation"
apt-get install -y linux-image-extra-$(uname -r) build-essential
apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list'
apt-get update
#
#
echo "Installing Docker"
apt-get install -y docker-engine
#
#
echo "Installing openmpi"
apt-get install -y openmpi-bin openmpi-doc libopenmpi-dev
#
#
echo "Installing HTCondor"
(export DEBIAN_FRONTEND=noninteractive; apt-get install -y htcondor)
#
#
echo "Preparing for R installation"
sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 |  apt-key add -
apt-get update
#
#
echo "Installing R"
apt-get -y install r-base
#
#
echo "Preparing for Octave installation"
apt-add-repository ppa:octave/stable
apt-get update
#
#
echo "Installing Octave"
apt-get install -y octave
#
#
echo "Creating the '${USER}' user"
# http://askubuntu.com/questions/94060/run-adduser-non-interactively
useradd -m -p "paM.CJX3dGIs6" -s /bin/bash ${USER} # passwd 'hpuser'
usermod -aG sudo ${USER}
usermod -aG docker ${USER} # adding ${USER} to docker group
sudo -H -u hpuser bash -c "mkdir ${USERHOME}/.ssh; ssh-keygen -f ${USERHOME}/.ssh/id_rsa  -t rsa -N ''; cat ${USERHOME}/.ssh/id_rsa.pub >> ${USERHOME}/.ssh/authorized_keys"
