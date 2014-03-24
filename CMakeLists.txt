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


