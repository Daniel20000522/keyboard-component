TOP_BUILDDIR = $$OUT_PWD/../../..
TOP_SRCDIR = $$PWD/../../..

include($${TOP_SRCDIR}/config.pri)

TEMPLATE        = lib
CONFIG         += plugin
QT             += widgets
INCLUDEPATH    += \
    $${TOP_SRCDIR}/src/ \
    $${TOP_SRCDIR}/src/lib/ \
    $${TOP_SRCDIR}/src/lib/logic/
    $${TOP_SRCDIR}/plugins/westernsupport

HEADERS         = \
    frenchplugin.h

TARGET          = $$qtLibraryTarget(frenchplugin)

EXAMPLE_FILES = frenchplugin.json

# generate database for presage:
QMAKE_POST_LINK = text2ngram -n 1 -l -f sqlite -o $$TOP_BUILDDIR/database_fr.db $$PWD/les_trois_mousquetaires.txt
QMAKE_CLEAN     += $$TOP_BUILDDIR/database_fr.db

# install
lang_db_fr.path = $${UBUNTU_KEYBOARD_LIB_DIR}
lang_db_fr.files += $$TOP_BUILDDIR/database_fr.db

target.path = $${UBUNTU_KEYBOARD_LIB_DIR}
INSTALLS += target lang_db_fr

OTHER_FILES += \
    frenchplugin.json

LIBS += -L$${TOP_SRCDIR}/plugins/plugins/ -lwesternsupport

INCLUDEPATH += $$PWD/../../westernsupport
DEPENDPATH += $$PWD/../../westernsupport
