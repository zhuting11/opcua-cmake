cmake_minimum_required (VERSION 2.6)

project (FreeOpcUa)

if (NOT WIN32)
    set(CMAKE_CXX_COMPILER  "/usr/bin/clang++")
    set(CMAKE_SHARED_LINKER_FLAGS "--no-undefined" )

    set(CMAKE_CXX_FLAGS "-std=c++0x -ggdb -Wall ${CMAKE_CXX_FLAGS_DEBUG} " ) 
    #set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wall")
endif (NOT WIN32)


find_package( Boost  COMPONENTS system program_options filesystem thread REQUIRED )
include_directories( ${Boost_INCLUDE_DIR} )
message(STATUS "Boost INCLUDE DIR IS: " ${Boost_INCLUDE_DIR})
message(STATUS "Boost INCLUDE DIR IS: " ${Boost_FOUND})

if( WIN32 )
	set(LIBXML2_INCLUDE_DIR c:/lixml2/include/)
	set(LIBXML2_LIBRARIES c:/lixml2/lib)
else ( WIN32 )
	find_package(LibXml2 REQUIRED) 
endif( WIN32 )
include_directories( ${LIBXML2_INCLUDE_DIR} )
message(STATUS "CML2 INCLUDE DIR IS: " ${LIBXML2_INCLUDE_DIR})
message(STATUS "CML2 INCLUDE DIR IS: " ${LIBXML2_LIBRARIES})

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
#add_subdirectory (client) 
#add_subdirectory (server) 
#add_subdirectory (python) 


