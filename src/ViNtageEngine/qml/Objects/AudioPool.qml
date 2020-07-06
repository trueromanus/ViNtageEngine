import QtQuick 2.12

Item {
    id: root

    signal playSound(string path)

    onPlaySound: {
        const audio = Qt.createQmlObject('import QtMultimedia 5.12; Audio {}', root);
        audio.source = path;
        audio.play();
        audio.stopped.connect(
            () => {
                audio.destroy();
            }
        );
    }
}
