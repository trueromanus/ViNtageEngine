import Felgo 3.0
import QtQuick 2.12
import Vintage 1.0
import "Scenes"
import "Constants"
import "Objects"

GameWindow {
    id: gameWindow
    licenseKey: "5E7A21F8CD1F8B7646B6821A59C3B3B9204B2ED31B693A26C8E2AB0970B83FD3528281D9A2EDBA3D2D6F48228D697577C20967F08C5C2132E6BB0713C1246B5F6A0A19A7CAC8BD648E15C9D44FFA4E89ADA4F6227BDAF31ADA94960BFE30720DB8E2F05E1700C3BEE50CFF4B75836EB1F945F134A4EC8DB078AFD8DFB9CC221414DA26FF796EE4B08AB8D700165721EAC0E72C1C6F6429DC0698458A8E90B127D9080014ACA0E8C2F854EFAAC9350C0C01E03782B49A340E6C0E5A02F05CC03EB9CCCD0C3E7453F2F545860DDF0752F525D09D356D6E52D02DD633BDA8BF6AA0E8EEC812BC034AFEB03472DA33EC457096769E7264CDFC3F41DDD6928E504C3ADB3955C1AD570F06989D14E0B7F3899EDBF9D8C2B7A88766855B30DCCD77D2EDBE70F61D32069B252D2075AE6199A0173DF82FADCEDE757B54FD3D66686033D6"
    screenWidth: SceneConstants.sceneWidth
    screenHeight: SceneConstants.sceneHeight
    scaleMode: "letterbox"
    menuBarFelgoEnabled: false

    property string newScene

    FontLoader {
        id: bloodyFont
        source: gameResources.basePath + "/fonts/Bloody/BLOODY.ttf"
    }

    EntityManager {
        id: entityManager
    }

    GameSettings {
        id: gameSettings
        onFillDefaultSettings: {
            defaultOptions.screenResolution = `1920x1080`;
            defaultOptions.isFullScreen = true;
            defaultOptions.textPanelOpacity = 100;
            defaultOptions.autoModeTextSpeed = 60;
            defaultOptions.autoModeSkipTimer = 3;
            defaultOptions.textSpeed = 60;
            defaultOptions.language = `en`;
            defaultOptions.musicVolume = 100;
            defaultOptions.speechVolume = 100;
            defaultOptions.effectsVolume = 100;
        }
        onLoaded: {
            if (gameSettings.gameOptions.isFullScreen) gameWindow.fullscreen = true;
        }
    }

    GameSaves {
        id: gameOptions
        screenshootTarget: scenes
    }

    LocalResources {
        id: gameResources
    }

    Timer {
        id: changeSceneTimer
        interval: 100
        running: false
        onTriggered: {
            const scene = newScene;
            newScene = "";
            changeScene(scene);
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Item {
        id: scenes
        anchors.fill: parent

        MainMenuScene {
            id: mainMenuScene
            onRequestChangeScene: requestChangeState(name)
        }

        GameplayScene {
            id: gameplayScene
            onRequestChangeScene: requestChangeState(name)
        }
    }

    function getScene(name){
        switch (name) {
            case SceneConstants.mainMenuSceneName: return mainMenuScene;
            case SceneConstants.gameplaySceneName: return gameplayScene;
        }
    }

    function requestChangeState(name) {
        console.log(name);
        newScene = name;
        changeSceneTimer.start();
    }

    function changeScene(name) {
        if (activeScene) {
            activeScene.opacity = 0;
            activeScene.visible = false;
            activeScene.focus = false;
            activeScene.enabled = false;
        }

        var nextScene = getScene(name);
        activeScene = nextScene;
        nextScene.opacity = 1;
        nextScene.visible = true;
        nextScene.focus = true;
        nextScene.enabled = true;
    }

    Component.onCompleted: {
        changeScene(SceneConstants.mainMenuSceneName);
    }

}
