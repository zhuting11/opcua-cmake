
SET(PYTHONFOUND FALSE)
FIND_PACKAGE( Boost COMPONENTS python-py34 )
IF(Boost_PYTHON-PY34_FOUND)
    FIND_PACKAGE(PythonLibs 3.4)
    IF(PYTHONLIBS_FOUND)
        MESSAGE(STATUS "Compiling Python module with Python 3.4")
        #SET(Python_ADDITIONAL_VERSIONS 3.4) #HACK UNTIL GOOD
        SET(PYTHONFOUND TRUE)
    ENDIF()
ENDIF()
IF(NOT PYTHONFOUND)
    FIND_PACKAGE( Boost COMPONENTS python )
    IF(Boost_PYTHON_FOUND)
        FIND_PACKAGE(PythonLibs 2.7)
        IF(PYTHONLIBS_FOUND)
            MESSAGE("Compiling Python module")
            SET(PYTHONFOUND TRUE)
        ENDIF()
    ENDIF()
ENDIF()

IF(NOT PYTHONFOUND)
    MESSAGE(STATUS "Python boost or lib not found: Not building python module")
    RETURN()
ENDIF()

INCLUDE_DIRECTORIES( ${BOOST_INCLUDE_DIR} )
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




