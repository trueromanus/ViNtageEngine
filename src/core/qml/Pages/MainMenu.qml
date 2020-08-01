import QtQuick 2.12
import Felgo 3.0
import "../Objects"
import "../Constants"

Item {
    id: root

    FillBackgroundImage {
        targetScene: mainmenuScene
        source: "../../assets/test111.jpg"
    }

    ListModel {
        id: options
    }

    Item {
        id: optionsContainer
        width: singleOptions.width
        height: singleOptions.height
        anchors.centerIn: parent

        SingleSelectOptions {
            id: singleOptions
            visible: true
            width: 400
            height: 90
            items: options
            onSelected: {
                switch (index) {
                    case 0:
                        //new game
                        gameWindow.activeScene.requestChangeScene(SceneConstants.gameplaySceneName);
                        break;
                    case 1:
                        root.parent.parent.changePage("../Pages/LoadSave.qml");
                        break;
                    case 2:
                        break;
                    case 3:
                        root.parent.parent.changePage("../Pages/MainSettings.qml");
                        break;
                    case 4:
                        Qt.quit();
                        break;
                }
            }

            SelectableItem {
                id: selectableItem
                width: 400
                height: 30
                itemIndex: modelData.index
                selectOptions: singleOptions

                Rectangle {
                    color: "transparent"
                    anchors.fill: parent
                    Text {
                        anchors.centerIn: parent
                        text: selectableItem.hovered ? "> " + modelData.text + " <" : modelData.text
                        font.pixelSize: 20
                        color: selectableItem.selected ? "black" : (selectableItem.hovered ? "yellow" : "white")
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        options.append({ model: { text: "New game", index: 0 }});
        options.append({ model: { text: "Load game", index: 1 }});
        options.append({ model: { text: "Gallery", index: 2 }});
        options.append({ model: { text: "Settings", index: 3 }});
        options.append({ model: { text: "Exit", index: 4 }});
    }
}
