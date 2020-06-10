import Felgo 3.0
import QtQuick 2.12
import "Scenes"
import "Constants"

GameWindow {
    id: gameWindow
    //licenseKey: "7F5104BA551E8224556CA9A5500E9880A8BF95845B6319F4F94A93F39BA1048E8345D43281F683AFE95F9663A37238BDF279A0415289E1CA089E9DBE48E6BD0351B9D9ED677BBE238113FA1DE44D90BCA36DC460E030798D463C5D3D967248E5AB338192F00038F690B25C66B4A3097FC11058AE51ADB2F5DA4E481B9069DD52A3CF4B13FD006595921C9CABD8B2257EE2DC859D1AF29AC1DCD98D3094623D3E5C136001BDA420EAC7F1012D0567FB0E78B588AFDEDF0A984FE9BB42D5BE94F0DFFB4E153AC421283C180C8A9216950667C85896FFABC516192265CEFB32D98C721CC18599C5D2812384D442D7E8C6776F4AE98B28D0E58039EB931766EC0B161808D49A6D513F4B8F5E405D6DF0E327F6BF6E2BFB809FA10DA51A811BE95A75E19FFFF27A34C94BE0F6123153B6F45DDDB5E9AA2DB12DBF621829A9DCBDE6A8"
    screenWidth: SceneConstants.sceneWidth
    screenHeight: SceneConstants.sceneHeight
    scaleMode: "letterbox"
    menuBarFelgoEnabled:false

    property string newScene

    EntityManager {
        id: entityManager
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

    MainMenuScene {
        id: mainMenuScene
        onRequestChangeScene: requestChangeState(name)
    }

    GameplayScene {
        id: gameplayScene
        onRequestChangeScene: requestChangeState(name)
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
