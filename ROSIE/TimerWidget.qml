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
        id: hourRectangle
        x: 12
        y: 94
        width: 200
        height: 200
        color: "#000000"

        Text {
            id: hourTitle
            x: 76
            y: 157
            color: "#ffffff"
            text: qsTr("Hour")
            font.bold: true
            font.family: "Exo"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 22
        }

        Text {
            id: hour
            x: 12
            y: 0
            color: "#ffffff"
            text: qsTr("00")
            font.family: "Exo"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 137
        }
    }

    Rectangle {
        id: minuteRectangle
        x: 316
        y: 94
        width: 200
        height: 200
        color: "#000000"

        Text {
            id: minuteTitle
            x: 67
            y: 160
            color: "#ffffff"
            text: qsTr("Minute")
            font.bold: true
            font.family: "Exo"
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: minute
            x: 12
            y: 0
            color: "#ffffff"
            text: qsTr("00")
            verticalAlignment: Text.AlignVCenter
            font.family: "Exo"
            font.pixelSize: 137
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
