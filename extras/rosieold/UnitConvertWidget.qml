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
        text: qsTr("Convert")
        style: Text.Raised
        anchors.left: parent.left
        anchors.leftMargin: 12
        font.bold: true
        font.family: mediumFont.name
        verticalAlignment: Text.AlignVCenter
        opacity: 1
        font.pixelSize: 36
    }

    Rectangle {
        id: fromInputBorder
        x: 12
        y: 118
        width: 336
        height: 200
        color: "#000000"
        opacity: 0.700
        border.width: 4
        border.color: "#000000"

        TextEdit {
            id: fromInput
            x: 13
            y: 44
            width: 310
            height: 112
            color: "#ffffff"
            text: qsTr("text edit")
            font.family: mediumFont.name
            textFormat: TextEdit.RichText
            horizontalAlignment: TextEdit.AlignHCenter
            font.pixelSize: 83
        }
    }

    Text {
        id: from
        x: 12
        y: 66
        color: "#ffffff"
        text: qsTr("From")
        font.family: mediumFont.name
        font.pixelSize: 32
    }

    Text {
        id: to
        x: 12
        y: 329
        color: "#ffffff"
        text: qsTr("To")
        font.pixelSize: 32
        font.family: mediumFont.name
    }

    Rectangle {
        id: toInputBorder
        x: 12
        y: 384
        width: 336
        height: 200
        color: "#000000"
        opacity: 0.700
        border.width: 4
        border.color: "#000000"

        Text {
            id: text1
            x: 13
            y: 44
            width: 310
            height: 112
            color: "#ffffff"
            text: qsTr("Number")
            font.family: mediumFont.name
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 83
        }
    }

    Rectangle {
        id: unitsFromBorder
        x: 374
        y: 123
        width: 200
        height: 190
        color: "#000000"
        visible: true
        opacity: 0.700
        border.width: 2
        border.color: "#000000"
    }

    Rectangle {
        id: unitsToBorder
        x: 374
        y: 389
        width: 200
        height: 190
        color: "#000000"
        opacity: 0.700
        border.width: 2
        border.color: "#000000"
    }

    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height
    }
}

