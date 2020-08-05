import QtQuick 2.12
import Felgo 3.0
import "../Objects"
import "../Constants"

Item {
    id: root

    FillBackgroundImage {
        targetScene: mainmenuScene
        source: gameResources.basePath + "/mainmenu.png"
    }

    ListModel {
        id: options
    }

    Rectangle {
        width: optionsContainer.width
        height: 300
        color: "#5C5349"
        opacity: .8
        anchors.centerIn: parent
    }

    Item {
        id: optionsContainer
        width: 340
        height: 300
        anchors.centerIn: parent

        SingleSelectOptions {
            id: singleOptions
            visible: true
            anchors.centerIn: parent
            width: optionsContainer.width
            height: 30 * options.count
            items: options
            onSelected: {
                switch (index) {
                    case 0:
                        gameWindow.activeScene.requestChangeScene(SceneConstants.gameplaySceneName);
                        break;
                    case 1:
                        mainmenuScene.changePage("../Pages/LoadSave.qml");
                        break;
                    case 2:
                        break;
                    case 3:
                        mainmenuScene.changePage("../Pages/MainSettings.qml");
                        break;
                    case 4:
                        Qt.quit();
                        break;
                }
            }

            SelectableItem {
                id: selectableItem
                width: optionsContainer.width
                height: 30
                itemIndex: modelData.index
                selectOptions: singleOptions

                Rectangle {
                    color: "transparent"
                    anchors.fill: parent
                    Text {
                        anchors.centerIn: parent
                        text: selectableItem.hovered ? "> " + modelData.text + " <" : modelData.text
                        font.pixelSize: 22
                        color: selectableItem.selected ? "black" : (selectableItem.hovered ? "white" : "#E3D7C5")
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
