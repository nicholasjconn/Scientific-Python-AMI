
# OS related packages
sudo apt-get update
sudo apt-get install curl vim
sudo apt-get install liblapack-dev
sudo apt-get install build-essential gfortran

# Install pip3 and update improtant packages
sudo apt-get install python3-pip python3-dev
sudo pip3 install -U setuptools
sudo pip3 install -U pip

# Install packages needed to compile numpy
sudo pip install cython
sudo pip install nose

# OpenBLAS
git clone git://github.com/xianyi/OpenBLAS
pushd OpenBLAS
make FC=gfortran
sudo make PREFIX=/usr/local/ install
popd
rm -rf OpenBLAS
 
# Numpy
sudo pip uninstall numpy
git clone https://github.com/numpy/numpy
pushd numpy
cat > site.cfg << EOL
[default]
library_dirs = /usr/local/lib

[atlas]
atlas_libs = openblas
library_dirs = /usr/local/lib

[lapack]
lapack_libs = openblas
library_dirs = /usr/local/lib

EOL
export BLAS=/usr/local/lib/libopenblas.a
export LAPACK=/usr/local/lib/libopenblas.a
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
echo 'export BLAS=/usr/local/lib/libopenblas.a' >>~/.bash_profile
echo 'LAPACK=/usr/local/lib/libopenblas.a' >>~/.bash_profile
echo 'LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/' >>~/.bash_profile
python3 setup.py build
# verify existence of build/lib.*/numpy/core/_dotblas.so
# run test_numpy.py
sudo python3 setup.py install
popd
rm -rf numpy

# Scipy
git clone https://github.com/scipy/scipy
pushd scipy
python3 setup.py build
sudo BLAS=/usr/local/lib/libopenblas.a LAPACK=/usr/local/lib/libopenblas.a LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/ python3 setup.py install
# run test_scipy.py
popd
rm -rf scipy

# Install other important Python packages 
sudo pip3 install ipython[all]
sudo pip3 install cython
sudo pip3 install greenlet
sudo pip3 install scoop
sudo pip3 install deap
