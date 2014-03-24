
include_directories(${CMAKE_SOURCE_DIR}/mappings/include )
include_directories(${CMAKE_SOURCE_DIR}/core/include )
include_directories(${CMAKE_SOURCE_DIR}/client/include )
include_directories(${CMAKE_SOURCE_DIR}/server )


include_directories(binary_protocol/include )
include_directories(endpoint_services/include )
include_directories(services_registry/include )
include_directories(address_space/include )
include_directories(tcp_server/include )
include_directories(builtin_server/include )
include_directories(xml_address_space_loader/include )
include_directories(/usr/include/libxml2/ ) #HACK!!! should not be necessary



set(TMPSRC endpoint_services/src)
add_library(endpoints_services_addon SHARED 
    ${TMPSRC}/endpoints_parameters.cpp      ${TMPSRC}/endpoints_services_addon.h
    ${TMPSRC}/endpoints_parameters.h        ${TMPSRC}/endpoints_services_factory.h
    ${TMPSRC}/endpoints_services_addon.cpp  ${TMPSRC}/endpoints_services_module.cpp
)
target_link_libraries(endpoints_services_addon opcuabinary)


set(TMPSRC binary_protocol/src)
add_library(opcua_protocol SHARED 
    ${TMPSRC}/opc_tcp_processor.cpp  
    ${TMPSRC}/opcua_protocol_addon.cpp  
    ${TMPSRC}/opcua_protocol_factory.h
    ${TMPSRC}/opc_tcp_processor.h    
    ${TMPSRC}/opcua_protocol_addon.h
    ${TMPSRC}/opcua_protocol_module.cpp
)
target_link_libraries(opcua_protocol endpoints_services_addon xml2)

set(TMPSRC services_registry/src)
add_library(services_registry_addon SHARED 
    ${TMPSRC}/services_registry_factory.cpp  ${TMPSRC}/services_registry_impl.h
    ${TMPSRC}/services_registry_factory.h    ${TMPSRC}/services_registry_module.cpp
    ${TMPSRC}/services_registry_impl.cpp
)

set(TMPSRC standard_namespace/src)
add_library(standard_ns_addon SHARED 
    ${TMPSRC}/standard_namespace_addon.cpp  ${TMPSRC}/standard_namespace.h
    ${TMPSRC}/standard_namespace.cpp        ${TMPSRC}/standard_namespace_module.cpp
)
target_link_libraries(standard_ns_addon opcuabinary)

set(TMPSRC address_space/src)
add_library(address_space_addon SHARED 
    ${TMPSRC}/address_space_addon.cpp  ${TMPSRC}/address_space_internal.cpp  ${TMPSRC}/address_space_module.cpp
    ${TMPSRC}/address_space_addon.h    ${TMPSRC}/address_space_internal.h
)
target_link_libraries(address_space_addon opcuabinary opcuacommon)

set(TMPSRC builtin_server/src)
add_library(builtin_server SHARED 
    ${TMPSRC}/builtin_server_addon.cpp    ${TMPSRC}/builtin_server_impl.cpp
    ${TMPSRC}/builtin_server_factory.cpp  ${TMPSRC}/builtin_server_impl.h
)

set(TMPSRC xml_address_space_loader/src)
add_library(xml_address_space_loader_addon SHARED 
${TMPSRC}/xml_address_space_addon.cpp  ${TMPSRC}/xml_address_space_loader.cpp  ${TMPSRC}/xml_address_space_loader.h  ${TMPSRC}/xml_address_space_module.cpp  ${TMPSRC}/xml_processor.h
)
target_link_libraries(xml_address_space_loader_addon opcuacommon opcuabinary xml2)


set(TMPSRC tcp_server/src)
add_library(opcua_tcp_server SHARED 
    ${TMPSRC}/tcp_server_addon_impl.cpp  ${TMPSRC}/tcp_server.cpp        ${TMPSRC}/tcp_server_module.cpp
    ${TMPSRC}/tcp_server_addon_impl.h    ${TMPSRC}/tcp_server_factory.h
)

#command line server
set(TMPSRC exe/src)
add_executable(server 
    ${TMPSRC}/daemon.cpp  ${TMPSRC}/daemon.h  ${TMPSRC}/server_main.cpp  ${TMPSRC}/server_options.cpp  ${TMPSRC}/server_options.h
)
target_link_libraries(server opcuabinary opcuacommon builtin_server ${Boost_LIBRARIES} dl)

#example server
set(TMPSRC example/src)
add_executable(example_server 
    ${TMPSRC}/daemon.cpp  ${TMPSRC}/daemon.h  ${TMPSRC}/server_main.cpp  ${TMPSRC}/server_options.cpp  ${TMPSRC}/server_options.h
)
target_link_libraries(example_server opcuabinary opcuacommon builtin_server ${Boost_LIBRARIES} dl)






