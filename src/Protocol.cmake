


#the OPCUA lib
add_library(opcuaprotocol 
    ${MAPPINGSDIR}/binary_attribute.cpp   
    ${MAPPINGSDIR}/binary_node_management.cpp   
    ${MAPPINGSDIR}/binary_endpoints.cpp  
    ${MAPPINGSDIR}/binary_raw_size.cpp     
    ${MAPPINGSDIR}/binary_session.cpp  
    ${MAPPINGSDIR}/binary_variant.cpp  
    ${MAPPINGSDIR}/monitored_items.cpp  
    ${MAPPINGSDIR}/subscriptions.cpp
    ${MAPPINGSDIR}/binary_data_value.cpp  
    ${MAPPINGSDIR}/binary_messages.cpp   
    ${MAPPINGSDIR}/binary_stream.cpp   
    ${MAPPINGSDIR}/binary_view.cpp     
    ${MAPPINGSDIR}/nodeid.cpp
    ${MAPPINGSDIR}/input_from_buffer.cpp
    ${MAPPINGSDIR}/string_utils.cpp
    ${MAPPINGSDIR}/status_codes.cpp  
    ${MAPPINGSDIR}/session.cpp  
    ${PROTOCOL_HEADERS}
    ${HEADERS}
)

if(BUILD_TESTS)
    set(MAPPINGSTESTDIR ${FREEOPCUATESTS}/protocol/)

    add_executable(opcuabinary_tests EXCLUDE_FROM_ALL 
        ${MAPPINGSTESTDIR}/binary_deserialize.cpp
        ${MAPPINGSTESTDIR}/binary_serialize_variant.cpp
        ${MAPPINGSTESTDIR}/binary_serialize.cpp
        ${MAPPINGSTESTDIR}/binary_serialize_attribute.cpp
        ${MAPPINGSTESTDIR}/binary_serialize_data_value.cpp
        ${MAPPINGSTESTDIR}/binary_serialize_endpoints.cpp
        ${MAPPINGSTESTDIR}/binary_serialize_monitored_items.cpp
        ${MAPPINGSTESTDIR}/binary_serialize_session.cpp
        ${MAPPINGSTESTDIR}/binary_serialize_view.cpp
        ${MAPPINGSTESTDIR}/binary_subscriptions.cpp
        ${MAPPINGSTESTDIR}/binary_node_management.cpp
        ${MAPPINGSTESTDIR}/message_id.cpp
        ${MAPPINGSTESTDIR}/node_id.cpp
        ${MAPPINGSTESTDIR}/reference_id.cpp
        ${MAPPINGSTESTDIR}/test_input_from_buffer.cpp
        ${MAPPINGSTESTDIR}/utils.cpp

        ${MAPPINGSTESTDIR}/common.h
    )
    target_link_libraries(opcuabinary_tests ${GTEST_BOTH_LIBRARIES} opcuabinary pthread)


endif(BUILD_TESTS)

