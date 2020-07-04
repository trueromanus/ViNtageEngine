import QtQuick 2.12
import Felgo 3.0
import "../Objects"

Item {
    id: root

    FillBackgroundImage {
        targetScene: mainmenuScene
        source: "../../assets/background005.jpg"
    }

    Rectangle {
        width: 200
        height: 200
        color: "transparent"
        anchors.left: parent.left
        anchors.top: parent.top

        MouseArea {
            anchors.fill: parent
            onPressed: {
                root.parent.parent.changePage("../Pages/MainMenu.qml")
            }
        }

        Text {
            text: "< Back"
        }
    }

}
