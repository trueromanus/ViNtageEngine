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
                gameWindow.fullscreen = !gameWindow.fullscreen;
            }
        }
    }

    Component.onCompleted: {
        options.append({ model: { text: "bluher1", index: 0 }});
        options.append({ model: { text: "bluh2", index: 1 }});
        options.append({ model: { text: "bluh334545", index: 2 }});
    }
}
