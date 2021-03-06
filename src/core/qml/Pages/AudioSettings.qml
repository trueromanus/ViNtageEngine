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

    SettingsHeaderTabs {
        selectedTab: `audiosettings`
        scene: mainmenuScene
    }

    Rectangle {
        x: 60
        y: 100
        width: 700
        height: 460
        color: "#E3D7C5"

        //Music volume

        Item {
            id: musicVolumeLabel
            anchors.top: parent.top
            anchors.topMargin: 6
            anchors.left: parent.left
            anchors.leftMargin: 10
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
            onMoved: {
                saveMusicVolume(value);
            }
        }

        //Speech volume

        Item {
            id: speechVolumeLabel
            anchors.top: musicVolumeSlider.bottom
            anchors.topMargin: 6
            anchors.left: parent.left
            anchors.leftMargin: 10
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
            onMoved: {
                saveSpeechVolume(value);
            }
        }

        //Effects volume

        Item {
            id: effectsLabel
            anchors.top: speechVolumeSlider.bottom
            anchors.topMargin: 6
            anchors.left: parent.left
            anchors.leftMargin: 10
            width: root.leftColumnSize
            Text {

                color: "#5C5349"
                font.pixelSize: 20
                text: "Sfx volume:"
            }
        }


        Slider {
            id: effectsSlider
            anchors.left: effectsLabel.right
            anchors.top: speechVolumeSlider.bottom
            width: root.rightColumnSize
            from: 0
            to: 100
            value: 100
            onMoved: {
                saveEffectsVolume(value);
            }
        }

    }

    function saveMusicVolume(value) {
        gameSettings.changeGameSettings(
            (options) => {
                options.musicVolume = value;
            }
        );
    }

    function saveSpeechVolume(value) {
        gameSettings.changeGameSettings(
            (options) => {
                options.speechVolume = value;
            }
        );
    }

    function saveEffectsVolume(value) {
        gameSettings.changeGameSettings(
            (options) => {
                options.effectsVolume = value;
            }
        );
    }

    Component.onCompleted: {
        musicVolumeSlider.value = gameSettings.gameOptions.musicVolume;
        speechVolumeSlider.value = gameSettings.gameOptions.speechVolume;
        effectsSlider.value = gameSettings.gameOptions.effectsVolume;
    }

}
