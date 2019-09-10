#!/usr/bin/bash

build_path=$1
python_version=$2

# We print the arguments passed to the Bash script
echo -e "\n============="
echo -e "=== BUILD ==="
echo -e "=============\n"

echo -e "BUILD PATH: ${build_path}"
echo -e "PYTHON VERSION: ${python_version}"

cd $build_path

# We build Python
echo -e "\nBuilding Python-${python_version}...\n"

make -j${REZ_BUILD_THREAD_COUNT}

echo -e "\nFinished building Python-${python_version}!\n"
