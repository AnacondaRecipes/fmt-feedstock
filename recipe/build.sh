#!/bin/bash


# Isolate the build.
mkdir -p Build
cd Build || exit 1


# Generate the build files.
cmake .. -G"Ninja" ${CMAKE_ARGS} \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=TRUE \
      -DFMT_TEST=ON \
      -DFMT_DOC=OFF \
      -DFMT_INSTALL=ON \
      -DCMAKE_BUILD_TYPE=Release


# Build.
ninja || exit 1


# Perform tests.
ninja test || exit 1


# Install.
ninja install || exit 1
