# make should see to system default
unset CPATH
unset LIBRARY_PATH
unset LD_LIBRARY_PATH

pwd=$(pwd)
target=$(cat target)

git clone https://github.com/microsoft/WSL2-Linux-Kernel.git --depth=1 --branch $target $target
cd $target
cp Microsoft/config-wsl .config

cat ../options >>.config
make olddefconfig

make clean
make -j$(nproc)

cp arch/x86/boot/bzImage $pwd/

echo -----------------
echo target version $(cat target)
echo '# enabled additional options'
cat options
echo -----------------
echo copied bzImage in current directory
echo update your %USERPROFILE%\.wslconfig like the following
echo -----------------
echo [wsl2]
echo kernel=G:\\Ubuntu\\bzImage
echo memory=32GB
echo -----------------
