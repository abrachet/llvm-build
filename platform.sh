
# Currently I only develop on Linux, some assumtions are made about
# that environment like using ld.gold, which is only available with ELF
# object files.

if [ `uname` != 'Linux' ]; then
    echo "Error: unsurported platform" `uname`
    exit 1
fi

# These scripts expect to be in a build directory and expect to find
# CMakeLists.txt in ../llvm

if [ ! -d ../llvm/ ]; then
    echo "Error: running from wrong directory"
    exit 1
fi

