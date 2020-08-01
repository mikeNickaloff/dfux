import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Particles 2.12
import "heading.js" as JS

ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 600
    title: qsTr("Stack")

    header: Pane {
        contentHeight: window.height * 0.35
        contentWidth: window.width
        id: headerPane

        Label {
            text: "datafault ux presentation"
            anchors.centerIn: parent
            opacity: 0.01
        }

        //        MouseArea {
        //            id: debugMouseArea
        //            anchors.fill: parent
        //            property var pathString
        //            property var pathPctArray: []
        //            property var isPressed: false
        //            onPressed: {
        //                isPressed = true
        //            }

        //            onPositionChanged: {
        //                pathString += " L " + mouse.x + " " + mouse.y
        //                var pctX = mapToItem(ps2, mouse.x, mouse.y).x / ps2.width
        //                var pctY = mapToItem(ps2, mouse.x, mouse.y).y / ps2.height
        //                pathPctArray.push({
        //                                      "x": pctX,
        //                                      "y": pctY
        //                                  })
        //            }
        //            onReleased: {
        //                console.log(JSON.stringify(pathPctArray))
        //            }
        //        }
        Drawer {
            id: drawer
            width: window.width * 0.36
            height: window.height * 0.75
            y: window.height * 0.25
            edge: Qt.RightEdge
            dim: modal
            background: Rectangle {
                color: "#978c8c"
                border.color: "#00adadad"
                border.width: 3
            }

            modal: false
            Column {
                anchors.fill: parent

                ItemDelegate {
                    text: qsTr("Page 1")
                    font.pixelSize: parent.height * 0.15
                    width: parent.width
                    onClicked: {
                        stackView.push("Page1Form.ui.qml")
                        drawer.close()
                        littleSparksAnim.running = true
                        littleSparksAnim.restart()
                    }
                }
                ItemDelegate {
                    text: qsTr("Page 2")
                    font.pixelSize: parent.height * 0.15
                    width: parent.width
                    onClicked: {
                        stackView.push("Page2Form.ui.qml")
                        drawer.close()
                        littleSparksAnim.running = true
                        littleSparksAnim.restart()
                    }
                }
                ItemDelegate {
                    text: qsTr("Page 3")
                    font.pixelSize: parent.height * 0.09
                    width: parent.width
                    onClicked: {
                        stackView.push("Page3.qml")

                        drawer.close()
                        littleSparksAnim.running = true
                        littleSparksAnim.restart()
                    }
                }
            }
        }

        Image {
            id: headingImage
            anchors.fill: parent
            source: "qrc:///images/heading.png"
            sourceSize.width: 800
            sourceSize.height: 260
            opacity: 0
        }

        ParticleSystem {
            width: parent.width
            height: parent.height
            id: ps2
            function emitSparks(xPos, yPos, numParticles, targetContextObject) {
                var _x = ps2.mapFromItem(targetContextObject, xPos, yPos).x
                var _y = ps2.mapFromItem(targetContextObject, xPos, yPos).y
                sparkEmitter.x = _x
                sparkEmitter.y = _y
                sparkEmitter.burst(numParticles)
            }
            SequentialAnimation {
                running: true
                ParallelAnimation {
                    PropertyAnimation {
                        target: headingImage
                        property: "opacity"
                        duration: 7000
                        to: 1.0
                        easing.type: Easing.InOutQuad
                    }
                    PropertyAnimation {
                        target: sparkEmitter
                        property: "size"
                        duration: 10000
                        from: 70
                        to: 0
                        easing.type: Easing.InCubic
                    }
                    PropertyAnimation {
                        target: sparkEmitter
                        property: "lifeSpan"
                        duration: 10000
                        from: 2000
                        to: 500
                        easing.type: Easing.InCubic
                    }
                    PropertyAnimation {
                        target: sparkEmitter
                        property: "emitRate"
                        duration: 10000
                        from: 13
                        to: 5
                        easing.type: Easing.OutInElastic
                    }

                    PathAnimation {

                        path: Path {

                            PathSvg {

                                path: JS.generate_path_from_pct_array(
                                          ps2, JS.headingBottomPoints)
                            }
                        }
                        orientation: PathAnimation.Fixed

                        duration: 6000
                        loops: 1

                        target: sparkEmitter
                    }
                }
                PropertyAnimation {
                    target: sparkEmitter
                    property: "emitRate"
                    duration: 5000
                    to: 0
                    easing.type: Easing.InCubic
                }
                ScriptAction {
                    script: {
                        sparkEmitter.emitRate = 19
                        sparkEmitter.enabled = false
                        //stackView.push("Page1Form.ui.qml")
                        //  littleSparksAnim.running = true
                        //  littleSparksAnim.restart()
                    }
                }
            }
            SequentialAnimation {
                id: littleSparksAnim
                running: false

                ScriptAction {
                    script: {
                        sparkEmitter.emitRate = 19
                        sparkEmitter.enabled = true
                    }
                }
                ParallelAnimation {
                    PropertyAnimation {
                        target: sparkEmitter
                        property: "size"
                        duration: 15000
                        from: 150
                        to: 16
                        easing.type: Easing.OutInSine
                    }
                    PropertyAnimation {
                        target: sparkEmitter
                        property: "lifeSpan"
                        duration: 12000
                        from: 4000
                        to: 200
                        easing.type: Easing.InQuart
                    }

                    PathAnimation {

                        path: Path {

                            PathSvg {

                                path: JS.generate_path_from_pct_array(
                                          ps2, JS.pageChangePoints)
                            }
                        }
                        orientation: PathAnimation.Fixed

                        duration: 4000
                        loops: 1

                        target: sparkEmitter
                    }
                    PropertyAnimation {
                        target: sparkEmitter
                        property: "emitRate"
                        duration: 7000
                        to: 0
                    }
                }

                ScriptAction {
                    script: {
                        sparkEmitter.emitRate = 19
                        sparkEmitter.enabled = false
                    }
                }
            }
            ImageParticle {
                objectName: "glow"
                groups: ["spark"]
                source: "qrc:///images/particle.png"
                color: "#ffffff"
                colorVariation: 0
                alpha: 0.32
                alphaVariation: 0
                redVariation: 0
                greenVariation: 0
                blueVariation: 0
                rotation: 0
                rotationVariation: 90
                autoRotation: false
                rotationVelocity: 20
                rotationVelocityVariation: 25
                entryEffect: ImageParticle.Fade
                system: ps2
            }

            ImageParticle {
                objectName: "spark"

                groups: ["spark"]
                source: "qrc:///images/star.png"
                color: "#7dc7c2"
                colorVariation: 0
                alpha: 1
                alphaVariation: 0.2
                redVariation: 0
                greenVariation: 0
                blueVariation: 0
                rotation: 0
                rotationVariation: 100
                autoRotation: false
                rotationVelocity: 25
                rotationVelocityVariation: 10
                entryEffect: ImageParticle.Scale
                system: ps2
            }

            Emitter {
                objectName: "sparkEmitter"
                id: sparkEmitter
                x: 0
                y: headerPane.height
                width: 40
                height: 20
                enabled: true
                group: "spark"
                emitRate: 19
                maximumEmitted: 200
                startTime: 0
                lifeSpan: 200
                lifeSpanVariation: 1200
                size: 76
                sizeVariation: 90
                endSize: 7
                velocityFromMovement: 10
                system: ps2
                velocity: PointDirection {
                    x: 20
                    xVariation: 60
                    y: 20
                    yVariation: 40
                }
                acceleration: AngleDirection {
                    angle: 0
                    angleVariation: 90
                    magnitude: 7
                    magnitudeVariation: 4
                }
                shape: LineShape {
                    mirrored: false
                }
            }
        }

        ToolButton {
            x: headerPane.width * 0.73
            y: headerPane.height * 0.22
            width: headerPane.width * 0.20
            id: toolButton
            text: drawer.opened === true ? "\u2718" : "\u2630"
            /* default value instead of "" is "\u2718" */
            font.pixelSize: Qt.application.font.pixelSize * 2.6

            onReleased: {
                if (drawer.visible !== true) {
                    drawer.open()
                    sparkEmitter.burst(75)
                } else {

                    drawer.close()

                    sparkEmitter.burst(75)
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "Page1Form.ui.qml"
        anchors.fill: parent
        StackView.onActivated: {
            stackView.currentItem.emitSparks.connect(
                        function (xPos, yPos, numParticles) {
                            ps2.emitSparks(xPos, yPos, numParticles,
                                           stackView.currentItem)
                        })
        }
        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 7000
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 4000
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 5000
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 5000
            }
        }
    }
}
