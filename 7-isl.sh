set -x
set -e

export WDIR=/tmp
export BUILD=aarch64-apple-darwin20
export TARGET=powerpc64le-linux-gnu
export PREFIX=/opt/cross/${TARGET}
export CC=gcc-11
export CXX=g++-11
 
# build isl
cd ${WDIR}/${TARGET}-toolchain
mkdir -p build-isl
cd build-isl
${WDIR}/${TARGET}-src/isl-0.18/configure \
    --prefix=/opt/isl \
    --with-gmp-prefix=/opt/gmp
make -j 8
sudo make install-strip