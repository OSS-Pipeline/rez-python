#!/usr/bin/bash

build_path=$1
python_version=$2

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] BUILD PATH: ${build_path}"
echo -e "[INSTALL][ARGS] PYTHON VERSION: ${python_version}"

cd $build_path

# We finally install Python
echo -e "\n"
echo -e "[INSTALL] Installing Python-${python_version}..."
echo -e "\n"

make install

echo -e "\n"
echo -e "[INSTALL] Finished installing Python-${python_version}!"
echo -e "\n"
