


include_directories(${MAPPINGSDIR}/include )
include_directories(${COREDIR}/include )
include_directories(${CLIENTDIR}/include )


#the OPCUA lib
add_library(opc_tcp_client SHARED 
    ${CLIENTDIR}/src/binary_computer_addon.cpp  
    ${CLIENTDIR}/src/binary_connection.cpp     
    ${CLIENTDIR}/src/binary_computer.cpp        
    ${CLIENTDIR}/src/binary_secure_channel.cpp  
    ${CLIENTDIR}/src/computer.cpp  
)
target_link_libraries(opc_tcp_client opcuacommon opcuabinary)

add_library(opcua_client SHARED ${CLIENTDIR}/src/client.cpp )
target_link_libraries(opcua_client opcuacommon opcuabinary opc_tcp_client)


add_executable(client ${CLIENTDIR}/src/opcua_main.cpp  ${CLIENTDIR}/src/opcua_options.cpp)
target_link_libraries(client opcuacommon opcuabinary)

add_executable(example_client ${CLIENTDIR}/src/example_main.cpp )
target_link_libraries(example_client opcua_client )
