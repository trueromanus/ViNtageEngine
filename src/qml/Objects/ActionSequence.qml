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
        if (index === -1) root.currentAction += 1;
        if (index > -1) root.currentAction = index;

        if (root.currentAction > root.children.lenght) {
            allActionsEnded();
            return;
        }
    }
}
