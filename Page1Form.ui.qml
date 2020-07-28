import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 800
    height: 600

    title: qsTr("Page 1")
    anchors.fill: parent
    Image {
        opacity: 1.0
        sourceSize.width: parent.width
        sourceSize.height: parent.height
        anchors.fill: parent
        source: "qrc:///images/presentation_01.png"
    }
}
