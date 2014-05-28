
include_directories(${MAPPINGSDIR}/include )
include_directories(${COREDIR}/include )
file(GLOB_RECURSE HEADERS ${COREDIR}/include/*.h )

set(TMPSRC ${COREDIR}/src/)
add_library(opcuacommon SHARED 
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
    ${HEADERS}
)
target_link_libraries(opcuacommon opcuabinary ${Boost_LIBRARIES} dl xml2)












