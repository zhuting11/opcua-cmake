
INCLUDE_DIRECTORIES( ${CMAKE_SOURCE_DIR}/mappings/include )

set(TMPSRC src/)
set(TMPINCLUDE include/)
INCLUDE_DIRECTORIES( ${TMPINCLUDE} )
add_library(opcuacommon SHARED 
${TMPSRC}/socket_channel.cpp
${TMPSRC}/common/application.cpp  ${TMPSRC}/common/common_errors.cpp  ${TMPSRC}/common/exception.cpp  ${TMPSRC}/common/object_id.cpp  ${TMPSRC}/common/thread.cpp  ${TMPSRC}/common/value.cpp ${TMPSRC}/common/node.cpp

${TMPSRC}/common//addons_core/addon_manager.cpp  ${TMPSRC}/common//addons_core/config_file.cpp  ${TMPSRC}/common//addons_core/dynamic_addon_factory.cpp  ${TMPSRC}/common//addons_core/dynamic_library.cpp  ${TMPSRC}/common//addons_core/dynamic_library.h  ${TMPSRC}/common//addons_core/errors_addon_manager.cpp
)
target_link_libraries(opcuacommon opcuabinary ${Boost_LIBRARIES})












