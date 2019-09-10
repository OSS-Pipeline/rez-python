#!/usr/bin/bash

build_path=$1
python_version=$2

# We print the arguments passed to the Bash script
echo -e "\n==============="
echo -e "=== INSTALL ==="
echo -e "===============\n"

echo -e "BUILD PATH: ${build_path}"
echo -e "PYTHON VERSION: ${python_version}"

cd $build_path

# We finally install Python
echo -e "\nInstalling Python-${python_version}...\n"

make install

echo -e "\nFinished installing Python-${python_version}!\n"
