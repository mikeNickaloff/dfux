import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    title: qsTr("Home")

    Item {
        id: element
        anchors.fill: parent

        PathView {
            id: pathView
            model: ["Custom", "Original", "To Specifications"]
            anchors.fill: parent

            path: Path {
                startY: 346
                startX: 340

                PathCubic {
                    x: 145
                    y: 146
                    control2Y: 93.333
                    control2X: 508.333
                    control1Y: 260.333
                    control1X: 430.333
                }

                PathCubic {
                    x: 340
                    y: 346
                    control2Y: 367.333
                    control2X: 118.667
                    control1Y: 217.333
                    control1X: 70.667
                }
            }
            delegate: ItemDelegate {
                id: itemDelegate
                text: modeldata
            }
        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:200;anchors_width:200}
}
##^##*/

