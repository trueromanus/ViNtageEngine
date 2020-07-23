import QtQuick 2.12
import Felgo 3.0

MultiResolutionImage {
    property Scene targetScene
    width: targetScene.width
    height: targetScene.height
}
