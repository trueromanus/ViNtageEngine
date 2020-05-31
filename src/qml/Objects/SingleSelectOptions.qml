import QtQuick 2.12
import QtQuick.Layouts 1.12
import Felgo 3.0

EntityBase {
    id: root
    entityType: "singleselectoptions"
    default property alias content: innerContainer.delegate
    property var selectedIndexes: []
    property var items: 0

    signal setSelected(int index)
    signal selected(int index)

    Column {
        anchors.fill: parent

        Repeater {
            id: innerContainer
            model: items
        }
    }

    onSetSelected: {
        if (root.selectedIndexes.find(a => a === index)) return; // already selected

        root.selectedIndexes = [index];

        root.selected(index);
    }
}
