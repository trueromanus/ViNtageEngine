import QtQuick 2.12
import Vintage 1.0

GlobalOptions {
    id: root
    optionsFileName: "gs.data"
    property var gameOptions: null

    signal fillDefaultSettings(var defaultOptions)
    signal saveGameSettings()
    signal changeGameSettings(var handler)

    Component.onCompleted: {
        root.loadOptions();
        if (root.options) root.gameOptions = JSON.parse(root.options);

        if (!root.gameOptions) {
            const defaultOptions = {};
            fillDefaultSettings(defaultOptions)
            root.gameOptions = defaultOptions;
            saveGameSettings();
        }
    }

    onSaveGameSettings: {
        if (!root.gameOptions) return;

        root.options = JSON.stringify(root.gameOptions);
        root.saveOptions();
    }

    onChangeGameSettings: {
        if (!handler) return;

        handler(root.gameOptions);

        saveGameSettings();
    }
}
