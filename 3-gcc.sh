set -x
set -e

export WDIR=/tmp
export BUILD=aarch64-apple-darwin20
export TARGET=powerpc64le-linux-gnu
export PREFIX=/opt/cross/${TARGET}
export PATH=$PATH:$PREFIX/bin
export CC=gcc-11
export CXX=g++-11

GMP=$(brew --prefix gmp)
MPFR=$(brew --prefix mpfr)
MPC=$(brew --prefix libmpc)
ISL=$(brew --prefix isl)
 
# build gcc
cd ${WDIR}/${TARGET}-toolchain
mkdir -p build-gcc
cd build-gcc
${WDIR}/${TARGET}-src/gcc-11.1.0/configure \
    --prefix=${PREFIX} \
    --target=powerpc64le-linux-gnu \
    --build=aarch64-apple-darwin20 \
    --enable-languages=c,c++,lto \
    --with-gmp=$GMP \
    --with-mpfr=$MPFR \
    --with-mpc=$MPC \
    --with-isl=$ISL \
    # --with-gnu-as \
    # --with-gnu-ld \

make all-gcc -j8
sudo make install-strip-gcc
