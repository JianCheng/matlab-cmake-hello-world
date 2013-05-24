A hello world project to demonstate Matlab mex file generation with CMake.  

The original code is from 
https://github.com/thewtex/matlab-cmake-hello-world.git

For more information, see
http://www.cmake.org/Wiki/CMake:MatlabMex

Please note:

* the instruction in http://www.cmake.org/Wiki/CMake:MatlabMex needs to rebuild cmake using a specific patch such that mex can be used to build all codes. Here we use c++ and cc, not mex, to build the cpp/c codes. No patch is needed. 
* The library should be built as **shared** libs \*.so. 

