# recipes-connectivity/thrift/thrift_0.20.0.bbappend

do_install:append() {
    # Create proper CMake target configuration for Thrift::thrift
    install -d ${D}${libdir}/cmake/thrift
    
    cat > ${D}${libdir}/cmake/thrift/ThriftConfig.cmake << 'EOF'
# Thrift CMake configuration for GNU Radio compatibility
set(THRIFT_FOUND TRUE)
set(THRIFT_VERSION "0.20.0")
set(THRIFT_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/../../../include")
set(THRIFT_LIBRARIES thrift)

# Create the modern CMake target
if(NOT TARGET Thrift::thrift)
    add_library(Thrift::thrift SHARED IMPORTED)
    set_target_properties(Thrift::thrift PROPERTIES
        IMPORTED_LOCATION "${CMAKE_CURRENT_LIST_DIR}/../../../lib/libthrift.so"
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/../../../include"
    )
endif()

# For backward compatibility
set(Thrift_FOUND TRUE)
set(Thrift_VERSION "0.20.0")
set(Thrift_INCLUDE_DIRS ${THRIFT_INCLUDE_DIRS})
set(Thrift_LIBRARIES ${THRIFT_LIBRARIES})
EOF
}

FILES:${PN}-dev += "${libdir}/cmake/thrift/ThriftConfig.cmake"
