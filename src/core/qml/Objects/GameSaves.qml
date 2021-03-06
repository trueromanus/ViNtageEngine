import QtQuick 2.12
import Vintage 1.0

GameOptions {
    id: root
    property var screenshootTarget

    signal saveScreenshoot(string path, int slot)

    onGameOptionsSaved: {
        if (!screenshootTarget) return;

        const slotNumber = slot;
        const savedPath = path;

        screenshootTarget.grabToImage(
            function(result) {
                console.log(savedPath + `screenshoot${slotNumber}.png`);
                result.saveToFile(savedPath + `screenshoot${slotNumber}.png`);
            }
        );
    }
}
