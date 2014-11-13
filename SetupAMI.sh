
sudo apt-get update
sudo apt-get install python3-pip

apt-get install liblapack-dev
apt-get install gfortran

pip3 install -U setuptools
pip3 install -U pip

export LAPACK=/usr
export ATLAS=/usr/lib/libatlas.so
export BLAS=/usr/lib/libblas.so
pip3 install numpy
pip3 install scipy
 
pip3 install ipython[all]
pip3 install cython
pip3 install greenlet
pip3 install scoop
pip3 install deap
