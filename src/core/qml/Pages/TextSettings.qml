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
        source: gameResources.basePath + "/matrixmenu2.png"
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

    Text {
        anchors.left: mainSettingsLabel.right
        x: 60
        y: 10
        color: "white"
        font.pixelSize: 30
        text: "Text settings"
    }

    Rectangle {
        x: 60
        y: 100
        width: 700
        height: 400
        color: "black"

        //text panel opacity

        Item {
            id: textPanelOpacityLabel
            anchors.top: parent.top
            anchors.topMargin: 6
            width: root.leftColumnSize
            Text {

                color: "white"
                font.pixelSize: 20
                text: "Text panel opacity:"
            }
        }


        Slider {
            id: opacitySlider
            anchors.left: textPanelOpacityLabel.right
            width: root.rightColumnSize
            from: 0
            to: 100
            value: 100
        }

        //text speed

        Item {
            id: textSpeedLabel
            anchors.top: opacitySlider.bottom
            anchors.topMargin: 6
            width: root.leftColumnSize
            Text {

                color: "white"
                font.pixelSize: 20
                text: "Text speed:"
            }
        }

        Slider {
            id: textSpeedSlider
            anchors.left: textSpeedLabel.right
            anchors.top: opacitySlider.bottom
            width: root.rightColumnSize
            from: 0
            to: 100
            value: 50
        }

        //auto mode speed

        Item {
            id: autoSpeedLabel
            anchors.top: textSpeedSlider.bottom
            anchors.topMargin: 6
            width: root.leftColumnSize
            Text {

                color: "white"
                font.pixelSize: 20
                text: "Auto mode speed:"
            }
        }


        Slider {
            id: autoSpeedSlider
            anchors.left: autoSpeedLabel.right
            anchors.top: textSpeedSlider.bottom
            width: root.rightColumnSize
            from: 0
            to: 100
            value: 50
        }

        //auto mode skip timer speed

        Item {
            id: autoSkipTimerSpeedLabel
            anchors.top: autoSpeedSlider.bottom
            anchors.topMargin: 6
            width: root.leftColumnSize
            Text {

                color: "white"
                font.pixelSize: 20
                text: "Auto mode skip timer (in seconds):"
            }
        }


        Slider {
            id: autoSkipTimerSpeedSlider
            anchors.left: autoSkipTimerSpeedLabel.right
            anchors.top: autoSpeedSlider.bottom
            width: root.rightColumnSize
            from: 0
            stepSize: 1
            to: 20
            value: 20
        }
    }


    //skip read text or full text ???

    //cancel auto mode after clicking
}
