import QtQuick 2.0

Rectangle {
    width: 1920
    height: 100
    color: mainColor

    Rectangle {
        id: settingsShortcut
        width: 105
        height: 100
        x: 0
        color: "#000000"
        opacity: 0.69
        //Display the settings title
        Text {
            id: settingsTxt
            x: (parent.width / 2) - (width / 2)
            y: -10
            font.bold: true
            font.pointSize: 94
            font.family: mediumFont.name
            color: "#000000"
            opacity: 0.9
            text: "*"
        }
    }

    Rectangle {
        id: quickMenuShortcut
        width: 445
        height: 100
        x: 705
        color: "#000000"
        opacity: 0.69
        Text {
            id: qmenuTxt
            x: (parent.width / 2) - (width / 2)
            y: 50
            font.bold: true
            font.pointSize: 94
            font.family: mediumFont.name
            color: "#000000"
            opacity: 0.9
            rotation: 180
            lineHeight: 0.2
            text: "^\n^"
        }
    }

    Rectangle {
        id: timeBlock
        width: 320
        height: 100
        x: 1600
        color: "#000000"
        opacity: 0.69
        Text {
            id: timeTxt
            x: (parent.width / 2) - (width / 2)
            font.bold: true
            font.pointSize: 52
            font.family: mediumFont.name
            color: "#000000"
            opacity: 0.9
            lineHeight: 0.2
            text: ""
        }
    }
    Timer {
        id: timeTimer
        running: true
        repeat: true
        interval: 1000
        onTriggered: {
            timeTxt.text = Qt.formatDateTime(new Date(), "h:mm AP")
        }
    }
}
