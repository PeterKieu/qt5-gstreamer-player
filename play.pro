TEMPLATE = app

QT += qml quick widgets

CONFIG += c++11

DEFINES += GST_USE_UNSTABLE_API

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
#QML_IMPORT_PATH =
#QML_IMPORT_PATH += $$PWD

# Default rules for deployment.
include(deployment.pri)

# not tested (yet)
unix:!macx {
QT_CONFIG -= no-pkg-config
CONFIG += link_pkgconfig
PKGCONFIG = \
    gstreamer-1.0 \
    gstreamer-player-1.0 \
    gstreamer-tag-1.0
}

macx {
    CONFIG+=sdk_no_version_check
    #QMAKE_MAC_SDK = sdk_no_version_check
    #QMAKE_MAC_SDK =  macosx10.14
    QML_IMPORT_PATH += $PWD
    INCLUDEPATH += /Library/Frameworks/GStreamer.framework/Headers

    LIBS += \
        -framework AppKit \
        -F/Library/Frameworks -framework GStreamer
}

win32 {
    INCLUDEPATH += c:\gstreamer\1.0\x86_64\include\gstreamer-1.0\
    INCLUDEPATH += c:\gstreamer\1.0\x86_64\include\glib-2.0\
    INCLUDEPATH += c:\gstreamer\1.0\x86_64\lib\glib-2.0\include\
    LIBS += c:\gstreamer\1.0\x86_64\lib\gstreamer-1.0\
}

HEADERS +=

SOURCES += main.cpp

DISTFILES +=
