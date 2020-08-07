import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    width: 800
    height: 600
    anchors.fill: parent
    signal emitSparks(var xPos, var yPos, var numberOfParticles)
    signal nextSlide(var newPage)

    title: qsTr("Page 2")

    Image {
        opacity: 1.0
        sourceSize.width: parent.width
        sourceSize.height: parent.height
        anchors.fill: parent
        source: "qrc:///images/presentation_02.png"
    }
    GreenButton {

        id: button
        text: "Next"
        x: parent.width * 0.65
        y: parent.height * 0.10
        width: parent.width * 0.25
        height: parent.height * 0.10
        onClicked: {
            nextSlide("Page2Form.qml")
        }
    }
    MouseArea {
        x: parent.width * 0.65
        y: parent.height * 0.10
        width: parent.width * 0.25
        height: parent.height * 0.10
        onPressed: {
            page.nextSlide("Page3.qml")
            emitSparks(mapToItem(page, mouseX, mouseY).x, mapToItem(page, mouseX,
                                                                  mouseY).y, 50)
            button.opacity = 0
        }
    }
}
