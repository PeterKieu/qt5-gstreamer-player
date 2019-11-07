TEMPLATE = lib
CONFIG += qt plugin
QT += qml quick
#CONFIG += c++11
#CONFIG+=sdk_no_version_check
DEFINES += GST_USE_UNSTABLE_API
TARGET = qmlplayerextension

# Additional import path used to resolve QML modules in Qt Creator's code model
# QML_IMPORT_PATH =


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
    #QMAKE_MAC_SDK = macosx10.14
    #QMAKE_MAC_SDK = sdk_no_version_check
    INCLUDEPATH += /Library/Frameworks/GStreamer.framework/Headers

    LIBS += \
        -framework AppKit \
        -F/Library/Frameworks -framework GStreamer
}

#win32 {
#for #include <gst/player/player.h>  <gst/gst.h> <gst/tag/tag.h>
    INCLUDEPATH += c:\gstreamer\1.0\x86_64\include\gstreamer-1.0
    INCLUDEPATH += c:\gstreamer\1.0\x86_64\include\glib-2.0
    INCLUDEPATH += c:\gstreamer\1.0\x86_64\lib\glib-2.0\include

    LIBS += -Lc:\gstreamer\1.0\x86_64\lib
    LIBS += -Lc:\gstreamer\1.0\x86_64\lib\gstreamer-1.0
    LIBS += -Lc:\gstreamer\1.0\x86_64\lib\gstreamer-1.0
#}

HEADERS += qplayerextension.h \
    qgstplayer.h \
    player.h \
    quickrenderer.h \
    imagesample.h

SOURCES += qplayerextension.cpp \
    qgstplayer.cpp \
    player.cpp \
    quickrenderer.cpp \
    imagesample.cpp
