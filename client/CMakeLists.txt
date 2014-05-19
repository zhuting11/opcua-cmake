



include_directories(${CMAKE_SOURCE_DIR}/mappings/include )
include_directories(${CMAKE_SOURCE_DIR}/core/include )
include_directories(/usr/include/libxml2/ ) #HACK!!! should not be necessary

include_directories(include )
#the OPCUA lib
add_library(opc_tcp_client SHARED 
    src/binary_computer_addon.cpp  
    src/binary_connection.cpp     
    src/binary_computer.cpp        
    src/binary_secure_channel.cpp  
    src/computer.cpp  
)
target_link_libraries(opc_tcp_client opcuacommon opcuabinary)

add_library(opcua_client SHARED src/client.cpp )
target_link_libraries(opcua_client opcuacommon opcuabinary opc_tcp_client)


add_executable(client src/opcua_main.cpp  src/opcua_options.cpp)
target_link_libraries(client opcuacommon opcuabinary)

add_executable(example_client src/example_main.cpp )
target_link_libraries(example_client opcua_client )
