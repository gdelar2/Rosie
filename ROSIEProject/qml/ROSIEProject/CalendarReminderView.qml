import QtQuick 2.0

Rectangle {
    function setDate(date) {
        reminderDateText.text = date
    }

    width: 1095
    height: 680
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    visible: false
    radius: 20
    color: mainColor
    border.color: "#000000"
    border.width: 6

    Text {
        id: remText
        font.pointSize: 64
        font.family: mediumFont.name
        anchors.horizontalCenter: parent.horizontalCenter
        y:10
        opacity: .68
        text: "NEW REMINDER"
    }

    Rectangle {
        height: 1
        width: parent.width - (parent.width / 4)
        border.color: "#000000"
        border.width: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: remText.bottom
    }

    Text {
        id: reminderDateText
        font.bold: true
        font.pointSize: 36
        font.family: regularFont.name
        text: ""
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            parent.visible = false
        }
    }
}
