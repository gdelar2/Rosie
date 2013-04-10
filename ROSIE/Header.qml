import QtQuick 2.0

Rectangle {
    width: 1920
    height: 100
    color: mainColor

    signal settingsShortcutClicked

    Rectangle {
        id: settingsShortcut
        width: 105
        height: 100
        x: 0
        color: "#000000"
        opacity: 0.69

        Text {
            id: settingsTxt
            x: (parent.width / 2) - (width / 2)
            y: -10
            font.bold: true
            font.pointSize: 94
            font.family: mediumFont.name
            color: "#FFFFFF"
            opacity: 0.9
            text: "*"
        }
        MouseArea {
            id: settingsMouseRegion
            anchors.fill: settingsShortcut
            //Call clicked signal if button is clicked
            onClicked: {
                settingsShortcutClicked()
            }
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
            id: dateTxt
            x: 59
            y: -6
            font.bold: true
            font.pointSize: 35
            font.family: mediumFont.name
            color: "#FFFFFF"
            opacity: 0.9
            lineHeight: 0.2
            text: Qt.formatDateTime(new Date(), "MM/dd/yy")
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: timeTxt
            x: 34
            y: 36
            font.bold: true
            font.pointSize: 45
            font.family: mediumFont.name
            color: "#FFFFFF"
            opacity: 0.9
            lineHeight: 0.2
            text: Qt.formatDateTime(new Date(), "h:mm AP")
            horizontalAlignment: Text.AlignHCenter
        }
    }
    QuickMenu {
        id: qMenuView
        visible: false

        function toggle() {
            if (qMenuView.visible == true) {
                qMenuView.visible = false
                quickMenuShortcut.y = 0
                quickMenuShortcut.rotation = 0
            } else {
                qMenuView.visible = true;
                quickMenuShortcut.y = qMenuView.height
                quickMenuShortcut.rotation = 180
            }
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
            color: "#FFFFFF"
            opacity: 0.9
            rotation: 180
            lineHeight: 0.2
            text: "^\n^"
        }
        MouseArea {
            id: qMenuMouseRegion
            anchors.fill: quickMenuShortcut
            //Call clicked signal if button is clicked
            onClicked: {
                qMenuView.toggle()
            }
        }
    }

    Timer {
        id: timeTimer
        running: true
        repeat: true
        interval: 1000
        onTriggered: {
            timeTxt.text = Qt.formatDateTime(new Date(), "h:mm AP")
            dateTxt.text = Qt.formatDateTime(new Date(), "MM/dd/yy")
        }
    }
}
