



include_directories(${MAPPINGSDIR}/include)
file(GLOB_RECURSE HEADERS ${MAPPINGSDIR}/include/*.h )

#the OPCUA lib
add_library(opcuabinary SHARED
    ${MAPPINGSDIR}/src/binary_attribute.cpp   
    ${MAPPINGSDIR}/src/binary_node_management.cpp   
    ${MAPPINGSDIR}/src/binary_endpoints.cpp  
    ${MAPPINGSDIR}/src/binary_raw_size.cpp     
    ${MAPPINGSDIR}/src/binary_session.cpp  
    ${MAPPINGSDIR}/src/binary_variant.cpp  
    ${MAPPINGSDIR}/src/monitored_items.cpp  
    ${MAPPINGSDIR}/src/subscriptions.cpp
    ${MAPPINGSDIR}/src/binary_data_value.cpp  
    ${MAPPINGSDIR}/src/binary_messages.cpp   
    ${MAPPINGSDIR}/src/binary_stream.cpp   
    ${MAPPINGSDIR}/src/binary_view.cpp     
    ${MAPPINGSDIR}/src/nodeid.cpp
    ${MAPPINGSDIR}/src/types.cpp
    ${MAPPINGSDIR}/src/input_from_buffer.cpp
    ${MAPPINGSDIR}/src/string_utils.cpp
    ${HEADERS}
)

