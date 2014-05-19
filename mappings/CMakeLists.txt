



include_directories(include)

#the OPCUA lib
add_library(opcuabinary SHARED
src/binary_attribute.cpp   src/binary_endpoints.cpp  src/binary_raw_size.cpp     src/binary_session.cpp  src/binary_variant.cpp  src/monitored_items.cpp  src/subscriptions.cpp
src/binary_data_value.cpp  src/binary_messages.cpp   src/binary_serialization.h  src/binary_stream.cpp   src/binary_view.cpp     src/nodeid.cpp
src/types.cpp
)

