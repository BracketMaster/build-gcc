set -x
set -e

export WDIR=/tmp
export BUILD=aarch64-apple-darwin20
export TARGET=powerpc64le-linux-gnu
export PREFIX=/opt/cross/${TARGET}
export CC=gcc-11
export CXX=g++-11
 
# build mpfr
cd ${WDIR}/${TARGET}-toolchain
mkdir -p build-mpfr
cd build-mpfr
${WDIR}/${TARGET}-src/mpfr-3.1.4/configure \
    --prefix=/opt/mpfr \
    --with-gmp=/opt/gmp
make -j 8
sudo make install-strip