



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

if(COMPILETESTS)
    set(MAPPINGSTESTDIR ${MAPPINGSDIR}/tests)
    include_directories(${MAPPINGSTESTDIR})

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


endif()

