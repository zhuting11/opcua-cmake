cmake_minimum_required (VERSION 2.6)
project (OPCUAlib)
SET(CMAKE_CXX_FLAGS "-std=c++0x") # just for testing

FIND_PACKAGE( Boost 1.40 COMPONENTS program_options filesystem REQUIRED )
INCLUDE_DIRECTORIES( ${Boost_INCLUDE_DIR} )

FIND_PACKAGE(LibXml2 REQUIRED )
INCLUDE_DIRECTORIES( ${LibXml2_INCLUDE_DIR} )



add_subdirectory (mappings) 
add_subdirectory (core) 
add_subdirectory (client) 
add_subdirectory (server) 

#command line client
#include_directories(/usr/include/libxml2/ ) #HACK!!! should not be necessary
#include_directories(${CMAKE_SOURCE_DIR}/include )
#include_directories(${CMAKE_SOURCE_DIR}/include_client )
#add_executable(client src_client/opcua_main.cpp  src_client/opcua_options.cpp)
#target_link_libraries(client opc_tcp_client OPCUA ${Boost_LIBRARIES})

