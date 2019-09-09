CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

include(RezBuild)
include(RezRepository)
include(ExternalProject)

set(python_version 2.7.16)

# Needed in order to link the libraries properly.
# set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
# set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# Python
rez_set_archive(
    url_python python/Python-${python_version}.tgz
    $ENV{REZ_REPO_PAYLOAD_DIR}/python/Python-${python_version}.tgz
)

ExternalProject_add(
    build_python
    URL ${url_python}
    PREFIX python
    CONFIGURE_COMMAND ./configure --prefix=${CMAKE_INSTALL_PREFIX} --enable-ipv6 --enable-unicode=ucs4 --with-ensurepip=install LDFLAGS=-Wl,-rpath,'$$ORIGIN/../lib/'
    BUILD_COMMAND make -j$ENV{REZ_BUILD_THREAD_COUNT} VERBOSE=1
    INSTALL_COMMAND make install VERBOSE=1
    BUILD_IN_SOURCE 1
    ALWAYS 1
)

install(
    CODE
    "execute_process(
        COMMAND echo \"\n=== PYTHON BUILD FINISHED! ===\n\"
    )"
)
