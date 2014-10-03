



set(SERVERSOURCES
	${SERVERDIR}/asio_addon.cpp 
	${SERVERDIR}/server_object.cpp 
    ${SERVERDIR}/services_registry_impl.cpp
    ${SERVERDIR}/services_registry_factory.cpp  
    ${SERVERDIR}/services_registry_impl.cpp
    ${SERVERDIR}/endpoints_parameters.cpp      
    ${SERVERDIR}/endpoints_registry.cpp      
    ${SERVERDIR}/opc_tcp_processor.cpp  
    ${SERVERDIR}/standard_namespace.cpp        
    ${SERVERDIR}/address_space_internal.cpp  
    ${SERVERDIR}/subscription_service_internal.cpp  
    ${SERVERDIR}/internal_subscription.cpp  
    ${SERVERDIR}/xml_address_space_loader.cpp 
    ${SERVERDIR}/tcp_server.cpp        
    ${SERVERDIR}/opc_tcp_async.cpp        
    ${SERVERDIR}/opc_tcp_async_parameters.cpp        

    ${SERVERDIR}/opcuaserver.cpp
    ${SERVERDIR}/server_object.cpp

    )

if(BUILD_ADDON)
    message(STATUS "Building Addon Server " ${BUILD_ADDON})
    set(SERVERSOURCES ${SERVERSOURCES}
        ${SERVERDIR}/endpoints_services_addon.cpp  
        ${SERVERDIR}/server_object_addon.cpp  
        ${SERVERDIR}/opcua_protocol_addon.cpp  
        ${SERVERDIR}/opc_tcp_async_addon.cpp        
        ${SERVERDIR}/xml_address_space_addon.cpp  
        ${SERVERDIR}/address_space_addon.cpp  
        ${SERVERDIR}/standard_namespace_addon.cpp  
    )
endif(BUILD_ADDON)


add_library(opcuaserver SHARED 
    ${SERVERSOURCES}
)
target_link_libraries(opcuaserver opcuaprotocol opcuacore xml2 ${Boost_LIBRARIES} )



if(BUILD_ADDON)
    #command line server
    add_executable(server
        ${SERVERDIR}/daemon.cpp   
        ${SERVERDIR}/server_main.cpp  
        ${SERVERDIR}/server_options.cpp
    )
    target_link_libraries(server opcuaprotocol opcuacore opcuaserver ${Boost_LIBRARIES} )
endif(BUILD_ADDON)

#example server
include_directories(${FREEOPCUADIR})
add_executable(example_server
    ${SERVERDIR}/daemon.cpp  
    ${FREEOPCUAEXAMPLES}/example_server.cpp
)
target_link_libraries(example_server opcuaserver opcuaprotocol opcuacore  ${Boost_LIBRARIES} )






