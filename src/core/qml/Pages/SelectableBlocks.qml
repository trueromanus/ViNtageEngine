import QtQuick 2.12

Row {
    id: root
    spacing: 4

    property var names: []
    property string selectedName
    property bool hovered

    signal selected(int index)

    Repeater {
        model: names

        Rectangle {
            width: 160
            height: 30
            color: "transparent"
            border.color: "#6C6358"
            border.width: root.selectedName === modelData ? 2 : 0

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: root.hovered ? Qt.PointingHandCursor : Qt.ArrowCursor
                onPressed: {
                    root.selectedName = modelData;
                    selected(modelData);
                }
                onEntered: {
                    if (root.selectedName === modelData) return;

                    root.hovered = true;
                }
                onExited: {
                    if (root.selectedName === modelData) return;

                    root.hovered = false;
                }
            }

            Text {
                text: modelData
                color: root.selectedName === modelData ? "#6C6358" : "#A3917C"
                font.pixelSize: 16
                anchors.centerIn: parent
            }
        }
    }
}
