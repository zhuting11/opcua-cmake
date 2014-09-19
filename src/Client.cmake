



set(CLIENTSOURCES
    ${CLIENTDIR}/binary_connection.cpp     
    ${CLIENTDIR}/binary_server.cpp        
    ${CLIENTDIR}/client.cpp
    )

if(BUILD_ADDON)
    message(STATUS "Building Addon client " ${BUILD_ADDON})
    set(CLIENTSOURCES ${CLIENTSOURCES}
        ${CLIENTDIR}/binary_server_addon.cpp  
    )
endif(BUILD_ADDON)



add_library(opcuaclient SHARED 
    ${CLIENTSOURCES}
)
target_link_libraries(opcuaclient opcuacore opcuaprotocol)


if(BUILD_ADDON)
    add_executable(client ${CLIENTDIR}/opcua_main.cpp  ${CLIENTDIR}/opcua_options.cpp)
    target_link_libraries(client opcuacore opcuaprotocol opcuaclient)
endif(BUILD_ADDON)

add_executable(example_client ${FREEOPCUAEXAMPLES}/example_client.cpp )
target_link_libraries(example_client opcuaclient )
