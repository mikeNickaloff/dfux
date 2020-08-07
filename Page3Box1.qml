import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: pageRoot
    signal emitSparks(var xPos, var yPos, var numberOfParticles)
    anchors.fill: parent
    palette.text: "white"
    palette.window: "black"
    palette.windowText: "white"
    Rectangle {

        anchors.fill: parent
        color: "black"
        Column {
            height: parent.height
            width: parent.width
            Text {
                height: parent.height * 0.2
                text: "User Experiences that are .."
                font.pixelSize: parent.height * 0.04

                color: "white"
            }
            GroupBox {
                height: parent.height * 0.8
                width: parent.width

                ListView {

                    anchors.fill: parent
                    model: ["Interactive", "Entertaining", "Natural", "Customizable"]
                    delegate: ItemDelegate {
                        implicitWidth: 128
                        implicitHeight: 64
                        CheckDelegate {
                            id: control

                            font.pixelSize: parent.height * 0.25
                            contentItem: Text {
                                leftPadding: control.indicator.width + control.spacing
                                text: control.text
                                font: control.font
                                opacity: enabled ? 1.0 : 0.3
                                color: control.down ? "#17a81a" : "#21be2b"
                                elide: Text.ElideRight
                                verticalAlignment: Text.AlignVCenter
                            }

                            indicator: Rectangle {
                                implicitWidth: 26
                                implicitHeight: 26
                                x: control.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 3
                                color: "transparent"

                                border.color: control.down ? "#17a81a" : "#21be2b"

                                Rectangle {
                                    width: 14
                                    height: 14
                                    x: 6
                                    y: 6
                                    radius: 2
                                    color: control.down ? "#17a81a" : "#21be2b"
                                    visible: control.checked
                                }
                            }

                            text: modelData
                            checked: true
                        }
                    }
                    populate: Transition {
                        NumberAnimation {
                            properties: "x,y"
                            duration: 6000
                        }
                        NumberAnimation {
                            property: "opacity"
                            from: 0
                            to: 1
                            duration: 6000
                        }
                        NumberAnimation {
                            property: "rotation"
                            easing.period: 0.39
                            easing.amplitude: 0.85
                            easing.type: Easing.InOutCubic
                            from: -85
                            to: 0
                            duration: 6200
                        }
                    }
                }
            }
        }
    }
}
