import QtQuick 2.12

Rectangle {
    id: root
    color: "transparent"
    default property alias content: innerContainer.children
    property int itemIndex: -1
    property bool selected: selectOptions.selectedIndexes.filter(a => a === modelData.index).length > 0
    property var selectOptions
    property bool hovered: false


    signal clicked(int index)

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onPressed: {
            root.clicked(root.itemIndex);
            root.selectOptions.setSelected(root.itemIndex);
        }
        onEntered: {
            root.hovered = true;
        }
        onExited: {
            root.hovered = false;
        }
    }

    Rectangle {
        id: innerContainer
        anchors.fill: parent
        color: "transparent"
    }

}
