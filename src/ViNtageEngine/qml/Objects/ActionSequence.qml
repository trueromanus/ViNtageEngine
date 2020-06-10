import QtQuick 2.12
import Felgo 3.0

EntityBase {
    id: root
    entityType: "actionsequence"
    property int currentAction: -1

    signal runNextAction(int index)
    signal actionActivated(int index)
    signal actionDeactivated(int index)
    signal allActionsEnded()

    onRunNextAction: {
        if (root.currentAction > -1 && root.currentAction < root.children.length) root.children[root.currentAction].deactivated();

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
}
