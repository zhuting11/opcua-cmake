
FIND_PACKAGE( Boost 1.40 COMPONENTS python-py34 REQUIRED )
INCLUDE_DIRECTORIES( ${BOOST_INCLUDE_DIR} )
set(Python_ADDITIONAL_VERSIONS 3.4)
FIND_PACKAGE(PythonLibs 3.4 REQUIRED)
#FIND_PACKAGE(PythonLibs 2.7 REQUIRED)
INCLUDE_DIRECTORIES( ${PYTHON_INCLUDE_DIR} )

include_directories(${CMAKE_SOURCE_DIR}/mappings/include )
include_directories(${CMAKE_SOURCE_DIR}/core/include )
include_directories(${CMAKE_SOURCE_DIR}/client/include )
include_directories(${CMAKE_SOURCE_DIR}/server )


include_directories(${CMAKE_SOURCE_DIR}/server/binary_protocol/include )
include_directories(${CMAKE_SOURCE_DIR}/server/endpoint_services/include )
include_directories(${CMAKE_SOURCE_DIR}/server/services_registry/include )
include_directories(${CMAKE_SOURCE_DIR}/server/address_space/include )
include_directories(${CMAKE_SOURCE_DIR}/server/tcp_server/include )
include_directories(${CMAKE_SOURCE_DIR}/server/builtin_server/include )
include_directories(${CMAKE_SOURCE_DIR}/server/server/include )
include_directories(${CMAKE_SOURCE_DIR}/server/xml_address_space_loader/include )


add_definitions(-DMODULE_NAME=opcua)
ADD_LIBRARY(opcua SHARED src/module.cpp)
set_target_properties(opcua PROPERTIES PREFIX "")
TARGET_LINK_LIBRARIES(opcua opcuaserver opcuabinary opcuacommon opcua_client ${Boost_LIBRARIES} ${PYTHON_LIBRARIES})




