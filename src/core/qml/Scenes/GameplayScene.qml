import QtQuick 2.12
import Felgo 3.0
import "../Constants"
import "../Objects"

GameScene {
    id: gameScene

    property bool gamePaused: false



    //main click area for to go to the next step
    MouseArea {
        x: 0
        y: 0
        width: SceneConstants.sceneWidth
        height: SceneConstants.sceneHeight
        onPressed: {
            actionSequence.runNextAction(-1);
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

    // background for text panel
    Rectangle {
        id: textPanel
        color: "#5C5349"
        anchors.horizontalCenter: gameScene.gameWindowAnchorItem.horizontalCenter
        width: SceneConstants.sceneWidth - 80
        height: 120
        border.color: "#5C5349"
        border.width: 1
        radius: 10
    }

    // main text renderer, draw above text panel
    TextRenderer {
        id: textRenderer
        anchors.horizontalCenter: gameScene.gameWindowAnchorItem.horizontalCenter
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
        anchors.centerIn: gameScene.gameWindowAnchorItem

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
