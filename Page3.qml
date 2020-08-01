import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Particles 2.12

Page {
    width: 800
    height: 600
    anchors.fill: parent
    signal emitSparks(var xPos, var yPos, var numberOfParticles)
    id: pageRoot
    title: qsTr("Page 3")
    ScrollView {
        width: parent.width
        height: parent.height
        contentWidth: parent.width
        contentHeight: parent.height * 2

        Image {
            id: bg_image
            anchors.fill: parent
            source: Qt.resolvedUrl(
                        "http://us.nodelogic.org/ux/images/presentation_03.png")
            sourceSize.width: 800
            sourceSize.height: 600
            Behavior on opacity {

                NumberAnimation {
                    easing.type: Easing.OutExpo
                    duration: 1000
                }
            }
        }
        Column {
            width: parent.width
            height: parent.height
            id: mainColumn
            Behavior on opacity {
                NumberAnimation {
                    duration: 3000
                }
            }
            opacity: 0.1

            //            Image {
            //                id: showcase_image
            //                source: Qt.resolvedUrl(
            //                            "http://us.nodelogic.org/ux/assets/presentation_03_showcase.png")
            //                sourceSize.width: 600
            //                sourceSize.height: 200
            //                opacity: 0.1

            //                Component.onCompleted: {
            //                    showcase_image.opacity = 1.0
            //                }
            //                Behavior on opacity {

            //                    NumberAnimation {
            //                        easing.period: 0.36
            //                        easing.amplitude: 0.45

            //                        duration: 2020
            //                        easing.type: Easing.InQuart
            //                    }
            //                }
            //            }
            Pane {
                height: parent.height * 0.70
                width: parent.width
                Row {
                    anchors.fill: parent
                    spacing: parent.width * 0.10
                    Rectangle {
                        height: parent.height
                        width: parent.width * 0.70
                        gradient: Gradient {
                            GradientStop {
                                position: 0.00
                                color: "#ffffff"
                            }
                            GradientStop {
                                position: 1.00
                                color: "#000000"
                            }
                        }
                        color: "#ffffff"

                        Page3Box1 {
                            Component.onCompleted: {
                                page3box1.emitSparks.connect(
                                            pageRoot.emitSparks)
                            }
                            id: page3box1
                        }
                    }

                    //                    Rectangle {
                    //                        height: parent.height
                    //                        width: parent.width * 0.20
                    //                        gradient: Gradient {
                    //                            GradientStop {
                    //                                position: 0.00
                    //                                color: "#ffffff"
                    //                            }
                    //                            GradientStop {
                    //                                position: 1.00
                    //                                color: "#000000"
                    //                            }
                    //                        }
                    //                        color: "#ffffff"
                    //                    }
                    //                    Rectangle {
                    //                        height: parent.height
                    //                        width: parent.width * 0.20
                    //                        gradient: Gradient {
                    //                            GradientStop {
                    //                                position: 0.00
                    //                                color: "#ffffff"
                    //                            }
                    //                            GradientStop {
                    //                                position: 1.00
                    //                                color: "#000000"
                    //                            }
                    //                        }
                    //                        color: "#ffffff"
                    //                    }
                }
            }
        }
        Component.onCompleted: {

            mainColumn.opacity = 1
            bg_image.opacity = 1

            //showcase_image.opacity = 1
        }
        //        BusyIndicator {
        //            id: busy_indicator
        //            width: parent.width * 0.43
        //            height: parent.height * 0.43
        //            Behavior on opacity {
        //                NumberAnimation {
        //                    duration: 3000
        //                }
        //            }
        //        }
    }
}
