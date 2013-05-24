project(MATLAB_CMAKE)

cmake_minimum_required(VERSION 2.6)

SET (CMAKE_RUNTIME_OUTPUT_DIRECTORY
  ${PROJECT_BINARY_DIR}/bin CACHE INTERNAL 
  "Executable output directory")

SET(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR} ${CMAKE_SOURCE_DIR}/CMake)
INCLUDE(ProjectCMakeFunctions)

OPTION(BUILD_SHARED_LIBS "Build shared libs" ON)

if(APPLE)
  find_package(Matlab REQUIRED)
endif()

add_subdirectory(tests)

