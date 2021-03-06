#-------------------------------------------------
#
# Project created by QtCreator 2010-07-22T01:54:24
#
#-------------------------------------------------

QT       = core gui network widgets printsupport multimedia testlib webenginewidgets webengine

CONFIG += console link_pkgconfig c++11
TARGET = qt-webengine-kiosk
TEMPLATE = app
VERSION = 1.99.3

CONFIG(debug, debug|release) {
# here comes debug specific statements
    message(Debug build)
} else {
# here comes release specific statements
#    CONFIG -= debug
#    DEFINES += QT_NO_DEBUG_OUTPUT
}

DEFINES += VERSION=\\\"$${VERSION}\\\"

DEFINES += PLAYER_MULTIMEDIA
DEFINES += USE_TESTLIB
PLAYER = MULTIMEDIA

!win32 {
    isEmpty( PREFIX ) {
        PREFIX = /usr/local
    }

#    ICON = $${PREFIX}/share/icons/$${TARGET}.png
    DEFINES += RESOURCES=\\\"$${PREFIX}/share/$${TARGET}/\\\"
    DEFINES += ICON=\\\"$${ICON}\\\"

}

win32 {
    ICON = ./$${TARGET}.png
    DEFINES += RESOURCES=\\\"./\\\"
    DEFINES += ICON=\\\"$${ICON}\\\"

}

message(Qt version: $$[QT_VERSION])
message(Qt is installed in $$[QT_INSTALL_PREFIX])
message(Settings:)
message(- QT     : $${QT})
message(- PREFIX : $${PREFIX})
message(- TARGET : $${TARGET})
message(- VERSION: $${VERSION})

SOURCES += main.cpp\
    mainwindow.cpp \
    webview.cpp \
    fakewebview.cpp \
    unixsignals.cpp \
    socketpair.cpp \
    player/multimedia.cpp

HEADERS  += mainwindow.h \
    webview.h \
    config.h \
    qplayer.h \
    fakewebview.h \
    unixsignals.h \
    socketpair.h \
    player/multimedia.h

# DEBUG
#message(- SOURCES: $${SOURCES})
#message(- HEADERS: $${HEADERS})

# INSTALL

target.path = $${PREFIX}/bin

# icon.files = ../resources/$${TARGET}.png
# icon.path = $${PREFIX}/share/icons

INSTALLS += target icon

DESTDIR = ../priv/
OBJECTS_DIR = ../_build/qt
MOC_DIR = ../_build/qt
RCC_DIR = ../_build/qt
UI_DIR = ../_build/qt
