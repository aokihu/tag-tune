# Prepare for linux platform

# checkout taglib
git submodule update --init --recursive

# compile taglib
cd taglib
cmake -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DBUILD_SHARED_LIBS=OFF \
    -DWITH_ZLIB=OFF .
#    -DCMAKE_OSX_DEPLOYMENT_TARGET=12.0 \
make

# compile tagtune
cd ..
make
