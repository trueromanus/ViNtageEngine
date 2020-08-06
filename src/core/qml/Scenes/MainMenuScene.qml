import QtQuick 2.12
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
