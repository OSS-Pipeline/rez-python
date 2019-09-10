CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

include(RezBuild)
include(RezRepository)
include(ExternalProject)

set(python_version 2.7.16)

# Python
rez_set_archive(
    python_url python/Python-${python_version}.tgz
    https://www.python.org/ftp/python/2.7.16/Python-2.7.16.tgz
)

# The environment variable REZ_TMP_PATH is meant to point to a location such as "/tmp/rez".
set(EXTRACT_DIR $ENV{REZ_TMP_PATH}/python/${python_version})
set(BUILD_DIR ${EXTRACT_DIR}/build)

# We configure/build/install Python through the ExternalProject_Add macro,
# using three different shell scripts for each of these steps.
ExternalProject_Add(
    build_python
    URL ${python_url}
    PREFIX python
    SOURCE_DIR ${EXTRACT_DIR}
    CONFIGURE_COMMAND bash ${CMAKE_SOURCE_DIR}/configure.sh ${EXTRACT_DIR} ${CMAKE_INSTALL_PREFIX} ${python_version}
    BUILD_COMMAND bash ${CMAKE_SOURCE_DIR}/build.sh ${BUILD_DIR} ${python_version}
    INSTALL_COMMAND bash ${CMAKE_SOURCE_DIR}/install.sh ${BUILD_DIR} ${python_version}
)

# We use a bogus CMake "install" step in order to be able to properly finish
# and get out of the CMake script.
install(
    CODE
    "execute_process(
        COMMAND echo \"\n[CMAKE] Python-${python_version} PACKAGE SETUP FINISHED!\n\"
    )"
)