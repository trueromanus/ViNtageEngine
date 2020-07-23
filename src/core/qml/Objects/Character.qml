import QtQuick 2.12
import Felgo 3.0

EntityBase {
    id: root
    entityType: "character"
    property alias spriteHeight: sequence.height
    property alias spriteWidth: sequence.width
    property alias spriteOpacity: sequence.opacity
    default property alias content: sequence.children
    property real frameRate: 2
    property int frameWidth: 0
    property int frameHeight: 0
    property int frameCount: 0
    property string displayName: ""

    signal setSprite(string name)

    SpriteSequence {
       id: sequence
    }

    onSetSprite: {
        sequence.jumpTo(name);
    }

    Component.onCompleted: {
        for (var i = 0; i < sequence.sprites.length ; i++)  {
            var child =  sequence.sprites[i];
            if (child.frameRate < 0) child.frameRate = root.frameRate;
            if (!child.frameWidth) child.frameWidth = root.frameWidth;
            if (!child.frameHeight) child.frameHeight = root.frameHeight;
            if (child.frameCount === 1) child.frameCount = root.frameCount;
        }
    }
}
