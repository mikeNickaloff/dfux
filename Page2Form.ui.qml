import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 800
    height: 600
    anchors.fill: parent
    signal emitSparks(var xPos, var yPos, var numberOfParticles)
    title: qsTr("Page 2")

    Image {
        opacity: 1.0
        sourceSize.width: parent.width
        sourceSize.height: parent.height
        anchors.fill: parent
        source: "qrc:///images/presentation_02.png"
    }

}
