import QtQuick 2.12

Rectangle {
    id: root
    color: "transparent"
    default property alias content: innerContainer.children
    property int itemIndex: -1
    property bool selected: false
    property var selectOptions

    signal clicked(int index)

    MouseArea {
        anchors.fill: parent
        onPressed: {
            root.clicked(root.itemIndex);
            root.selectOptions.setSelected(root.itemIndex);
        }
    }

    Rectangle {
        id: innerContainer
        anchors.fill: parent
    }

}
