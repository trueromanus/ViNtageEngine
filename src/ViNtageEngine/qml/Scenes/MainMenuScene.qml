import QtQuick 2.12
import Felgo 3.0
import "../Constants"
import "../Objects"

GameScene {
    id: mainmenuScene

    signal changePage(string path)

    Loader {
        id: loader
        anchors.fill: parent
        source: "../Pages/MainMenu.qml"
    }

    onChangePage: {
        loader.source = path;
    }

}
