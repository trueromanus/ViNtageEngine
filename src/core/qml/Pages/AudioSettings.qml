import QtQuick 2.12
import QtQuick.Controls 2.12
import Felgo 3.0
import "../Objects"

Item {
    id: root

    readonly property real leftColumnSize: 300
    readonly property real rightColumnSize: 300

    FillBackgroundImage {
        targetScene: mainmenuScene
        source: gameResources.basePath + "/secondmenu.png"
    }

    Item {
        id: mainSettingsLabel
        y: 10
        width: 200
        height: 40

        MouseArea {
            anchors.fill: parent
            onPressed: {
                mainmenuScene.changePage("../Pages/MainSettings.qml");
            }
        }

        Text {
            anchors.centerIn: parent
            color: "red"
            font.pixelSize: 30
            text: "Main settings"
        }
    }

    Item {
        id: textSettingsLabel
        anchors.left: mainSettingsLabel.right
        y: 10
        width: 200
        height: 40

        MouseArea {
            anchors.fill: parent
            onPressed: {
                mainmenuScene.changePage("../Pages/TextSettings.qml");
            }
        }

        Text {
            anchors.centerIn: parent
            color: "red"
            font.pixelSize: 30
            text: "Text settings"
        }
    }

    Text {
        anchors.left: textSettingsLabel.right
        x: 60
        y: 10
        color: "white"
        font.pixelSize: 30
        text: "Audio settings"
    }

    Rectangle {
        x: 60
        y: 100
        width: 700
        height: 400
        color: "#E3D7C5"

        //Music volume

        Item {
            id: musicVolumeLabel
            anchors.top: parent.top
            anchors.topMargin: 6
            width: root.leftColumnSize
            Text {
                color: "#5C5349"
                font.pixelSize: 20
                text: "Music volume:"
            }
        }


        Slider {
            id: musicVolumeSlider
            anchors.left: musicVolumeLabel.right
            width: root.rightColumnSize
            from: 0
            to: 100
            value: 100
        }

        //Speech volume

        Item {
            id: speechVolumeLabel
            anchors.top: musicVolumeSlider.bottom
            anchors.topMargin: 6
            width: root.leftColumnSize
            Text {

                color: "#5C5349"
                font.pixelSize: 20
                text: "Speech volume:"
            }
        }

        Slider {
            id: speechVolumeSlider
            anchors.left: speechVolumeLabel.right
            anchors.top: musicVolumeSlider.bottom
            width: root.rightColumnSize
            from: 0
            to: 100
            value: 100
        }

        //Effects volume

        Item {
            id: effectsLabel
            anchors.top: speechVolumeSlider.bottom
            anchors.topMargin: 6
            width: root.leftColumnSize
            Text {

                color: "#5C5349"
                font.pixelSize: 20
                text: "Sfx volume:"
            }
        }


        Slider {
            id: autoSpeedSlider
            anchors.left: effectsLabel.right
            anchors.top: speechVolumeSlider.bottom
            width: root.rightColumnSize
            from: 0
            to: 100
            value: 100
        }

    }

}
