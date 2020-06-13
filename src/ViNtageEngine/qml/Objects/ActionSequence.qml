import QtQuick 2.12
import Felgo 3.0

Item {
    id: root
    property int currentAction: -1

    signal runNextAction(int index)
    signal actionActivated(int index)
    signal actionDeactivated(int index)
    signal allActionsEnded()
    signal reset()

    onRunNextAction: {
        if (!root.children.length) return;

        if (root.currentAction > -1 && root.currentAction < root.children.length) deactivateAction(root.children[root.currentAction]);

        let newIndex = index;
        if (index === -1) newIndex = root.currentAction + 1;

        if (newIndex > root.children.length) newIndex = root.children.length;

        root.currentAction = newIndex;

        if (root.currentAction === root.children.length) {
            allActionsEnded();
            return;
        }

        root.children[root.currentAction].activated();
    }

    onReset: {
        if (root.currentAction > -1 && root.currentAction < root.children.length) deactivateAction(root.children[root.currentAction]);

        root.currentAction = -1;
    }

    function deactivateAction(action) {
        if (action.deactivated) action.deactivated();
    }
}
