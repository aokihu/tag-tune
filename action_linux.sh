# Prepare for linux platform

# checkout taglib
git submodule update --init --recursive

# compile taglib
cd taglib
pwd
cmake  -DCMAKE_INSTALL_PREFIX=$(pwd)/build -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DBUILD_SHARED_LIBS=OFF \
    -DWITH_ZLIB=OFF .
make -j4
make install

# compile tagtune
cd ..
pwd
make clean
make
