import QtQuick 2.12
import Felgo 3.0
import "../Constants"

Scene {
    enabled: false
    visible: false
    opacity: 0
    property string sceneName
    readonly property bool isActivated: false

    signal sceneChanged(string newSceneName)
    signal sceneActivated()
    signal sceneDeactivated()
    signal requestChangeScene(string name)

    onSceneChanged: {
        if (newSceneName === sceneName) {
            sceneActivated();
            isActivated = true;
        } else {
            if (isActivated) {
                isActivated = false;
                sceneDeactivated();
            }
        }
    }

    width: SceneConstants.sceneWidth
    height: SceneConstants.sceneHeight

}
