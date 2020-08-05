import QtQuick 2.12

Item {
    id: root
    y: 10
    x: 0
    width: scene.width
    height: 100
    property var scene
    property string selectedTab

    Row {
        anchors.left: parent.left
        anchors.leftMargin: 10
        spacing: 8

        SettingHeaderTab {
            title: "Main"
            selected: root.selectedTab === `mainsettings`
            onSelect: {
                mainmenuScene.changePage("../Pages/MainSettings.qml");
            }
        }

        SettingHeaderTab {
            title: "Text"
            selected: root.selectedTab === `textsettings`
            onSelect: {
                mainmenuScene.changePage("../Pages/TextSettings.qml");
            }
        }

        SettingHeaderTab {
            title: "Audio"
            selected: root.selectedTab === `audiosettings`
            onSelect: {
                mainmenuScene.changePage("../Pages/AudioSettings.qml");
            }
        }
    }

    SettingHeaderTab {
        anchors.right: parent.right
        anchors.rightMargin: 10
        title: " < Back to menu"
        selected: false
        onSelect: {
            console.log("Yaha")
            mainmenuScene.changePage("../Pages/MainMenu.qml");
        }
    }

}
