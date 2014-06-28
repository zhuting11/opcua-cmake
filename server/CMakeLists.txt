


#include_directories(${SERVERDIR}/binary_protocol/include )
#include_directories(${SERVERDIR}/endpoint_services/include )
#include_directories(${SERVERDIR}/services_registry/include )
#include_directories(${SERVERDIR}/address_space/include )
#include_directories(${SERVERDIR}/tcp_server/include )
#include_directories(${SERVERDIR}/builtin_server/include )
#include_directories(${SERVERDIR}/xml_address_space_loader/include )
#include_directories(${SERVERDIR}/standard_namespace/include )

#get_property(inc_dirs DIRECTORY PROPERTY INCLUDE_DIRECTORIES)

add_library(opcuaserver SHARED 
    ${SERVERDIR}/services_registry_impl.cpp
    ${SERVERDIR}/services_registry_factory.cpp  
    ${SERVERDIR}/services_registry_impl.cpp
    ${SERVERDIR}/endpoints_parameters.cpp      
    ${SERVERDIR}/endpoints_registry.cpp      
    ${SERVERDIR}/endpoints_services_addon.cpp  
    #${SERVERDIR}/endpoints_services_module.cpp
    ${SERVERDIR}/opc_tcp_processor.cpp  
    ${SERVERDIR}/opcua_protocol_addon.cpp  
    #${SERVERDIR}/opcua_protocol_module.cpp
    ${SERVERDIR}/standard_namespace_addon.cpp  
    ${SERVERDIR}/standard_namespace.cpp        
    #${SERVERDIR}/standard_namespace_module.cpp
    ${SERVERDIR}/address_space_addon.cpp  
    ${SERVERDIR}/address_space_internal.cpp  
    #${SERVERDIR}/address_space_module.cpp
    ${SERVERDIR}/xml_address_space_addon.cpp  
    ${SERVERDIR}/xml_address_space_loader.cpp 
    #${SERVERDIR}/xml_address_space_module.cpp 
    ${SERVERDIR}/tcp_server_factory.cpp  
    ${SERVERDIR}/tcp_server.cpp        
    #${SERVERDIR}/tcp_server_module.cpp
    ${SERVERDIR}/opcuaserver.cpp
)
target_link_libraries(opcuaserver opcuaprotocol opcuacore xml2 ${Boost_LIBRARIES} )



#command line server
add_executable(server
    ${SERVERDIR}/daemon.cpp   
    ${SERVERDIR}/server_main.cpp  
    ${SERVERDIR}/server_options.cpp
)
target_link_libraries(server opcuaprotocol opcuacore opcuaserver ${Boost_LIBRARIES} )

#example server
include_directories(${FREEOPCUADIR})
add_executable(example_server
    ${SERVERDIR}/daemon.cpp  
    ${FREEOPCUAEXAMPLES}/example_server.cpp
)
target_link_libraries(example_server opcuaserver opcuaprotocol opcuacore  ${Boost_LIBRARIES} )






