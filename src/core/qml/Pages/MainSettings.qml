import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Felgo 3.0
import "../Objects"

Item {
    id: root

    property bool isFullScreen: false
    property var windowModeNames: []
    property var languagesNames: []

    FillBackgroundImage {
        targetScene: mainmenuScene
        source: gameResources.basePath + "/secondmenu.png"
    }

    SettingsHeaderTabs {
        selectedTab: `mainsettings`
        scene: mainmenuScene
    }

    Rectangle {
        x: 60
        y: 100
        width: 700
        height: 460
        color: "#E3D7C5"
        opacity: .9
    }

    GridLayout {
        x: 60
        y: 100
        width: 500
        rows: 3
        columns: 2

        Text {
            Layout.topMargin: 6
            Layout.leftMargin: 10
            Layout.preferredHeight: 30
            Layout.row: 0
            Layout.column: 0
            Layout.alignment: Qt.AlignTop
            color: "#5C5349"
            font.pixelSize: 20
            text: `Window mode: `
        }

        SelectableBlocks {
            id: windowModeSelectableBlock
            Layout.leftMargin: 10
            Layout.topMargin: 6
            Layout.preferredHeight: 30
            Layout.row: 0
            Layout.column: 1
            Layout.alignment: Qt.AlignTop
            names: root.windowModeNames

            onSelected: {
                const isFullScreen = windowModeSelectableBlock.selectedName === root.windowModeNames[0];
                gameSettings.gameOptions.isFullScreen = isFullScreen;
                gameWindow.fullscreen = isFullScreen;
                saveFullScreenOption(isFullScreen);
            }
        }

        Text {
            Layout.topMargin: 6
            Layout.leftMargin: 10
            Layout.row: 1
            Layout.column: 0
            Layout.alignment: Qt.AlignTop
            color: "#5C5349"
            font.pixelSize: 20
            text: `Language: `
        }

        SelectableBlocks {
            id: languageSelectableBlock
            Layout.leftMargin: 10
            Layout.topMargin: 6
            Layout.preferredHeight: 30
            Layout.row: 1
            Layout.column: 1
            Layout.alignment: Qt.AlignTop
            names: root.languagesNames

            onSelected: {
                const language = (languageSelectableBlock.selectedName === root.languagesNames[0]) ? `en` : `ru`;
                gameSettings.gameOptions.language = language;
                saveLanguage(language);
            }
        }
    }

    function saveFullScreenOption(isFullScreen) {
        gameSettings.changeGameSettings(
            (options) => {
                options.isFullScreen = isFullScreen;
            }
        );
    }

    function saveLanguage(language) {
        gameSettings.changeGameSettings(
            (options) => {
                options.language = language;
            }
        );
    }

    Component.onCompleted: {
        root.windowModeNames = [`Fullscreen`, `Window`];
        root.languagesNames = [`English`, `Русский`];
        windowModeSelectableBlock.selectedName = gameSettings.gameOptions.isFullScreen ? root.windowModeNames[0] : root.windowModeNames[1];
        languageSelectableBlock.selectedName = gameSettings.gameOptions.language === `en` ? root.languagesNames[0] : root.languagesNames[1];
    }
}
