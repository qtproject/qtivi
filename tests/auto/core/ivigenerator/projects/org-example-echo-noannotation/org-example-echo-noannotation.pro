TEMPLATE = subdirs

SUBDIRS = frontend \
          backend_simulator \
          validator \
          test \

backend_simulator.depends = frontend
validator.depends = frontend
test.depends = frontend

QT_FOR_CONFIG += ivicore
qtConfig(remoteobjects): {
    SUBDIRS += backend_qtro \
               simulation_server_qtro \

    backend_qtro.depends = frontend
    simulation_server_qtro.depends = frontend
}