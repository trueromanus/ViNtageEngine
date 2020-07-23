import QtQuick 2.12

ActionItem {
    id: root
    property var target: null
    property string text: ""
    property bool resetOnDeactivate: false

    onActivated: {
        if (!root.target) return;

        root.target.renderText(root.text);
    }

    onNeedRepeated: {
        if (!root.target.textShowedToEnd) {
            root.target.renderTextToEnd();
            result.repeated = true;
            return;
        }
    }

    onDeactivated: {
        if (root.resetOnDeactivate) root.target.reset();
    }
}
