#!/usr/bin/bash

extract_path=$1
install_path=$2
python_version=$3

# We print the arguments passed to the Bash script
echo -e "\n=================="
echo -e "=== BUILD ARGS ==="
echo -e "==================\n"

echo -e "EXTRACT PATH: ${extract_path}"
echo -e "INSTALL PATH: ${install_path}"
echo -e "PYTHON VERSION: ${python_version}"

cd ${extract_path}

echo -e "\n====================="
echo -e "=== CONFIGURATION ==="
echo -e "=====================\n"

# We run the configuration script of Python
echo -e "Running the configuration script from Python-${python_version}...\n"

if [ -d build ]; then
    cd build
else
    mkdir build
    cd build

    ../configure --prefix=${install_path} --enable-ipv6 --enable-unicode=ucs4 --with-ensurepip=install LDFLAGS=-Wl,-rpath,'$$ORIGIN/../lib/'
fi

echo -e "\nFinished configuring Python-${python_version}!\n"
