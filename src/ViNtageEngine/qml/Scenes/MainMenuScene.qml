import QtQuick 2.12
import Felgo 3.0
import "../Constants"
import "../Objects"

GameScene {
    id: mainmenuScene

    FillBackgroundImage {
        targetScene: mainmenuScene
        source: "../../assets/test111.jpg"
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
            }
        }
    }

    ListModel {
        id: options
    }

    SingleSelectOptions {
        id: singleOptions
        x: 200
        y: 100
        width: 100
        height: 300
        items: options

        SelectableItem {
            id: muher
            width: 100
            height: 30
            itemIndex: modelData.index
            selectOptions: singleOptions

            Rectangle {
                anchors.fill: parent
                color: muher.selected ? "blue" : "red"
                Text {
                    text: modelData.text
                }
            }
        }
    }

    Rectangle {
        x: 0
        y: SceneConstants.sceneHeight - 100
        width: 100
        height: 100

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
       spriteImage: "../../assets/idle.png"
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
       spriteImage: "../../assets/creature2.png"
    }

    TextRenderer {
        id: textRenderer
        x: 100
        y: 200
        width: 300
        height: 100
        renderInterval: 80
        fontPixelSize: 18
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
    }


    Component.onCompleted: {
        options.append({ model: { text: "bluher1", index: 0 }});
        options.append({ model: { text: "bluh2", index: 1 }});
        options.append({ model: { text: "bluh334545", index: 2 }});
    }
}
