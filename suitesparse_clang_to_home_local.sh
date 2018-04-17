
PREFIX=/home/$USER/.local
cd ~/
cd SuiteSparse/
make CXX=clang++ CC=clang INSTALL=$PREFIX INSTALL_LIB=$PREFIX/lib \
                          INSTALL_INCLUDE=$PREFIX/include install
