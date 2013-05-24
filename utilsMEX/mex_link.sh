#!/bin/bash - 
#===============================================================================
#
#          FILE:  mex_link.sh
# 
#         USAGE:  ./mex_link.sh 
# 
#   DESCRIPTION:  
# 
#        AUTHOR: Jian Cheng (), jian.cheng.1983@gmail.com
#       COMPANY: UNC-CH
#       CREATED: 05/21/2013 08:21:00 PM EDT
#===============================================================================

set -o nounset                              # Treat unset variables as an error


OUTPUT=$1
LIB_NAME=$OUTPUT
MOVE_LOCATION=$2
MEX_STUB=$3
LINKER_FLAGS=

echo 'Running godawful mex linking hack...'
# mex_stub.o compiled with:
echo "g++ -g -Wall -fPIC -pthread -DMX_COMPAT_32 -DMATLAB_MEX_FILE -c ${MEX_STUB} -o mex_stub.o"
g++ -g -Wall -fPIC -pthread -DMX_COMPAT_32 -DMATLAB_MEX_FILE -c ${MEX_STUB} -o mex_stub.o
echo "mex -g -cxx CC='gcc' CXX='g++' LD='gcc' -L./ -lpthread -lgthread-2.0 -lrt -lglib-2.0 -l$LIB_NAME $LINKER_FLAGS -output $OUTPUT mex_stub.o"
mex -g -cxx CC='gcc' CXX='g++' LD='gcc' -L./ -lpthread -lgthread-2.0 -lrt -lglib-2.0 -l$LIB_NAME $LINKER_FLAGS -output $OUTPUT mex_stub.o
pwd
echo "cp $OUTPUT.mex* lib$OUTPUT* $MOVE_LOCATION"
cp $OUTPUT.mex* lib$OUTPUT* $MOVE_LOCATION

