
#include_directories(${COREDIR}/include )
#file(GLOB_RECURSE HEADERS ${COREDIR}/include/*.h )

set(TMPSRC ${COREDIR})
add_library(opcuacore SHARED 
    ${TMPSRC}/socket_channel.cpp
    ${TMPSRC}/common/application.cpp  
    ${TMPSRC}/common/common_errors.cpp  
    ${TMPSRC}/common/exception.cpp  
    ${TMPSRC}/common/object_id.cpp  
    ${TMPSRC}/common/thread.cpp  
    ${TMPSRC}/common/value.cpp 
    ${TMPSRC}/node.cpp
    ${TMPSRC}/common/addons_core/addon_manager.cpp  
    ${TMPSRC}/common/addons_core/config_file.cpp  
    ${TMPSRC}/common/addons_core/dynamic_addon_factory.cpp  
    ${TMPSRC}/common/addons_core/dynamic_library.cpp  
    ${TMPSRC}/common/addons_core/errors_addon_manager.cpp
    ${TMPSRC}/opcua_errors.cpp
    ${TMPSRC}/subscription.cpp
    ${HEADERS}
)
target_link_libraries(opcuacore opcuaprotocol ${Boost_LIBRARIES} dl xml2)


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











