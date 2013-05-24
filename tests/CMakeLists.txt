# add_library(hello SHARED hello.c)
# add_library(hellocpp SHARED hellocpp.cpp)

# add_library(hello hello.c)
# ADD_CUSTOM_COMMAND(TARGET hello 
#     POST_BUILD
#     COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/binMatlab
#     COMMAND mex_link.sh  hello ${PROJECT_BINARY_DIR}/binMatlab ${PROJECT_SOURCE_DIR}/mex_stub.cpp
#     )

add_matlab_c_executable(hello hello.c)
add_matlab_cpp_executable(hellocpp hellocpp.cpp)
add_matlab_cpp_executable(hellocpp2 hellocpp2.cpp)
