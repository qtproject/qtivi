# Generated from core.pro.

#####################################################################
## qtivicoreplugin Plugin:
#####################################################################

qt_internal_add_qml_module(qtivicoreplugin
    URI "QtIvi"
    VERSION "${PROJECT_VERSION}"
    PAST_MAJOR_VERSIONS 1
    CLASS_NAME QtIviCorePlugin
    PLUGIN_TARGET qtivicoreplugin
    NO_PLUGIN_OPTIONAL
    NO_GENERATE_PLUGIN_SOURCE
    NO_GENERATE_QMLTYPES
    INSTALL_SOURCE_QMLTYPES "plugins.qmltypes"
    SOURCES
        plugin.cpp
    PUBLIC_LIBRARIES
        Qt::IviCore
)

#### Keys ignored in scope 1:.:.:core.pro:<TRUE>:
# CXX_MODULE = "qml"
# OTHER_FILES = "$$qml_files"
# QML_IMPORT_VERSION = "1.0"
# TARGETPATH = "QtIvi"
# qml_files = "$$_PRO_FILE_PWD_/qmldir"

## Scopes:
#####################################################################

#### Keys ignored in scope 2:.:.:core.pro:NOT CMAKE_CROSSCOMPILING AND NOT force_independent AND ( NOT debug_and_release OR NOT build_all OR CONFIG(release,debug OR release) ) AND TARGET Qt::Quick:
# QMAKE_EXTRA_TARGETS = "first"
# first.depends = "qmltypes"
# first.target = "first"
