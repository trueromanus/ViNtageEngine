import QtQuick 2.12
import Felgo 3.0
import QtTest 1.12
import "../../core/qml/Objects/"

Item {
    ListModel {
        id: options
    }

    SingleSelectOptions {
        id: singleOptions
        items: 3

        /*SelectableItem {
            id: muher
            width: 400
            height: 30
            itemIndex: modelData.index
            selectOptions: singleOptions

            Rectangle {
                color: "transparent"
                anchors.fill: parent
                Text {
                    anchors.centerIn: parent
                    text: modelData.text
                    font.pixelSize: 18
                    color: muher.selected ? "black" : (muher.hovered ? "yellow" : "white")
                }
            }
        }*/
    }

    TestCase {
        name: "Simple tests for SingleSelectOptions"

        function test_selectSingleItem() {
            singleOptions.setSelected(0);

            verify(singleOptions.selectedIndexes.length === 1, "Selected indexes must be have 1 item");

            singleOptions.reset();
        }

        function test_checkOnlyOneItemSelected() {
            singleOptions.setSelected(0);

            singleOptions.setSelected(1);

            verify(singleOptions.selectedIndexes.length === 1, "Selected indexes must be have 1 item");

            singleOptions.reset();
        }

        function test_checkSelectedIndex() {
            singleOptions.setSelected(0);

            verify(singleOptions.selectedIndexes[0] === 0, "Index must be 0");

            singleOptions.setSelected(1);

            verify(singleOptions.selectedIndexes[0] === 1, "Index must be 1");

            singleOptions.reset();
        }

        function test_checkSelected() {
            let selectedFired = false;

            singleOptions.selected.connect(
                () => {
                    selectedFired = true;
                }
            )

            singleOptions.setSelected(0);

            compare(selectedFired, true, "SelectedFired must be true");

            singleOptions.reset();
        }

        function test_checkAlreadySelected() {
            let selectedFired = false;

            singleOptions.setSelected(0);

            singleOptions.selected.connect(
                () => {
                    selectedFired = true;
                }
            )

            singleOptions.setSelected(0);

            compare(selectedFired, false, "SelectedFired must be false");

            singleOptions.reset();
        }

        function test_reset() {
            singleOptions.setSelected(0);

            let unselectedFired = false;

            singleOptions.unselected.connect(
                () => {
                    unselectedFired = true;
                }
            )

            singleOptions.reset();

            compare(unselectedFired, true, "unselectedFired must be true");
            compare(singleOptions.selectedIndexes.length, 0, "selectedIndexes length must be zero");
        }

    }


}
