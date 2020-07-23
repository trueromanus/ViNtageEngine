import QtQuick 2.12
import Felgo 3.0
import "../Constants"
import "../Objects"

import QtWebSockets 1.0

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

    WebSocket {
        id: socket
        url: "ws://localhost:5000/ws"
        onTextMessageReceived: {
            console.log("Received message: " + message);
        }
        onStatusChanged: {
            if (socket.status == WebSocket.Error) {
                 console.log("Error: " + socket.errorString);
             } else if (socket.status == WebSocket.Open) {
                 socket.sendTextMessage("Hello World")
             } else if (socket.status == WebSocket.Closed) {
                 console.log("Socket closed");
             }
        }
        active: true
    }

}
