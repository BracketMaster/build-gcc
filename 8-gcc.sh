set -x
set -e

export WDIR=/tmp
export BUILD=aarch64-apple-darwin20
export TARGET=powerpc64le-linux-gnu
export PREFIX=/opt/cross/${TARGET}
export CC=gcc-11
export CXX=g++-11
 
# fetch gcc

# build gcc
cd ${WDIR}/${TARGET}-toolchain
mkdir -p build-gcc
cd build-gcc
${WDIR}/${TARGET}-src/gcc-11.1.0/configure \
    --enable-languages=c \
    --disable-nls \
    --prefix=${PREFIX} \
    --with-gmp=/opt/gmp \
    --with-mpfr=/opt/mpfr \
    --with-mpc=/opt/mpc \
    --with-isl=/opt/isl \
    --target=${TARGET} \
    --with-float=soft \

 make all-gcc -j8
 sudo make install-strip-gcc
