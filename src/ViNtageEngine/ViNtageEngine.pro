# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo
CONFIG += felgo-live
CONFIG += c++11

# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.emptyflow.games.vintageengine
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "7F5104BA551E8224556CA9A5500E9880A8BF95845B6319F4F94A93F39BA1048E8345D43281F683AFE95F9663A37238BDF279A0415289E1CA089E9DBE48E6BD0351B9D9ED677BBE238113FA1DE44D90BCA36DC460E030798D463C5D3D967248E5AB338192F00038F690B25C66B4A3097FC11058AE51ADB2F5DA4E481B9069DD52A3CF4B13FD006595921C9CABD8B2257EE2DC859D1AF29AC1DCD98D3094623D3E5C136001BDA420EAC7F1012D0567FB0E78B588AFDEDF0A984FE9BB42D5BE94F0DFFB4E153AC421283C180C8A9216950667C85896FFABC516192265CEFB32D98C721CC18599C5D2812384D442D7E8C6776F4AE98B28D0E58039EB931766EC0B161808D49A6D513F4B8F5E405D6DF0E327F6BF6E2BFB809FA10DA51A811BE95A75E19FFFF27A34C94BE0F6123153B6F45DDDB5E9AA2DB12DBF621829A9DCBDE6A8"

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
    globaloptions.cpp

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
    assets/background001.jpg \
    assets/background002.jpg \
    assets/background003.jpg \
    assets/squaby-sprite-walking.png \
    qml/Constants/SceneConstants.qml \
    qml/Objects/ActionSequence.qml \
    qml/Objects/ActionItem.qml \
    qml/Objects/Character.qml \
    qml/Objects/SelectableItem.qml \
    qml/Objects/SingleSelectOptions.qml \
    qml/Objects/TextRenderer.qml \
    qml/Scenes/GameplayScene.qml \
    qml/Scenes/MainMenuScene.qml

HEADERS += \
    gameoptions.h \
    globaloptions.h
