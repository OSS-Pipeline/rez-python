#!/usr/bin/bash

build_path=$1
python2_version=$2

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "============="
echo -e "=== BUILD ==="
echo -e "============="
echo -e "\n"

echo -e "[BUILD][ARGS] BUILD PATH: ${build_path}"
echo -e "[BUILD][ARGS] PYTHON2 VERSION: ${python2_version}"

cd $build_path

# We build Python2
echo -e "\n"
echo -e "[BUILD] Building Python2-${python2_version}..."
echo -e "\n"

make -j${REZ_BUILD_THREAD_COUNT}

echo -e "\n"
echo -e "[BUILD] Finished building Python2-${python2_version}!"
echo -e "\n"
