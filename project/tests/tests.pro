include(../defaults.pri)

TEMPLATE = app
CONFIG += console
QT +=  testlib

DEFINES += EXPORT_APPLICATION

HEADERS += autotest.h \
    test_octopart.h
HEADERS +=  testqstring.h
HEADERS +=  test_kicad_schem_lib.h
HEADERS += ../src/kicadfile_lib.h

SOURCES +=  main.cpp \
    test_octopart.cpp
SOURCES +=  testqstring.cpp
SOURCES +=  test_kicad_schem_lib.cpp

#message($$PWD/../)
INCLUDEPATH += $$PWD/../libs/googletest/googletest/include
INCLUDEPATH += $$PWD/../libs/googletest/googlemock/include


LIBS += -L$$PWD/../libs/build/googletest/googlemock/
LIBS += -L$$PWD/../libs/build/googletest/googlemock/gtest


LIBS += -lgmock
LIBS += -lgtest



CONFIG( debug, debug|release ) {
    # debug
     #message(Debug)


     LIBS += -L../src/debug/
     LIBS += -L../src/
     LIBS +=  -lkicadlibcreatord
} else {
    # release
    #message(Release)
    LIBS += -L../src/release/
    LIBS += -L../src/
    LIBS +=  -lkicadlibcreator

}

COPY_DIR = "$$(UNIXTOOLS)cp -r"

#message($$COPY_DIR)
#message($$OUT_PWD/)
#message($$PWD/scripts)

#copies scripts into builds

#runtests.commands = $$RUNTEST
#runtests.depends = copydata

copydata.commands = $$COPY_DIR $$PWD/scripts $$OUT_PWD/
first.depends = $(first) copydata

export(first.depends)
export(copydata.commands)

QMAKE_EXTRA_TARGETS +=   first copydata




#
