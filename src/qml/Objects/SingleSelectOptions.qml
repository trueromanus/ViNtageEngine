import QtQuick 2.12
import QtQuick.Layouts 1.12
import Felgo 3.0

EntityBase {
    entityType: "customEntity"
    default property alias content: options.children

    ColumnLayout {
        Repeater {
            id: options
            Layout.fillWidth: true
        }
    }
}
