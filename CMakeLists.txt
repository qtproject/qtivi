# Generated from qtivi.pro.

cmake_minimum_required(VERSION 3.16)

include(.cmake.conf)
project(QtIvi
    VERSION "${QT_REPO_MODULE_VERSION}"
    DESCRIPTION "Qt Ivi Libraries"
    HOMEPAGE_URL "https://qt.io/"
    LANGUAGES CXX C
)

find_package(Qt6 ${PROJECT_VERSION} CONFIG REQUIRED COMPONENTS BuildInternals Core) # special case
find_package(Qt6 ${PROJECT_VERSION} CONFIG OPTIONAL_COMPONENTS Gui Qml Quick RemoteObjects Multimedia Sql) # special case

if(INTEGRITY)
    message(NOTICE "Skipping the build as the condition \"NOT INTEGRITY\" is not met.")
    return()
endif()
if(WINRT)
    message(NOTICE "Skipping the build as the condition \"NOT WINRT\" is not met.")
    return()
endif()
if(QNX)
    message(NOTICE "Skipping the build as the condition \"NOT QNX\" is not met.")
    return()
endif()
if(WASM)
    message(NOTICE "Skipping the build as the condition \"NOT WASM\" is not met.")
    return()
endif()
qt_build_repo()