set -x
set -e

export WDIR=/tmp
export BUILD=aarch64-apple-darwin20
export TARGET=powerpc64le-linux-gnu
export PREFIX=/opt/cross/${TARGET}
export CC=gcc-11
export CXX=g++-11

# binutils
cd ${WDIR}/${TARGET}-toolchain
mkdir -p build-binutils
cd build-binutils
${WDIR}/${TARGET}-src/binutils-2.32/configure \
    --disable-nls \
    --prefix=${PREFIX} \
    --target=${TARGET}
make -j 8
sudo make install-strip
echo "export PATH=${PREFIX}/bin/:\$PATH" >> $HOME/.bash_profile