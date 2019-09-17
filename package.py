# Based and improved from https://github.com/piratecrew/rez-python

name = "python2"

version = "2.7.16"

authors = [
    "Guido van Rossum"
]

description = \
    """
    The Python 2 programming language.
    """

requires = [
    "cmake-3+",
    "gcc-6.3.1"
]

variants = [
    ["platform-linux"]
]

tools = [
    "2to3",
    "idle",
    "pip",
    "pip2",
    "pip2.7",
    "pydoc",
    "python",
    "python2",
    "python2.7",
    "python2.7-config",
    "python2-config",
    "python-config",
    "smtpd.py"
]

with scope("config") as config:
    config.build_thread_count = "logical_cores"

#TODO: Use the SHA1 of the archive instead.
uuid = "python2-2.7.16"

def commands():
    env.PATH.prepend("{root}/bin")
    env.LD_LIBRARY_PATH.prepend("{root}/lib")
