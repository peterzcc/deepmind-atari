#!/usr/bin/env bash

######################################################################
# Torch install
######################################################################


TOPDIR=$PWD

# Prefix:
PREFIX=$PWD/torch
echo "Installing Torch into: $PREFIX"

if [[ `uname` != 'Linux' ]]; then
  echo 'Platform unsupported, only available for Linux'
  exit
fi
#if [[ `which apt-get` == '' ]]; then
#    echo 'apt-get not found, platform not supported'
#    exit
#fi

# Install dependencies for Torch:


echo "==> Torch7's dependencies have been installed"





# Build and install Torch7
cd /tmp
rm -rf luajit-rocks
git clone https://github.com/torch/luajit-rocks.git
cd luajit-rocks
mkdir -p build
cd build
git checkout master; git pull
rm -f CMakeCache.txt
cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release
RET=$?; if [ $RET -ne 0 ]; then echo "Error. Exiting."; exit $RET; fi
make
RET=$?; if [ $RET -ne 0 ]; then echo "Error. Exiting."; exit $RET; fi
make install
RET=$?; if [ $RET -ne 0 ]; then echo "Error. Exiting."; exit $RET; fi


path_to_nvcc=$(which nvcc)

cutorch=ok
cunn=ok


# Install base packages:
$PREFIX/bin/luarocks install cwrap
$PREFIX/bin/luarocks install paths
$PREFIX/bin/luarocks install torch
$PREFIX/bin/luarocks install nn

[ -n "$cutorch" ] && \
($PREFIX/bin/luarocks install cutorch)
[ -n "$cunn" ] && \
($PREFIX/bin/luarocks install cunn)

$PREFIX/bin/luarocks install luafilesystem
$PREFIX/bin/luarocks install penlight
$PREFIX/bin/luarocks install sys
$PREFIX/bin/luarocks install xlua
$PREFIX/bin/luarocks install image
$PREFIX/bin/luarocks install env

echo ""
echo "=> Torch7 has been installed successfully"
echo ""


echo "Installing nngraph ... "
$PREFIX/bin/luarocks install nngraph
RET=$?; if [ $RET -ne 0 ]; then echo "Error. Exiting."; exit $RET; fi
echo "nngraph installation completed"

echo "Installing Xitari ... "
cd /tmp
rm -rf xitari
git clone https://github.com/deepmind/xitari.git
cd xitari
$PREFIX/bin/luarocks make
RET=$?; if [ $RET -ne 0 ]; then echo "Error. Exiting."; exit $RET; fi
echo "Xitari installation completed"

echo "Installing Alewrap ... "
cd /tmp
rm -rf alewrap
git clone https://github.com/deepmind/alewrap.git
cd alewrap
$PREFIX/bin/luarocks make
RET=$?; if [ $RET -ne 0 ]; then echo "Error. Exiting."; exit $RET; fi
echo "Alewrap installation completed"

echo
echo "You can run experiments by executing: "
echo
echo "   ./run_cpu game_name"
echo
echo "            or   "
echo
echo "   ./run_gpu game_name"
echo
echo "For this you need to provide the rom files of the respective games (game_name.bin) in the roms/ directory"
echo

