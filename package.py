# Based and improved from https://github.com/piratecrew/rez-python

name = "python"

version = "3.7.4"

authors = [
    "Guido van Rossum"
]

description = \
    """
    The Python programming language.
    """

requires = [
    "cmake-3",
    "gcc-6"
]

variants = [
    ["platform-linux"]
]

tools = [
    "2to3",
    "2to3-3.7",
    "idle3",
    "idle3.7",
    "pip3",
    "pip3.7",
    "pydoc3",
    "pydoc3.7",
    "python3",
    "python3.7",
    "python3.7-config",
    "python3.7m",
    "python3.7m-config",
    "python3-config",
    "pyenv",
    "pyenv-3.7"
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

#TODO: Use the SHA1 of the archive instead.
uuid = "python-3.7.4"

def commands():
    env.PATH.prepend("{root}/bin")
    env.LD_LIBRARY_PATH.prepend("{root}/lib")
