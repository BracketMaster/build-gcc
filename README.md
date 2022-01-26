# Build Gcc

To help with building the `powerpc64le-linux-gnu` gcc target
on MacOS on Apple Silicon.

Current, only able to build cc1 and c++1. For some reason or the
other, not able to build glibc.

# Building
Do the following:

```bash
$bash 1-download.sh
$bash 2-binutuils.sh
$bash 3-gcc.sh
```