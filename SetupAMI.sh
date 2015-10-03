
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

wget https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tgz
tar zxvf Python-2.7.8.tgz
cd Python-2.7.8
./configure --prefix=/share/apps/python --with-readline=gnu
make -j30
make install
cd ..

wget http://www.netlib.org/lapack/lapack-3.5.0.tgz
tar zxvf lapack-3.5.0.tgz
cd lapack-3.5.0
cp INSTALL/make.inc.gfortran make.inc

**** NEED TO EDIT MAKE.INc

OPTS = -O2 -fPIC
NOOPT = -O0 -fPIC

make -j20
make blaslib lapacklib tmglib lapack_testing
cd ..



wget http://sourceforge.net/projects/math-atlas/files/Stable/3.10.2/atlas3.10.2.tar.bz2
tar -jxvf atlas3.10.2.tar.bz2
cd ATLAS
mkdir ATLAS_LINUX
cd ATLAS_LINUX
../configure -Fa alg -fPIC --prefix=/share/apps/python --with-netlib-lapack-tarfile=/home/ubuntu/lapack-3.5.0.tgz
make
cd lib
make shared
make ptshared
cd ..
make install
cd ../..