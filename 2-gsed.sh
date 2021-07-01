set -x
set -e

export WDIR=/tmp
export BUILD=aarch64-apple-darwin20
export TARGET=powerpc64le-linux-gnu
export PREFIX=/opt/cross/${TARGET}
export CC=gcc-11
export CXX=g++-11

# gsed
cd ${WDIR}/${TARGET}-toolchain
mkdir -p build-sed
cd build-sed
${WDIR}/${TARGET}-src/sed-4.7/configure \
    --prefix=/opt/sed
make -j 8
sudo make install-strip
export PATH=/opt/sed/bin:${PATH}