#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

BUILD_PATH=$1
PYTHON_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "============="
echo -e "=== BUILD ==="
echo -e "============="
echo -e "\n"

echo -e "[BUILD][ARGS] BUILD PATH: ${BUILD_PATH}"
echo -e "[BUILD][ARGS] PYTHON VERSION: ${PYTHON_VERSION}"

cd ${BUILD_PATH}

# We build Python
echo -e "\n"
echo -e "[BUILD] Building Python-${PYTHON_VERSION}..."
echo -e "\n"

make -j${REZ_BUILD_THREAD_COUNT}

echo -e "\n"
echo -e "[BUILD] Finished building Python-${PYTHON_VERSION}!"
echo -e "\n"
