#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

EXTRACT_PATH=$1
BUILD_PATH=$2
INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
PYTHON_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script.
echo -e "\n"
echo -e "================="
echo -e "=== CONFIGURE ==="
echo -e "================="
echo -e "\n"

echo -e "[CONFIGURE][ARGS] EXTRACT PATH: ${EXTRACT_PATH}"
echo -e "[CONFIGURE][ARGS] BUILD PATH: ${BUILD_PATH}"
echo -e "[CONFIGURE][ARGS] INSTALL PATH: ${INSTALL_PATH}"
echo -e "[CONFIGURE][ARGS] PYTHON VERSION: ${PYTHON_VERSION}"

# We run the configuration script of Python.
echo -e "\n"
echo -e "[CONFIGURE] Running the configuration script from Python-${PYTHON_VERSION}..."
echo -e "\n"

if [ -d ${BUILD_PATH} ]; then
    cd ${BUILD_PATH}
else
    mkdir -p ${BUILD_PATH}
    cd ${BUILD_PATH}

    ${EXTRACT_PATH}/configure --prefix=${INSTALL_PATH} --enable-ipv6 --enable-unicode=ucs4 --with-ensurepip=install CFLAGS=-fPIC CXXFLAGS=-fPIC
fi

echo -e "\n"
echo -e "[CONFIGURE] Finished configuring Python-${PYTHON_VERSION}!"
echo -e "\n"
