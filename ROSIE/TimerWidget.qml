import QtQuick 2.0

Rectangle {
    width: 600
    height: 650
    color: "#000000"
    opacity: 0.7

    Text {
        id: convertTitle
        x: 12
        y: 10
        width: 523
        height: 48
        color: "#ffffff"
        text: qsTr("Timer")
        style: Text.Raised
        anchors.left: parent.left
        anchors.leftMargin: 12
        font.bold: true
        font.family: "Exo"
        verticalAlignment: Text.AlignVCenter
        opacity: 1
        font.pixelSize: 36
    }

    Rectangle {
        id: timerBorder
        x: 12
        y: 120
        width: 572
        height: 197
        color: "#000000"
        opacity: 0.700
        border.width: 3
        border.color: "#000000"
    }
}
