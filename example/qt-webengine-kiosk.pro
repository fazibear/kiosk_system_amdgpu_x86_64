TEMPLATE = app

QT += quick webenginewidgets

SOURCES = src/main.cpp
RESOURCES = src/quickmwtest.qrc
OTHER_FILES = src/screen.qml

DESTDIR = priv/
OBJECTS_DIR = _build/qt
MOC_DIR = _build/qt
RCC_DIR = _build/qt
UI_DIR = _build/qt
