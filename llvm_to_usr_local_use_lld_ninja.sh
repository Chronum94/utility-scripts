#!/bin/bash

cd ~/
mkdir -p LLVM
LLVMDIR=/home/$USER/LLVM
REV=328745
cd /home/$USER/LLVM

echo "Checkout LLVM..."
svn co -r$REV http://llvm.org/svn/llvm-project/llvm/trunk llvm
echo $LLVMDIR

cd $LLVMDIR
cd llvm/tools
echo "Checkout Clang..."
svn co -r$REV http://llvm.org/svn/llvm-project/cfe/trunk clang

cd $LLVMDIR
cd llvm/tools/clang/tools
echo "Checkout Clang Tools..."
svn co -r$REV http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra

cd $LLVMDIR
cd llvm/projects
echo "Checking out Compiler-RT..."
svn co -r$REV http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt

cd $LLVMDIR
cd llvm/tools
echo "Checkout LLD..."
svn co -r$REV http://llvm.org/svn/llvm-project/lld/trunk lld

cd $LLVMDIR
cd llvm/tools
echo "Checkout Polly Loop optimizer..."
svn co -r$REV http://llvm.org/svn/llvm-project/polly/trunk polly

cd $LLVMDIR
cd llvm/projects
echo "Checkout OpenMp support..."
svn co -r$REV http://llvm.org/svn/llvm-project/openmp/trunk openmp

cd $LLVMDIR
cd llvm/projects
echo "Checkout libcxx and libcxxabi..."
svn co -r$REV http://llvm.org/svn/llvm-project/libcxx/trunk libcxx
svn co -r$REV http://llvm.org/svn/llvm-project/libcxxabi/trunk libcxxabi

cd $LLVMDIR
mkdir -p build
cd build
cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_LLD=ON \
						-DLLVM_TARGETS_TO_BUILD="X86;AMDGPU" ../llvm/

ninja