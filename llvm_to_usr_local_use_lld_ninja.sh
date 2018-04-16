#!/bin/bash

cd ~/
mkdir -p LLVM
LLVMDIR=/home/$USER/LLVM
cd /home/$USER/LLVM

echo "Checkout LLVM..."
svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm
echo $LLVMDIR

cd $LLVMDIR
cd llvm/tools
echo "Checkout Clang..."
svn co http://llvm.org/svn/llvm-project/cfe/trunk clang

cd $LLVMDIR
cd llvm/tools/clang/tools
echo "Checkout Clang Tools..."
svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra

cd $LLVMDIR
cd llvm/tools
echo "Checkout LLD..."
svn co http://llvm.org/svn/llvm-project/lld/trunk lld

cd $LLVMDIR
cd llvm/tools
echo "Checkout Polly Loop optimizer..."
svn co http://llvm.org/svn/llvm-project/polly/trunk polly

cd $LLVMDIR
cd llvm/projects
ech "Checkout OpenMp support..."
svn co http://llvm.org/svn/llvm-project/openmp/trunk openmp

cd $LLVMDIR
cd llvm/projects
echo "Checkout libcxx and libcxxabi..."
svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx
svn co http://llvm.org/svn/llvm-project/libcxxabi/trunk libcxxabi

cd $LLVMDIR
mkdir -p build
cd build
cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_LLD=ON ../llvm/

ninja
