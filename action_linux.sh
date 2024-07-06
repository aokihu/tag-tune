# Prepare for linux platform
# @version 2.0.3

# checkout taglib
git submodule update --init --recursive

# Set cross-compiler prefix
CROSS_COMPILE_PREFIX=${CROSS_COMPILE_PREFIX:-}

# Set cross-compiler environment variables
export CC=${CROSS_COMPILE_PREFIX}gcc
export CXX=${CROSS_COMPILE_PREFIX}g++
export AR=${CROSS_COMPILE_PREFIX}ar
export AS=${CROSS_COMPILE_PREFIX}as
export LD=${CROSS_COMPILE_PREFIX}ld
export RANLIB=${CROSS_COMPILE_PREFIX}ranlib
export STRIP=${CROSS_COMPILE_PREFIX}strip

# compile taglib
cd taglib
pwd
cmake -DCMAKE_INSTALL_PREFIX=$(pwd)/build -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DBUILD_SHARED_LIBS=OFF \
    -DWITH_ZLIB=OFF \
    -DCMAKE_C_COMPILER=$CC \
    -DCMAKE_CXX_COMPILER=$CXX .
make -j4
make install

# compile tagtune
cd ..
pwd
make
