:

#sudo ln -s ~/dev/merlin-wrt/am-toolchains/brcm-arm-sdk/hndtools-arm-linux-2.6.36-uclibc-4.5.3 /opt/brcm-arm
# FIX automake error 1.11
#sudo mkdir -p /projects/hnd/tools/linux
#sudo ln -s ~/dev/merlin-wrt/am-toolchains/am-toolchains/brcm-arm-sdk/hndtools-arm-linux-2.6.36-uclibc-4.5.3 /projects/hnd/tools/linux
# FIX automake error 1.15
#sudo mkdir -p /home/defjovi/temp3/toolchain
#sudo ln -s ~/dev/merlin-wrt/am-toolchains/brcm-arm-hnd/crosstools-arm-gcc-9.2-linux-4.19-glibc-2.30-binutils-2.32 /home/defjovi/temp3/toolchain

if [ ! -d merlin-build ] ; then
  echo "Create merlin-build directory"
  mkdir merlin-build
fi

echo "Rsync Sources"
rsync -a --del asuswrt-merlin.ng/ merlin-build

if [ ! -e release ] ; then
  echo "Link Release Directory"
  ln -s merlin-build/release/src-rt-6.x.4708 release
fi

if [ ! -e merlin-build/release/src-rt-6.x.4708/toolchains ] ; then
  echo "Link toolchain brcm-arm-sdk"
  ln -s am-toolchains/brcm-arm-sdk merlin-build/release/src-rt-6.x.4708/toolchains
fi

#if [ ! -d elfy_build_bin ] ; then
#  mkdir elfy_build_bin
#  cp am-toolchains/brcm-arm-hnd/crosstools-arm-gcc-9.2-linux-4.19-glibc-2.30-binutils-2.32/bin/automake-1.15 elfy_build_bin
#fi

#set PATH="$PWD/elfy_build_bin:$PATH:$PWD/am-toolchains/brcm-arm-sdk/hndtools-arm-linux-2.6.36-uclibc-4.5.3/bin"
#set PATH="$PWD/elfy_build_bin:$PATH:$PWD/am-toolchains/brcm-arm-sdk/hndtools-arm-linux-2.6.36-uclibc-4.5.3/bin"
#export PATH

cd release
echo "Lets Build!"
make rt-ac68u
