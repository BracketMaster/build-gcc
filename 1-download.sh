set -x
set -e

export WDIR=/tmp
export BUILD=aarch64-apple-darwin20
export TARGET=powerpc64le-linux-gnu
export PREFIX=/opt/cross/${TARGET}
export CC=gcc-11
export CXX=g++-11

# create needed directories
mkdir -p ${WDIR}/${TARGET}-src
mkdir -p ${WDIR}/${TARGET}-toolchain

# download packages
cd ${WDIR}/${TARGET}-src
curl -L https://gmplib.org/download/gmp/gmp-6.2.1.tar.bz2 | tar xjf -
curl -L ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-3.1.4.tar.bz2 | tar xjf -
curl -L ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-1.0.3.tar.gz | tar xzf -
curl -L ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.18.tar.bz2 | tar xjf -
curl -L https://ftp.gnu.org/gnu/sed/sed-4.7.tar.xz | tar xJf -
curl -L http://ftp.gnu.org/gnu/binutils/binutils-2.32.tar.gz | tar xzf -
curl -L https://github.com/iains/gcc-darwin-arm64/tarball/master --output gcc-11.1.0.tar
mkdir -p gcc-11.1.0
tar xzf gcc-11.1.0.tar -C gcc-11.1.0 --strip-components 1