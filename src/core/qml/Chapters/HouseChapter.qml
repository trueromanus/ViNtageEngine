import QtQuick 2.0
import Felgo 3.0
import "../Objects"

Item {

    //black box background
    Rectangle {
        anchors.fill: gameScene.gameWindowAnchorItem
        color: "black"
    }

    //interactive background
    FillBackgroundImage {
        id: mainBackground
        targetScene: gameScene
        source: gameResources.basePath + "/test111.jpg"
    }

}
