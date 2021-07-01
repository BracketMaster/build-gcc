set -x
set -e

export WDIR=/tmp
export BUILD=aarch64-apple-darwin20
export TARGET=powerpc64le-linux-gnu
export PREFIX=/opt/cross/${TARGET}
export CC=gcc-11
export CXX=g++-11
 
# build glibc
cd ${WDIR}/${TARGET}-src
curl -L https://ftp.gnu.org/gnu/glibc/glibc-2.23.tar.gz | tar xzf -

cd ${WDIR}/${TARGET}-toolchain
mkdir -p build-glibc
cd build-glibc
CROSS_COMPILE=${PREFIX}/bin/${TARGET}- \
${WDIR}/${TARGET}-src/glibc-2.23/configure \
   --prefix=${PREFIX}/${TARGET} \
   --build=${TARGET} \
   --with-binutils=/opt/cross/powerpc64-linux-gnu/bin/ \
   --disable-shared # remove to enable shared libs
make -j8
sudo make install
