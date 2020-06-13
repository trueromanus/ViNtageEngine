import QtQuick 2.12
import QtTest 1.12
import "../../ViNtageEngine/qml/Objects/"

Item {
    ActionSequence {
        id: actionSequence
    }

    TestCase {
        name: "ActionSequence order after transition"

        function test_emptyNotChangeIndex() {
            actionSequence.runNextAction(-1);

            compare(actionSequence.currentAction, -1, "Empty ActionSequence must be -1");
        }

        function test_singleItemCheckEnd() {
            const component = Qt.createComponent('../../ViNtageEngine/qml/Objects/ActionItem.qml');
            var object = component.createObject(actionSequence);

            actionSequence.runNextAction(-1);

            compare(actionSequence.currentAction, 0, "Empty ActionSequence must be 0");

            actionSequence.reset();
            object.destroy();
        }

        function test_threeItemsCheckChangeIndex() {
            const component = Qt.createComponent('../../ViNtageEngine/qml/Objects/ActionItem.qml');
            const objects = [];
            for (var i = 0; i < 3; i++) {
                objects.push(component.createObject(actionSequence));
            }

            compare(actionSequence.currentAction, -1, "Index must be -1");
            actionSequence.runNextAction(-1);

            compare(actionSequence.currentAction, 0, "Index must be 0");
            actionSequence.runNextAction(-1);

            compare(actionSequence.currentAction, 1, "Index must be 1");
            actionSequence.runNextAction(-1);

            compare(actionSequence.currentAction, 2, "Index must be 2");
            actionSequence.runNextAction(-1);

            actionSequence.reset();

            for (const object of objects) {
                object.destroy();
            }
        }

        function test_twoItemsCheckEndIndex() {
            const component = Qt.createComponent('../../ViNtageEngine/qml/Objects/ActionItem.qml');
            const objects = [];
            for (var i = 0; i < 2; i++) {
                objects.push(component.createObject(actionSequence));
            }

            compare(actionSequence.currentAction, -1, "Index must be -1");
            actionSequence.runNextAction(-1);

            compare(actionSequence.currentAction, 0, "Index must be 0");
            actionSequence.runNextAction(-1);

            compare(actionSequence.currentAction, 1, "Index must be 1");
            actionSequence.runNextAction(-1);

            compare(actionSequence.currentAction, 2, "Index must be 2");
            actionSequence.runNextAction(-1);

            compare(actionSequence.currentAction, 2, "Index must be 2");
            actionSequence.runNextAction(-1);

            compare(actionSequence.currentAction, 2, "Index must be 2");
            actionSequence.runNextAction(-1);

            actionSequence.reset();

            for (const object of objects) {
                object.destroy();
            }
        }

        function test_activatedDeactivatedOrderCheck() {
            const component = Qt.createComponent('../../ViNtageEngine/qml/Objects/ActionItem.qml');
            let activateFirst = false;
            let activateSecond = false;
            let deactivateFirst = false;
            let deactivateSecond = false;

            const object = component.createObject(actionSequence);
            object.activated.connect(() => {
                activateFirst = true;
            });
            object.deactivated.connect(() => {
                deactivateFirst = true;
            });

            const object2 = component.createObject(actionSequence);
            object2.activated.connect(() => {
                activateSecond = true;
            });
            object2.deactivated.connect(() => {
                deactivateSecond = true;
            });

            actionSequence.runNextAction(-1);
            compare(activateFirst, true, "activateFirst must be true");
            compare(activateSecond, false, "activateSecond must be false");
            compare(deactivateFirst, false, "deactivateFirst must be false");
            compare(deactivateSecond, false, "deactivateSecond must be false");

            actionSequence.runNextAction(-1);
            compare(activateFirst, true, "activateFirst must be true");
            compare(activateSecond, true, "activateSecond must be false");
            compare(deactivateFirst, true, "deactivateFirst must be false");
            compare(deactivateSecond, false, "deactivateSecond must be false");

            actionSequence.runNextAction(-1);
            compare(activateFirst, true, "activateFirst must be true");
            compare(activateSecond, true, "activateSecond must be false");
            compare(deactivateFirst, true, "deactivateFirst must be false");
            compare(deactivateSecond, true, "deactivateSecond must be false");

            actionSequence.reset();

            object.destroy();
            object2.destroy();
        }
    }

}


