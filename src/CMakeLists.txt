# Generated from src.pro.

qt_feature_evaluate_features("${CMAKE_CURRENT_SOURCE_DIR}/ivicore/configure.cmake") # special case
qt_feature_evaluate_features("${CMAKE_CURRENT_SOURCE_DIR}/ivivehiclefunctions/configure.cmake") # special case
qt_feature_evaluate_features("${CMAKE_CURRENT_SOURCE_DIR}/ivimedia/configure.cmake") # special case
qt_feature_evaluate_features("${CMAKE_CURRENT_SOURCE_DIR}/geniviextras/configure.cmake") # special case

add_subdirectory(3rdparty) # special case
if(QT_FEATURE_ivicore AND QT_FEATURE_ivigenerator AND NOT QT_FEATURE_geniviextras_only AND NOT QT_FEATURE_system_ivigenerator)
    add_subdirectory(tools/ivigenerator)
endif()

if(QT_FEATURE_ivicore AND NOT QT_FEATURE_geniviextras_only AND NOT QT_FEATURE_host_tools_only)
    add_subdirectory(ivicore)
    add_subdirectory(helper)
endif()
if(QT_FEATURE_ivicore AND QT_FEATURE_ivigenerator AND QT_FEATURE_ivivehiclefunctions AND NOT QT_FEATURE_geniviextras_only AND NOT QT_FEATURE_host_tools_only)
    add_subdirectory(ivivehiclefunctions)
endif()
if(QT_FEATURE_ivicore AND QT_FEATURE_ivimedia AND NOT QT_FEATURE_geniviextras_only AND NOT QT_FEATURE_host_tools_only)
    add_subdirectory(ivimedia)
endif()
# special case begin
if(QT_FEATURE_ivicore AND QT_FEATURE_remoteobjects AND QT_FEATURE_vehiclefunctions_qtro_simulation_server AND NOT ANDROID AND NOT QT_FEATURE_geniviextras_only AND NOT QT_FEATURE_host_tools_only)
    add_subdirectory(tools/vehiclefunctions-simulation-server)
endif()
if(QT_FEATURE_ivicore AND QT_FEATURE_media_qtro_simulation_server AND QT_FEATURE_remoteobjects AND NOT ANDROID AND NOT QT_FEATURE_geniviextras_only AND NOT QT_FEATURE_host_tools_only)
    add_subdirectory(tools/media-simulation-server)
endif()
if(QT_FEATURE_geniviextras AND NOT QT_FEATURE_host_tools_only)
    add_subdirectory(geniviextras)
endif()
add_subdirectory(plugins)
add_subdirectory(imports)
# special case end

