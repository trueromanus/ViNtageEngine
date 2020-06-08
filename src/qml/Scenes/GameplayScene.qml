import QtQuick 2.12
import Felgo 3.0
import "../Constants"
import "../Objects"

GameScene {
    id: gameplayScene

    FillBackgroundImage {
        targetScene: gameplayScene
        source: "../../assets/background005.jpg"
    }

    /*ParallaxScrollingBackground {
        x: 100
        y: 100
        width: 300
        height: 300
        movementVelocity: Qt.point(10,0)
        ratio: Qt.point(1.0, 1.0)
        mirrorSecondImage: false
        sourceImage: "../../assets/felgo-logo.png"
    }*/

    Rectangle {
        x: 0
        y: 0
        width: 100
        height: 100

        MouseArea {
            anchors.fill: parent
            onPressed: {
                //gameplayScene.requestChangeScene(SceneConstants.mainMenuSceneName);
                textRenderer.renderText("I'am <font color='green'><b>bluherka</b></font> muherka <font color='#ff6666'>lapahuherka!!!!!!!</font> blablablab bla bla blalabllablab")
            }
        }
    }

    Rectangle {
        x: 300
        y: 0
        width: 100
        height: 100

        MouseArea {
            anchors.fill: parent
            onPressed: {
                textRenderer.renderTextToEnd();
            }
        }
    }


    Rectangle {
        x: 100
        y: 200
        width: 300
        height: 100
        color: "blue"
    }

    Character {
       x: 300
       y: 100
       spriteHeight: 400
       spriteWidth: 400
       spriteOpacity: 0.7
       frameCount: 4
       frameWidth: 900
       frameHeight: 900
       spriteImage: "../../assets/idle.png"
    }

    Character {
       x: 600
       y: 300
       spriteHeight: 150
       spriteWidth: 150
       spriteOpacity: 1
       frameCount: 4
       frameWidth: 128
       frameHeight: 128
       spriteImage: "../../assets/creature2.png"
    }

    FontLoader {
        id: immortalFont
        source: "../../assets/Fonts/Brushed.ttf"
    }

    TextRenderer {
        id: textRenderer
        x: 100
        y: 200
        width: 300
        height: 100
        renderInterval: 80
        fontPixelSize: 18
        fontFamily: immortalFont.name
        onTextRendered: {
            console.log("Text rendered!!!!");
        }
    }

    Rectangle {
        x: 0
        y: SceneConstants.sceneHeight - 100
        width: 100
        height: 100

        MouseArea {
            anchors.fill: parent
            onPressed: {
                gameWindow.fullscreen = !gameWindow.fullscreen;
            }
        }
    }

}
