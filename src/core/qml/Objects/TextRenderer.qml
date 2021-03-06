import QtQuick 2.12
import Felgo 3.0
import QtGraphicalEffects 1.0

EntityBase {
    id: textRenderer
    entityType: "textRenderer"
    property alias renderInterval: renderTimer.interval
    property string fullText: ""
    property string showedText: ""
    property bool textShowedToEnd: true
    property alias fontPixelSize: textArea.font.pixelSize
    property alias fontFamily: textArea.font.family
    property bool showShadow: true

    signal renderText(string text)
    signal renderTextToEnd()
    signal textRendered()
    signal reset()

    Timer {
        id: renderTimer
        running: false
        repeat: true
        onTriggered: {
            const length = textRenderer.showedText.length;
            if (length === textRenderer.fullText.length) {
                renderTimer.stop();
                textRendered();
                textRenderer.textShowedToEnd = true;
            }

            const nextChar = textRenderer.fullText.charAt(length);
            if (nextChar !== "<") {
                textRenderer.showedText += nextChar;
            } else {
                let currentTag = "";
                for (let i = length; i < textRenderer.fullText.length; i++) {
                    const tagChar = textRenderer.fullText.charAt(i);
                    currentTag += tagChar;
                    textRenderer.showedText += tagChar;
                    if (tagChar === ">") break;
                }
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Text {
            id: textArea
            width: parent.width
            height: parent.height
            color: "white"
            text: textRenderer.showedText
            elide: Text.ElideRight
            antialiasing: false
            wrapMode: Text.WordWrap

            layer.enabled: textRenderer.showShadow
            layer.effect: DropShadow {
                verticalOffset: 1.4
                horizontalOffset: 1.4
                color: "black"
                radius: 1
                samples: 5
            }
        }

    }

    onRenderText: {
        textRenderer.fullText = text;
        textRenderer.showedText = "";
        textRenderer.textShowedToEnd = false;
        renderTimer.start();
    }

    onRenderTextToEnd: {
        renderTimer.stop();
        textRenderer.showedText = textRenderer.fullText;
        textRenderer.textShowedToEnd = true;

        textRendered();
    }

    onReset: {
        renderTimer.stop();
        textRenderer.showedText = "";
        textRenderer.fullText = "";
        textRenderer.textShowedToEnd = true;
    }
}
