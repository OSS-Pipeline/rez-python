CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

include(RezBuild)
include(RezRepository)
include(ExternalProject)

set(python2_version 2.7.16)

# Python2
rez_set_archive(
    python2_url python2/Python-${python2_version}.tgz
    https://www.python.org/ftp/python/2.7.16/Python-2.7.16.tgz
)

# The environment variable REZ_TMP_PATH is meant to point to a location such as "/tmp/rez".
set(EXTRACT_DIR $ENV{REZ_TMP_PATH}/python2/${python2_version})
set(BUILD_DIR ${EXTRACT_DIR}/build)

# We configure/build/install Python2 through the ExternalProject_Add macro,
# using three different shell scripts for each of these steps.
# If necessary, it is possible to skip one of these steps by replacing the command
# by "", an empty string.
ExternalProject_Add(
    build_python2
    URL ${python2_url}
    PREFIX python2
    SOURCE_DIR ${EXTRACT_DIR}
    CONFIGURE_COMMAND bash ${CMAKE_SOURCE_DIR}/configure.sh ${EXTRACT_DIR} ${CMAKE_INSTALL_PREFIX} ${python2_version}
    BUILD_COMMAND bash ${CMAKE_SOURCE_DIR}/build.sh ${BUILD_DIR} ${python2_version}
    INSTALL_COMMAND bash ${CMAKE_SOURCE_DIR}/install.sh ${BUILD_DIR} ${python2_version}
)

# We use a bogus CMake "install" step in order to be able to properly finish
# and get out of the CMake script.
install(
    CODE
    "execute_process(
        COMMAND echo \"\n[CMAKE] Python2-${python2_version} PACKAGE SETUP FINISHED!\n\"
    )"
)