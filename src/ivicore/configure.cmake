# special case begin
# Define a stub for qt-configure-module
if (NOT COMMAND qt_config_python3_package_test)
 defstub(qt_config_python3_package_test)
endif()
# special case end

#### Inputs

# input ivigenerator
set(INPUT_ivigenerator "undefined" CACHE STRING "")
set_property(CACHE INPUT_ivigenerator PROPERTY STRINGS undefined no qt system)

# input qface
set(INPUT_qface "undefined" CACHE STRING "")
set_property(CACHE INPUT_qface PROPERTY STRINGS undefined no qt system)



#### Libraries

qt_find_package(Python3 PROVIDED_TARGETS Python3::Interpreter MODULE_NAME ivicore)

#### Tests

qt_config_python3_package_test(virtualenv
    LABEL "Python3 virtualenv package"
    PACKAGE "virtualenv"
)
qt_config_python3_package_test(qface
    LABEL "Python3 qface package"
    PACKAGE "qface"
    VERSION "2.0.3"
)

#### Features

qt_feature("python3" PRIVATE
    LABEL "python3"
    CONDITION PYTHON3_FOUND
)
qt_feature("python3-virtualenv" PRIVATE
    LABEL "virtualenv"
    CONDITION QT_FEATURE_python3 AND TEST_virtualenv
)
qt_feature("system-qface" PUBLIC
    LABEL "System QFace"
    CONDITION TEST_qface
    ENABLE INPUT_qface STREQUAL 'system'
    DISABLE INPUT_qface STREQUAL 'no' OR INPUT_qface STREQUAL 'qt'
)
qt_feature("system-ivigenerator" PRIVATE
    LABEL "System IVI Generator"
    ENABLE INPUT_ivigenerator STREQUAL 'system'
    DISABLE ( NOT INPUT_ivigenerator STREQUAL 'system' )
)
qt_feature("ivigenerator" PUBLIC
    LABEL "IVI Generator"
    CONDITION QT_FEATURE_ivicore AND QT_FEATURE_python3 AND ( ( QT_FEATURE_python3_virtualenv AND EXISTS "${CMAKE_CURRENT_LIST_DIR}/../3rdparty/qface/setup.py" ) OR ( QT_FEATURE_system_qface ) ) OR QT_FEATURE_system_ivigenerator # special case
    ENABLE INPUT_ivigenerator STREQUAL 'qt' OR INPUT_ivigenerator STREQUAL 'system'
    DISABLE INPUT_ivigenerator STREQUAL 'no'
)
qt_feature("host-tools-only" PRIVATE
    LABEL "Only build the host tools"
    CONDITION INPUT_host_tools_only STREQUAL 'yes'
)
qt_feature("remoteobjects" PUBLIC
    LABEL "QtRemoteObjects Support"
    CONDITION TARGET Qt::RemoteObjects OR INPUT_force_ivigenerator_qtremoteobjects STREQUAL 'yes'
)
qt_feature("ivicore" PUBLIC
    LABEL "Qt IVI Core"
)
qt_configure_add_summary_section(NAME "Qt IVI Core")
qt_configure_add_summary_section(NAME "Python3")
if(PYTHON3_FOUND)
    qt_configure_add_summary_entry(TYPE "message" ARGS "Executable" MESSAGE "${Python3_EXECUTABLE}")
    qt_configure_add_summary_entry(TYPE "message" ARGS "Version" MESSAGE "${Python3_VERSION}")
else()
    qt_configure_add_summary_entry(TYPE "message" ARGS "Executable" MESSAGE "no")
endif()
qt_configure_add_summary_entry(ARGS "python3-virtualenv")
qt_configure_add_summary_entry(ARGS "system-qface")
qt_configure_end_summary_section() # end of "Python3" section
qt_configure_add_summary_entry(ARGS "ivigenerator")
qt_configure_add_summary_entry(ARGS "remoteobjects")
qt_configure_end_summary_section() # end of "Qt IVI Core" section
qt_configure_add_summary_entry(
    ARGS "ivicore"
    CONDITION NOT QT_FEATURE_ivicore
)
qt_configure_add_report_entry(
    TYPE ERROR
# special case begin
    MESSAGE [[
Cannot build the IVI Generator because its dependencies are not satisfied.
The IVI Generator provides tooling to generate source code out of IDL files.
Make sure python3 and its 'virtualenv' packages are installed.
E.g. by running
    apt-get install python3 python3-virtualenv

And make sure the qface submodule is initialized or the correct qface version is installed on your system.
E.g. by running the following command:
    git submodule init && git submodule update
]]
# special case end
    CONDITION QT_FEATURE_ivicore AND NOT QT_FEATURE_ivigenerator AND ( NOT INPUT_ivigenerator STREQUAL 'no' )
)
qt_configure_add_report_entry(
    TYPE WARNING
    MESSAGE "Cannot enable the QtRemoteObjects features because the QtRemoteObjects module is not installed."
    CONDITION NOT QT_FEATURE_remoteobjects
)
