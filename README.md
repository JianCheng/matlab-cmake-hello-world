A hello world project to demonstate Matlab mex file generation with CMake.  

The original code is from 
https://github.com/thewtex/matlab-cmake-hello-world.git

For more information, see
http://www.cmake.org/Wiki/CMake:MatlabMex

This code shows two ways to generate mex file using CMake. 

 
The first one using mex_link.sh
-------------------------------

please note:

* the instruction in http://www.cmake.org/Wiki/CMake:MatlabMex needs to rebuild cmake using a specific patch such that mex can be used to build all codes. Here we use c++ and cc, not mex, to build the cpp/c codes. No patch is needed. 
* The library should be built as **shared** libs \*.so. 
* Current codes work in linux. It is not tested in windows. 

In mac, the error information shows

    Running godawful mex linking hack...
    g++ -g -Wall -fPIC -pthread -DMX_COMPAT_32 -DMATLAB_MEX_FILE -c /Users/jcheng/mywork/mycode/matlab-cmake/utilsMEX/mex_stub.cpp -o mex_stub.o
    mex -g -cxx CC='gcc' CXX='g++' LD='gcc' -L./ -lpthread -lgthread-2.0 -lrt -lglib-2.0 -lhellocpp  -output hellocpp mex_stub.o
    ld: library not found for -lbundle1.o
    collect2: ld returned 1 exit status 


The second one using cmake macro
--------------------------------

The cmake macro is from 
http://hdl.handle.net/10380/3060 

This way is more elegant compared to the first way. 
