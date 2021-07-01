set -x
set -e

export WDIR=/tmp
export BUILD=aarch64-apple-darwin20
export TARGET=powerpc64le-linux-gnu
export PREFIX=/opt/cross/${TARGET}
export CC=gcc-11
export CXX=g++-11
 
# build mpc
cd ${WDIR}/${TARGET}-toolchain
mkdir -p build-mpc
cd build-mpc
${WDIR}/${TARGET}-src/mpc-1.0.3/configure \
    --prefix=/opt/mpc \
    --with-gmp=/opt/gmp \
    --with-mpfr=/opt/mpfr
make -j 8
sudo make install-strip