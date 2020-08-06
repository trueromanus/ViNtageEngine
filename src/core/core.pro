# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo
CONFIG += felgo-live
CONFIG += c++11

# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.emptyflow.games.peaceandquietlife
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "5E7A21F8CD1F8B7646B6821A59C3B3B9204B2ED31B693A26C8E2AB0970B83FD3528281D9A2EDBA3D2D6F48228D697577C20967F08C5C2132E6BB0713C1246B5F6A0A19A7CAC8BD648E15C9D44FFA4E89ADA4F6227BDAF31ADA94960BFE30720DB8E2F05E1700C3BEE50CFF4B75836EB1F945F134A4EC8DB078AFD8DFB9CC221414DA26FF796EE4B08AB8D700165721EAC0E72C1C6F6429DC0698458A8E90B127D9080014ACA0E8C2F854EFAAC9350C0C01E03782B49A340E6C0E5A02F05CC03EB9CCCD0C3E7453F2F545860DDF0752F525D09D356D6E52D02DD633BDA8BF6AA0E8EEC812BC034AFEB03472DA33EC457096769E7264CDFC3F41DDD6928E504C3ADB3955C1AD570F06989D14E0B7F3899EDBF9D8C2B7A88766855B30DCCD77D2EDBE70F61D32069B252D2075AE6199A0173DF82FADCEDE757B54FD3D66686033D6"

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

RESOURCES += #    resources.qrc # uncomment for publishing

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    gameoptions.cpp \
    globaloptions.cpp \
    localresources.cpp

android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}
macx {
    ICON = macx/app_icon.icns
}

DISTFILES += \
    qml/Constants/SceneConstants.qml \
    qml/Objects/ActionSequence.qml \
    qml/Objects/ActionItem.qml \
    qml/Objects/Character.qml \
    qml/Objects/SelectableItem.qml \
    qml/Objects/SingleSelectOptions.qml \
    qml/Objects/TextRenderer.qml \
    qml/Scenes/GameplayScene.qml \
    qml/Scenes/MainMenuScene.qml \
    qml/Pages/SettingsHeaderTabs.qml \
    qml/Pages/SettingsHeaderTab.qml \
    qml/Pages/SelectableBlocks.qml

HEADERS += \
    gameoptions.h \
    globaloptions.h \
    localresources.h
