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

# install needed dependencies
brew install libmpc mpfr isl gawk

# download packages
cd ${WDIR}/${TARGET}-src
curl -L https://gmplib.org/download/gmp/gmp-6.2.1.tar.bz2 | tar xjf -
curl -L http://ftp.gnu.org/gnu/binutils/binutils-2.32.tar.gz | tar xzf -
curl -L https://github.com/iains/gcc-darwin-arm64/tarball/master --output gcc-11.1.0.tar
curl -L https://ftp.gnu.org/gnu/glibc/glibc-2.23.tar.gz | tar xzf -
mkdir -p gcc-11.1.0
tar xzf gcc-11.1.0.tar -C gcc-11.1.0 --strip-components 1

# a forced patch... basically
cd gcc-11.1.0/
sed -i .bak s/.*=host-darwin.o$// gcc/config.host
sed -i .bak "s/.* x-darwin.$//" gcc/config.host