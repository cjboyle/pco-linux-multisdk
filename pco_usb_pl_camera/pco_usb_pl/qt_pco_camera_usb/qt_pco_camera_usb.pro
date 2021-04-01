TEMPLATE = app
TARGET = qt_pco_camera_usb
DESTDIR = ../bin
QT += core widgets gui

DEFINES += QT_WIDGETS_LIB
DEFINES += NOPCOCNVLIB
INCLUDEPATH += ./GeneratedFiles \
    . \
    ../../pco_common/pco_include \
    ../../pco_common/pco_classes \
    ../../pco_common/qt_pco_camera \
    ./../pco_classes \

DEPENDPATH += .
MOC_DIR += ./GeneratedFiles/moc
OBJECTS_DIR += objects
UI_DIR += ./GeneratedFiles
RCC_DIR += ./GeneratedFiles
include(qt_pco_camera_usb.pri)

DEPENDPATH += $$PWD/../lib

unix:!macx: LIBS += -L$$PWD/../lib/ -lpcocam_usb -lusb-1.0

unix:!macx: PRE_TARGETDEPS += $$PWD/../lib/libpcocam_usb.a
