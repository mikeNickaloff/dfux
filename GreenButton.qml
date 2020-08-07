import QtQuick 2.12
import QtQuick.Controls 2.12

Button {
    id: control
    text: qsTr("Button")
    signal clicked
    contentItem: Text {
        color: "#000000"
        text: control.text
        style: Text.Raised
        //font: control.font
        font.pixelSize: control.height

        opacity: enabled ? 1.0 : 0.3
        //  color: control.down ? "#38c43d" : "#21be2b"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        anchors.fill: parent
    }

    background: Rectangle {


        /*        implicitWidth: 100
        implicitHeight: 40
        */
        color: "#60d32a"
        opacity: enabled ? 1 : 0.3
        border.color: control.down ? "#17a81a" : "#21be2b"
        border.width: 1
        radius: 2
    }
}
