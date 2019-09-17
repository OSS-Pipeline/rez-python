#!/usr/bin/bash

extract_path=$1
install_path=$2
python2_version=$3

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "================="
echo -e "=== CONFIGURE ==="
echo -e "================="
echo -e "\n"

echo -e "[CONFIGURE][ARGS] EXTRACT PATH: ${extract_path}"
echo -e "[CONFIGURE][ARGS] INSTALL PATH: ${install_path}"
echo -e "[CONFIGURE][ARGS] PYTHON2 VERSION: ${python2_version}"

cd ${extract_path}

# We run the configuration script of Python2
echo -e "\n"
echo -e "[CONFIGURE] Running the configuration script from Python2-${python2_version}..."
echo -e "\n"

if [ -d build ]; then
    cd build
else
    mkdir build
    cd build

    ../configure --prefix=${install_path} --enable-ipv6 --enable-unicode=ucs4 --with-ensurepip=install LDFLAGS=-Wl,-rpath,'$$ORIGIN/../lib/'
fi

echo -e "\n"
echo -e "[CONFIGURE] Finished configuring Python2-${python2_version}!"
echo -e "\n"
