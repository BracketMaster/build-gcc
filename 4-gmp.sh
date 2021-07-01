set -x
set -e

export WDIR=/tmp
export BUILD=aarch64-apple-darwin20
export TARGET=powerpc64le-linux-gnu
export PREFIX=/opt/cross/${TARGET}
export CC=gcc-11
export CXX=g++-11

# build gmp
mkdir -p ${WDIR}/${TARGET}-toolchain
cd ${WDIR}/${TARGET}-toolchain
mkdir -p build-gmp
cd build-gmp
${WDIR}/${TARGET}-src/gmp-6.2.1/configure \
    --prefix=/opt/gmp \
    --enable-cxx \
    --build=${BUILD}
make -j 8
sudo make install-strip