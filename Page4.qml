import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQml.Models 2.1

Page {
    width: 800
    height: 600
    anchors.fill: parent
    title: qsTr("Home")
    signal emitSparks(var xPos, var yPos, var numberOfParticles)
    signal nextSlide(var newPage)
    Item {
        id: element
        anchors.fill: parent

        PathView {
            id: pathView

            model: ObjectModel {
                id: itemModel
                Rectangle {
                    height: 30
                    width: 80
                    color: "red"
                    Label {
                        anchors.fill: parent
                        text: "Drag"
                    }
                }
                Rectangle {
                    height: 30
                    width: 80
                    color: "green"
                    Label {
                        anchors.fill: parent
                        text: "Move"
                    }
                }
                Rectangle {
                    height: 30
                    width: 80
                    color: "blue"
                    Label {
                        anchors.fill: parent
                        text: "Flick"
                    }
                }
            }
            anchors.fill: parent

            path: Path {

                startY: 346
                startX: 340
                PathQuad {
                    x: 120
                    y: 25
                    controlX: 260
                    controlY: 75
                }
                PathQuad {
                    x: 120
                    y: 100
                    controlX: -20
                    controlY: 75
                }
            }
            delegate: ItemDelegate {
                id: itemDelegate
                text: modeldata
            }
        }
    }
}
