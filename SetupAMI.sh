
# OS related packages
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install curl vim
sudo apt-get install build-essential gfortran

# Install pip3 and update improtant packages
sudo apt-get install python-pip python-dev
sudo pip install -U setuptools
sudo pip install -U pip

# Install packages needed to compile numpy
sudo pip install cython
sudo pip install nose

cp setup-atlas.bash /usr/local/src/setup-atlas.bash
cd /usr/local/src
chmod +x setup-atlas.bash
./setup-atlas.bash
