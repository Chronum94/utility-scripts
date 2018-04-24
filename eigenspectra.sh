echo "Moving to home directory...\n"
cd /$HOME

mkdir EigenSpectra
cd EigenSpectra
echo "Cloning Eigen"
git clone https://github.com/eigenteam/eigen-git-mirror.git EigenSrc
echo "Cloning Spectra"
git clone https://github.com/yixuan/spectra.git SpectraSrccmake

cd EigenSrc
mkdir builddir && cd builddir
cmake .. -DCHOLMOD_INCLUDES=~/.local/include \
		-DCHOLMOD_LIBRARIES=~/.local/lib/libcholmod.so \
		-DUMFPACK_INCLUDES=~/.local/include \
		-DUMFPACK_LIBRARIES=~/.local/lib/libumfpack.so \
		-DCXX=clang++ -DKLU_INCLUDES=~/.local/include \
		-DKLU_LIBRARIES=~/.local/lib/libklu.so \
		-DSPQR_INCLUDES=~/.local/include \
		-DSPQR_LIBRARIES=~/.local/lib/libspqr.so \
		-DCMAKE_INSTALL_PREFIX=~/EigenSpectra/Eigen \
		-DCMAKE_INCLUDE_INSTALL_DIR=~/.local/include/eigen3

make install