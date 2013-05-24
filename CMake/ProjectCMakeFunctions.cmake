
FUNCTION(add_matlab_cpp_executable appName mainFile)

  # set(MATLAB_FUNCTION_${appName} ${appName} CACHE STRING "Name of the main resulting matlab function.")

  # setup doc for matlab functions
  # configure_file(${PROJECT_SOURCE_DIR}/source/${appName}.m
  #   ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${appName}.m)

  add_library(${appName} ${mainFile} ${ARGN})
  # target_link_libraries(${appName} ${ITK_LIBRARIES} )
  if(APPLE)
    target_link_libraries(${appName} ${MATLAB_LIBRARIES} )
  endif()
  if(MSYS)
    target_link_libraries(${appName} stdc++)
  endif()

  install(TARGETS ${appName} DESTINATION ${CMAKE_INSTALL_PREFIX})

  add_custom_command(TARGET ${appName} 
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/bin
    COMMAND ${PROJECT_SOURCE_DIR}/utilsMEX/mex_link.sh  ${appName} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} ${PROJECT_SOURCE_DIR}/utilsMEX/mex_stub.cpp
    )

ENDFUNCTION(add_matlab_cpp_executable)


FUNCTION(add_matlab_c_executable appName mainFile)

  # set(MATLAB_FUNCTION_${appName} ${appName} CACHE STRING "Name of the main resulting matlab function.")

  # setup doc for matlab functions
  # configure_file(${PROJECT_SOURCE_DIR}/source/${appName}.m
  #   ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${appName}.m)

  add_library(${appName} ${mainFile} ${ARGN})
  # target_link_libraries(${appName} ${ITK_LIBRARIES} )
  if(APPLE)
    target_link_libraries(${appName} ${MATLAB_LIBRARIES} )
  endif()
  if(MSYS)
    target_link_libraries(${appName} stdc++)
  endif()

  install(TARGETS ${appName} DESTINATION ${CMAKE_INSTALL_PREFIX})

  add_custom_command(TARGET ${appName} 
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/bin
    COMMAND ${PROJECT_SOURCE_DIR}/utilsMEX/mex_link.sh  ${appName} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} ${PROJECT_SOURCE_DIR}/utilsMEX/mex_stub.c
    )

ENDFUNCTION(add_matlab_c_executable)

