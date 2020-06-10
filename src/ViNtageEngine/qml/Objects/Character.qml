import QtQuick 2.12
import Felgo 3.0

EntityBase {
    entityType: "character"
    property alias spriteHeight: sequence.height
    property alias spriteWidth: sequence.width
    property alias spriteOpacity: sequence.opacity
    property alias spriteImage: creature.source
    property alias frameWidth: creature.frameWidth
    property alias frameHeight: creature.frameHeight
    property alias frameCount: creature.frameCount

    SpriteSequence {
       id: sequence

       Sprite {
           id: creature
           opacity: 1
           frameRate: 6
       }
    }
}
