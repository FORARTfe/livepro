#-----------------------------------------------------------
#
# Project created by NecessitasQtCreator 2011-12-28T17:00:49
#
#-----------------------------------------------------------

DEPENDPATH += .
INCLUDEPATH += .

# For some reason, Necessitas isn't adding the proper include path for qtmultimediakit automatically
INCLUDEPATH += C:\Users\JosiahBryan\Devel\necessitas\Android\Qt\480\armeabi\include\QtMultimediaKit

# Input
HEADERS += \
	MainWindow.h
SOURCES += main.cpp \
	MainWindow.cpp

# The core of the actual app
include(../switchmon.pri)

# switchmon.pri uses multimedia (older ver of Qt that I'm using onmy desktop)
QT -= multimedia
QT += multimediakit

QT += core gui

#
# The rest of this project file was automatically created by Necessitas creator
#

TARGET = LiveProSwitchMonAndroid
TEMPLATE = app

CONFIG += mobility
MOBILITY = 

symbian {
    TARGET.UID3 = 0xe3f95146
    # TARGET.CAPABILITY += 
    TARGET.EPOCSTACKSIZE = 0x14000
    TARGET.EPOCHEAPSIZE = 0x020000 0x800000
}

OTHER_FILES += \
    android/AndroidManifest.xml \
    android/res/drawable/icon.png \
    android/res/drawable/logo.png \
    android/res/drawable-hdpi/icon.png \
    android/res/drawable-ldpi/icon.png \
    android/res/drawable-mdpi/icon.png \
    android/res/layout/splash.xml \
    android/res/values/libs.xml \
    android/res/values/strings.xml \
    android/res/values-de/strings.xml \
    android/res/values-el/strings.xml \
    android/res/values-es/strings.xml \
    android/res/values-et/strings.xml \
    android/res/values-fa/strings.xml \
    android/res/values-fr/strings.xml \
    android/res/values-id/strings.xml \
    android/res/values-it/strings.xml \
    android/res/values-ja/strings.xml \
    android/res/values-ms/strings.xml \
    android/res/values-nb/strings.xml \
    android/res/values-nl/strings.xml \
    android/res/values-pl/strings.xml \
    android/res/values-pt-rBR/strings.xml \
    android/res/values-ro/strings.xml \
    android/res/values-rs/strings.xml \
    android/res/values-ru/strings.xml \
    android/res/values-zh-rCN/strings.xml \
    android/res/values-zh-rTW/strings.xml \
    android/src/org/kde/necessitas/ministro/IMinistro.aidl \
    android/src/org/kde/necessitas/ministro/IMinistroCallback.aidl \
    android/src/org/kde/necessitas/origo/QtActivity.java \
    android/src/org/kde/necessitas/origo/QtApplication.java \
    android/version.xml


