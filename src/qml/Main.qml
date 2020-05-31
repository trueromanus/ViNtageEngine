import Felgo 3.0
import QtQuick 2.0
import "Scenes"
import "Constants"

GameWindow {
    id: gameWindow
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"
    screenWidth: SceneConstants.sceneWidth
    screenHeight: SceneConstants.sceneHeight
    scaleMode: "zoomToBiggerSide" //"letterbox"// "zoomNonUniform"
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
