

include_directories(${MAPPINGSDIR}/include )
include_directories(${COREDIR}/include )
include_directories(${CLIENTDIR}/include )
include_directories(${SERVERDIR})


include_directories(${SERVERDIR}/binary_protocol/include )
include_directories(${SERVERDIR}/endpoint_services/include )
include_directories(${SERVERDIR}/services_registry/include )
include_directories(${SERVERDIR}/address_space/include )
include_directories(${SERVERDIR}/tcp_server/include )
include_directories(${SERVERDIR}/builtin_server/include )
include_directories(${SERVERDIR}/xml_address_space_loader/include )
include_directories(${SERVERDIR}/standard_namespace/include )
include_directories(${SERVERDIR}/server/include)

get_property(inc_dirs DIRECTORY PROPERTY INCLUDE_DIRECTORIES)

set(TMPSRC ${SERVERDIR}/services_registry/src)
add_library(services_registry_addon SHARED 
    ${TMPSRC}/services_registry_impl.cpp
    ${TMPSRC}/services_registry_factory.cpp  
    ${TMPSRC}/services_registry_module.cpp
)
target_link_libraries(services_registry_addon  opcuabinary opcuacommon)



set(TMPSRC ${SERVERDIR}/endpoint_services/src)
add_library(endpoints_services_addon SHARED 
    ${TMPSRC}/endpoints_parameters.cpp      
    ${TMPSRC}/endpoints_registry.cpp      
    ${TMPSRC}/endpoints_services_addon.cpp  
    ${TMPSRC}/endpoints_services_module.cpp
)
target_link_libraries(endpoints_services_addon opcuabinary)


set(TMPSRC ${SERVERDIR}/binary_protocol/src)
add_library(opcua_protocol SHARED 
    ${TMPSRC}/opc_tcp_processor.cpp  
    ${TMPSRC}/opcua_protocol_addon.cpp  
    ${TMPSRC}/opcua_protocol_module.cpp
)
target_link_libraries(opcua_protocol opcuacommon endpoints_services_addon xml2)


set(TMPSRC ${SERVERDIR}/standard_namespace/src)
add_library(standard_ns_addon SHARED 
    ${TMPSRC}/standard_namespace_addon.cpp  
    ${TMPSRC}/standard_namespace.cpp        ${TMPSRC}/standard_namespace_module.cpp
)
target_link_libraries(standard_ns_addon opcuabinary)

set(TMPSRC ${SERVERDIR}/address_space/src)
add_library(address_space_addon SHARED 
    ${TMPSRC}/address_space_addon.cpp  ${TMPSRC}/address_space_internal.cpp  ${TMPSRC}/address_space_module.cpp
)
target_link_libraries(address_space_addon opcuabinary opcuacommon ${Boost_LIBRARIES})


set(TMPSRC ${SERVERDIR}/xml_address_space_loader/src)
add_library(xml_address_space_loader_addon SHARED 
${TMPSRC}/xml_address_space_addon.cpp  ${TMPSRC}/xml_address_space_loader.cpp ${TMPSRC}/xml_address_space_module.cpp 
)
target_link_libraries(xml_address_space_loader_addon opcuacommon opcuabinary xml2)


set(TMPSRC ${SERVERDIR}/tcp_server/src)
add_library(opcua_tcp_server SHARED 
    ${TMPSRC}/tcp_server_factory.cpp  
    ${TMPSRC}/tcp_server.cpp        
    ${TMPSRC}/tcp_server_module.cpp
)
target_link_libraries(opcua_tcp_server opcuacommon)

set(TMPSRC ${SERVERDIR}/server/src)
add_library(opcuaserver SHARED 
    ${TMPSRC}/opcuaserver.cpp
)
target_link_libraries(opcuaserver opcuabinary opcuacommon standard_ns_addon opcua_protocol address_space_addon services_registry_addon opcua_tcp_server endpoints_services_addon)



#command line server
set(TMPSRC ${SERVERDIR}/exe/src)
add_executable(server
    ${TMPSRC}/daemon.cpp   ${TMPSRC}/server_main.cpp  ${TMPSRC}/server_options.cpp
)
target_link_libraries(server opcuabinary opcuacommon ${Boost_LIBRARIES} )

#example server
add_executable(example 
    ${TMPSRC}/daemon.cpp  ${TMPSRC}/example.cpp
)
target_link_libraries(example opcuaserver opcuabinary opcuacommon  ${Boost_LIBRARIES} )






