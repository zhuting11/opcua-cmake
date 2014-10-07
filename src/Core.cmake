
set(TMPSRC ${COREDIR})
set(CORESOURCES
    ${TMPSRC}/socket_channel.cpp
    ${TMPSRC}/common/common_errors.cpp  
    ${TMPSRC}/common/exception.cpp  
    ${TMPSRC}/common/object_id.cpp  
    ${TMPSRC}/common/thread.cpp  
    ${TMPSRC}/common/value.cpp 
    ${TMPSRC}/node.cpp
    ${TMPSRC}/event.cpp
    ${TMPSRC}/opcua_errors.cpp
    ${TMPSRC}/subscription.cpp
    ${TMPSRC}/model_object.cpp
    ${TMPSRC}/model_server.cpp
    ${TMPSRC}/model_object_type.cpp
    ${TMPSRC}/model_node.cpp
    ${TMPSRC}/model_variable.cpp
    )

if(BUILD_ADDON)
    message(STATUS "Building Addon core " ${BUILD_ADDON})
    set(CORESOURCES ${CORESOURCES}
        ${TMPSRC}/common/application.cpp  
        ${TMPSRC}/common/addons_core/addon_manager.cpp  
        ${TMPSRC}/common/addons_core/config_file.cpp  
        ${TMPSRC}/common/addons_core/dynamic_addon_factory.cpp  
        ${TMPSRC}/common/addons_core/dynamic_library.cpp  
        ${TMPSRC}/common/addons_core/errors_addon_manager.cpp
    )
endif(BUILD_ADDON)



add_library(opcuacore 
    ${CORESOURCES}
    ${HEADERS}
)

target_link_libraries(opcuacore opcuaprotocol ${Boost_LIBRARIES} ${DL_LIBRARIES} ${LIBXML2_LIBRARIES})


if(BUILD_TESTS)
    set(CORETESTDIR ${FREEOPCUATESTS}/core)
    include_directories(${CORETESTDIR})

    add_executable(opcuacore_tests EXCLUDE_FROM_ALL 
        ${CORETESTDIR}/common/error_test.cpp
        ${CORETESTDIR}/common/main.cpp
        ${CORETESTDIR}/common/value_test.cpp
    )
    target_link_libraries(opcuacore_tests ${GTEST_BOTH_LIBRARIES} opcuabinary opcuacommon pthread cppunit)
endif(BUILD_TESTS)











