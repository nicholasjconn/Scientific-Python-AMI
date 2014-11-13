
sudo apt-get update
sudo apt-get install python3-pip

sudo apt-get install liblapack-dev
sudo apt-get install gfortran

sudo pip3 install -U setuptools
sudo pip3 install -U pip

export LAPACK=/usr
export ATLAS=/usr/lib/libatlas.so
export BLAS=/usr/lib/libblas.so
sudo pip3 install numpy
sudo pip3 install scipy
 
sudo pip3 install ipython[all]
sudo pip3 install cython
sudo pip3 install greenlet
sudo pip3 install scoop
sudo pip3 install deap
