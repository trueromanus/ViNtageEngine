import QtQuick 2.12
import QtQuick.Controls 2.12
import QtTest 1.12
import "../../ViNtageEngine/qml/Objects/"

TextRenderer {
    id: textRenderer
    renderInterval: 10

    TestCase {
        name: "Equal passed and final text"

        function initTestCase() {
            textRenderer.reset();
        }

        function cleanupTestCase() {
            textRenderer.reset();
        }

        function test_equalwithoutwaiting() {
            textRenderer.renderText("blablablabla blabla blablablabla blablablabla blablablablabla");
            textRenderer.renderTextToEnd();
            compare(textRenderer.showedText, textRenderer.fullText, "Showed text and Full text is equal");
            textRenderer.reset();
        }

        function test_equalwithcompletewaiting() {
            const text = "blablablab";
            textRenderer.renderText(text);

            wait(10000);

            compare(textRenderer.showedText, textRenderer.fullText, "Showed text and Full text is equal");
            textRenderer.reset();
        }

        function test_equalwithbreakwaiting() {
            textRenderer.renderText("blablablabla blabla blablablabla blablablabla blablablablabla");

            wait(50);

            verify(textRenderer.showedText.length < textRenderer.fullText.length, "Showed text is not complete");

            textRenderer.renderTextToEnd();

            compare(textRenderer.showedText, textRenderer.fullText, "Showed text and Full text is equal");

            textRenderer.reset();
        }
    }
}
