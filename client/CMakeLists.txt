


#include_directories(${MAPPINGSDIR}/include )
#include_directories(${COREDIR}/include )
#include_directories(${CLIENTDIR}/include )


#the OPCUA lib
add_library(opcuaclient SHARED 
    ${CLIENTDIR}/binary_computer_addon.cpp  
    ${CLIENTDIR}/binary_connection.cpp     
    ${CLIENTDIR}/binary_computer.cpp        
    ${CLIENTDIR}/computer.cpp  
    #${CLIENTDIR}/errors.cpp  
    ${CLIENTDIR}/client.cpp
)
target_link_libraries(opcuaclient opcuacore opcuaprotocol)


add_executable(client ${CLIENTDIR}/opcua_main.cpp  ${CLIENTDIR}/opcua_options.cpp)
target_link_libraries(client opcuacore opcuaprotocol opcuaclient)

add_executable(example_client ${FREEOPCUAEXAMPLES}/example_client.cpp )
target_link_libraries(example_client opcuaclient )
