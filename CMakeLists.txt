cmake_minimum_required (VERSION 2.6)
project (OPCUAlib)
SET (CMAKE_CXX_COMPILER  "/usr/bin/clang++")
SET(CMAKE_SHARED_LINKER_FLAGS "--no-undefined" )

SET(CMAKE_CXX_FLAGS "-std=c++0x -ggdb -Wall ${CMAKE_CXX_FLAGS_DEBUG} " ) 
#set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wall")

FIND_PACKAGE( Boost 1.40 COMPONENTS system program_options filesystem thread REQUIRED )
INCLUDE_DIRECTORIES( ${Boost_INCLUDE_DIR} )

FIND_PACKAGE(LibXml2 REQUIRED )
INCLUDE_DIRECTORIES( ${LibXml2_INCLUDE_DIR} )

message(STATUS "ROOT DIR IS: " ${CMAKE_SOURCE_DIR})

set(MAPPINGSDIR ${CMAKE_SOURCE_DIR}/reps/opcua-mappings)
set(COREDIR ${CMAKE_SOURCE_DIR}/reps/opcua-core)
set(CLIENTDIR ${CMAKE_SOURCE_DIR}/reps/opcua-client)
set(SERVERDIR ${CMAKE_SOURCE_DIR}/reps/opcua-server)
set(PYTHONDIR ${CMAKE_SOURCE_DIR}/reps/opcua-python)

get_property(inc_dirs DIRECTORY PROPERTY INCLUDE_DIRECTORIES)
message(STATUS "ROOT INCLUDE DIR: "  ${inc_dirs})


add_subdirectory (mappings) 
add_subdirectory (core) 
add_subdirectory (client) 
add_subdirectory (server) 
add_subdirectory (python) 


