# Based and improved from https://github.com/piratecrew/rez-python

name = "python"

version = "3.10.13"

description = """
    The Python programming language.
    """

authors = [
    "Guido van Rossum",
]

requires = [
    "cmake-3",
    "gcc-4.8+",
]

variants = [
    [
        "platform-linux",
    ],
]

tools = [
    "2to3",
    "idle",
    "pip3",
    "pydoc3",
    "python3",
    "python3-config",
]

build_system = "cmake"


with scope("config") as config:
    config.build_thread_count = "logical_cores"


def commands():
    env.PATH.prepend("{root}/bin")
    env.LD_LIBRARY_PATH.prepend("{root}/lib")
    env.PKG_CONFIG_PATH.prepend("{root}/lib/pkgconfig")

    # Helper environment variables.
    env.PYTHON_BINARY_PATH.set("{root}/bin")
    env.PYTHON_INCLUDE_PATH.set("{root}/include")
    env.PYTHON_LIBRARY_PATH.set("{root}/lib")
