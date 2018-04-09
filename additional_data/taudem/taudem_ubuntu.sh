#!/bin/bash
# compilacao do TauDEM no Debian_7x64
# GPL2 yjmenezes cartognu.org 2015-03-28 ver 1.0
mkdir -p /tmp/tau
#http://docs.qgis.org/2.0/en/docs/user_manual/processing/3rdParty.html
cd /tmp/tau
# prerequisitos
# sudo apt-get update
# sudo apt-get install mpich2 cmake
# baixando os fontes do site original
wget -c http://hydrology.usu.edu/taudem/taudem5/TauDEM5PCsrc_506.zip
unzip $(ls T*zip)
cd src
# corrige e aplica patch recomendado por alex_bruy; thx alex ;-)
# http://docs.qgis.org/2.0/en/docs/user_manual/processing/3rdParty.html
cp linearpart.h  linearpart.h_original
cat linearpart.h_original | sed s/\"mpi.h\"/\"mpi.h\"\\n#include\ \<stdint.h\>/ > linearpart.h
head -n 50 linearpart.h 1>&2
sleep 2
#
cp tiffIO.h tiffIO.h_original
cat tiffIO.h_original | sed s/\"stdint.h\"/\<stdint.h\>/ > tiffIO.h
head -n 50 tiffIO.h 1>&2
sleep 2
# prepara a compilacao
mkdir build
cd build
CXX=mpicxx cmake -DCMAKE_INSTALL_PREFIX=/usr/local ..
# compilando
make 2>/tmp/erro_taudem.txt
make install
# confirmando a instalacao
whereis pitremove 1>&2
exit 0

jmenezes@gpl-11:/tmp/tau$ mpicxx --version
c++ (Debian 4.7.2-5) 4.7.2
Copyright (C) 2012 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

jmenezes@gpl-11:/tmp/tau$ c++ --version
c++ (Debian 4.7.2-5) 4.7.2
Copyright (C) 2012 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


