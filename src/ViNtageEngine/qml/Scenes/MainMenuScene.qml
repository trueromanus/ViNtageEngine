import QtQuick 2.12
import Felgo 3.0
import "../Constants"
import "../Objects"
import "../ShaderEffects"

GameScene {
    id: mainmenuScene

    FillBackgroundImage {
        targetScene: mainmenuScene
        source: "../../assets/test111.jpg"
    }

    Image {
        id: sourceImage
        width: 200
        height: 200
        visible: false
        source: "../../assets/background003.jpg"
    }

    Image {
        id: noiseImage
        width: 200
        height: 200
        visible: false
        source: "../../assets/noise.jpg"
    }

    /*NumberAnimation {
        target: effect3
        property: "sharpen"
        duration: 600
        easing.type: Easing.InOutQuad
        loops: Animation.Infinite
        from: 0
        to: 1
        Component.onCompleted: {
            start();
        }
    }*/

    OldMovieImageEffect {
        id: effect3
        x: 200
        y: 200
        width: 500
        height: 300
        source: sourceImage
        sourceNoise: noiseImage
    }

    Rectangle {
        x: 100
        y: 100
        width: 100
        height: 100
        color: "white"

        MouseArea {
            anchors.fill: parent
            onPressed: {
                mainmenuScene.requestChangeScene(SceneConstants.gameplaySceneName);
                /*gameSettings.gameOptions.textSpeed = 70;
                gameSettings.saveGameSettings();

                gameSettings.changeGameSettings(
                    (options) => {
                        options.textSpeed = 80;
                    }
                );*/
            }
        }
    }

    Rectangle {
        x: 0
        y: SceneConstants.sceneHeight - 140
        width: SceneConstants.sceneWidth
        height: 140
        opacity: .6
        color: "black"

        MouseArea {
            anchors.fill: parent
            onPressed: {
                //gameWindow.fullscreen = !gameWindow.fullscreen;
                if (textRenderer.textShowedToEnd) {
                    actionSequence.runNextAction(-1);
                } else {
                    textRenderer.renderTextToEnd();
                }
            }
        }
    }

    Character {
       id: idleCharacter
       visible: false
       x: 300
       y: 100
       spriteHeight: 400
       spriteWidth: 400
       spriteOpacity: 0.7
       frameCount: 4
       frameWidth: 900
       frameHeight: 900
       frameRate: 6

       Sprite {
           source: "../../assets/idle.png"
       }
    }

    Character {
       id: creatureCharacter
       visible: false
       x: 600
       y: 300
       spriteHeight: 150
       spriteWidth: 150
       spriteOpacity: 1
       frameCount: 4
       frameWidth: 128
       frameHeight: 128
       frameRate: 6

       Sprite {
           source: "../../assets/creature2.png"
       }
    }

    TextRenderer {
        id: textRenderer
        x: 50
        y: SceneConstants.sceneHeight - 130
        width: SceneConstants.sceneWidth - 80
        height: 120
        renderInterval: 60
        fontPixelSize: 18
    }

    ListModel {
        id: options
    }

    Item {
        id: optionsContainer
        visible: false
        width: singleOptions.width
        height: singleOptions.height
        anchors.centerIn: mainmenuScene.gameWindowAnchorItem

        Rectangle {
            width: singleOptions.width
            height: singleOptions.height
            color: "black"
            opacity: .4
        }

        SingleSelectOptions {
            id: singleOptions
            visible: true
            width: 400
            height: 90
            items: options
            onSelected: {
                actionSequence.runNextAction(-1);
            }

            SelectableItem {
                id: muher
                width: 400
                height: 30
                itemIndex: modelData.index
                selectOptions: singleOptions

                Rectangle {
                    color: "transparent"
                    anchors.fill: parent
                    Text {
                        anchors.centerIn: parent
                        text: modelData.text
                        font.pixelSize: 18
                        color: muher.selected ? "black" : (muher.hovered ? "yellow" : "white")
                    }
                }
            }
        }
    }


    ActionSequence {
        id: actionSequence

        TextRendererActionItem {
            target: textRenderer
            text: "Blablalba blublublulbu mrumrumru bluhrueaksdhfkashdkfjaskdf"
        }

        ActionItem {
            onActivated: {
                idleCharacter.visible = true;
            }
            onDeactivated: {
                idleCharacter.visible = false;
            }
        }

        ActionItem {
            onActivated: {
                creatureCharacter.visible = true;
            }
            onDeactivated: {
                creatureCharacter.visible = false;
            }
        }

        ActionItem {
            onActivated: {
                optionsContainer.visible = true;
            }
            onNeedRepeated: {
                result.repeated = !singleOptions.selectedIndexes.length;
            }
            onDeactivated: {
                optionsContainer.visible = false;
            }
        }


    }


    Component.onCompleted: {
        options.append({ model: { text: "bluher1", index: 0 }});
        options.append({ model: { text: "bluh2", index: 1 }});
        options.append({ model: { text: "bluh334545", index: 2 }});
    }
}
