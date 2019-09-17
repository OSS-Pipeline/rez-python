#!/usr/bin/bash

build_path=$1
python_version=$2

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "============="
echo -e "=== BUILD ==="
echo -e "============="
echo -e "\n"

echo -e "[BUILD][ARGS] BUILD PATH: ${build_path}"
echo -e "[BUILD][ARGS] PYTHON VERSION: ${python_version}"

cd $build_path

# We build Python
echo -e "\n"
echo -e "[BUILD] Building Python-${python_version}..."
echo -e "\n"

make -j${REZ_BUILD_THREAD_COUNT}

echo -e "\n"
echo -e "[BUILD] Finished building Python-${python_version}!"
echo -e "\n"
