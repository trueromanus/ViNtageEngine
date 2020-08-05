import QtQuick 2.12

Rectangle {
    id: root
    width: 200
    height: 50
    color: root.selected ? "#82796C" : (root.hovered ? "#5C5349" : "#4D443B")

    property alias title: titleText.text
    property bool selected: false
    property bool hovered: false

    signal select()

    MouseArea {
        anchors.fill: parent
        cursorShape: root.hovered ? Qt.PointingHandCursor : Qt.ArrowCursor
        hoverEnabled: true
        onPressed: {
           if (root.selected) return;

           select();
        }
        onEntered: {
            if (root.selected) return;

            root.hovered = true;
        }
        onExited: {
            if (root.selected) return;

            root.hovered = false;
        }
    }

    Text {
        id: titleText
        anchors.centerIn: parent
        font.pixelSize: 24
        color: root.selected ? "#C3B4A0" : (root.hovered ? "white" : "#E3D7C5")
    }
}
