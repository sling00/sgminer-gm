#!/bin/bash
## Sgminer-gm example build script customize for the branch you want to build.
echo "Note, you should sudo devtools-install before running this."
#git clone -b x16s https://github.com/WhiteSea/sgminer-gm.git sgminer-gm
git submodule init
git submodule update
./autogen.sh
CFLAGS="-Ofast -Wall -march=native -std=gnu99 -I/opt/driver-switching/fglrx/runtime-lib" LDFLAGS="-L/opt/driver-switching/fglrx/runtime-lib" ./configure
make
mkdir ../sgminer-gm-WhiteSea
strip sgminer
cp -R kernel sgminer COPYING ../sgminer-gm-WhiteSea
echo "Done, compiled sgminer is in ../sgminer-gm-WhiteSea"

