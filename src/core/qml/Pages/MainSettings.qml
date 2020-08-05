import QtQuick 2.12
import QtQuick.Controls 2.12
import Felgo 3.0
import "../Objects"

Item {
    id: root

    property bool isFullScreen: false

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
        width: 500
        height: 300
        color: "black"

        Text {
            id: windowModeLabel
            color: "white"
            font.pixelSize: 20
            text: "Window mode:"
        }

        Rectangle {
            id: fullscreenButton
            anchors.left: windowModeLabel.right
            anchors.leftMargin: 10
            width: 140
            height: 24
            border.width: root.isFullScreen ? 2 : 0
            border.color: "red"

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    root.isFullScreen = true;
                    gameWindow.fullscreen = true;
                    saveFullScreenOption(true);
                }
            }

            Text {
                anchors.centerIn: parent
                font.pixelSize: 14
                text: "Fullscreen"
            }
        }
        Rectangle {
            anchors.left: fullscreenButton.right
            anchors.leftMargin: 6
            width: 140
            height: 24
            border.width: !root.isFullScreen ? 2 : 0
            border.color: "red"

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    root.isFullScreen = false;
                    gameWindow.fullscreen = false;
                    saveFullScreenOption(false);
                }
            }

            Text {
                anchors.centerIn: parent
                font.pixelSize: 14
                text: "Window"
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
}
