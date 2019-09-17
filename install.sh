#!/usr/bin/bash

build_path=$1
python2_version=$2

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] BUILD PATH: ${build_path}"
echo -e "[INSTALL][ARGS] PYTHON2 VERSION: ${python2_version}"

cd $build_path

# We finally install Python2
echo -e "\n"
echo -e "[INSTALL] Installing Python2-${python2_version}..."
echo -e "\n"

make -j${REZ_BUILD_THREAD_COUNT} install

echo -e "\n"
echo -e "[INSTALL] Finished installing Python2-${python2_version}!"
echo -e "\n"
