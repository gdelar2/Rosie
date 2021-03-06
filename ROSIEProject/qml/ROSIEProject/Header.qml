import QtQuick 2.0

Rectangle {
    width: 1920
    height: 100
    color: mainColor
    //Top left button is supposed to return to a previous screen and or log off
    signal returnShortcutClicked

    function toggleQuickMenu(vis) {
        //We don't want to display the quick menu shortcut all the time
        quickMenuShortcut.visible = vis;
    }

    function getQuickMenu() {
        return qMenuView
    }

    Rectangle {
        id: returnShortcut
        width: 115
        height: 110
        y: -10
        x: -10
        color: "#000000"
        opacity: 0.69
        radius: 10

        Text {
            id: returnTxt
            x: (parent.width / 2) - (width / 2)
            //y: -10
            font.bold: true
            font.pointSize: 94
            font.family: mediumFont.name
            color: "#FFFFFF"
            opacity: 0.9
            text: "*"
        }
        MouseArea {
            id: returnMouseRegion
            anchors.fill: returnShortcut
            //Call clicked signal if button is clicked
            onClicked: {
                returnShortcutClicked()
            }
        }
    }

    Rectangle {
        id: timeBlock
        width: 330
        height: 110
        y: -10
        x: 1600
        color: "#000000"
        opacity: 0.69
        radius: 10
        //Show the date and time
        Text {
            id: dateTxt
            x: 59
            y: 1
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
            text: Qt.formatDateTime(new Date(), "hh:mm AP")
            horizontalAlignment: Text.AlignHCenter
        }
    }

    QuickMenu {
        id: qMenuView
        y: 0-height
        visible: false

        //Ease in and out based on y position
        Behavior on y { PropertyAnimation {
                easing.type: Easing.InOutQuad
                duration: 1000
            }
        }

        //Toggle visibility when off the screen
        onYChanged: {
            if(quickMenuShortcut.rotation == 0 && y == 0-height)
                visible = false;
        }

        //Put the quick menu in or out of view
        function toggle() {
            if (qMenuView.visible == true) {
                quickMenuShortcut.rotation = 0
                y = 0-height;
                quickMenuShortcut.y = -10
            } else {
                quickMenuShortcut.rotation = 180
                visible = true;
                y = 0;
                quickMenuShortcut.y = qMenuView.height
            }
        }
    }
    Rectangle {
        id: quickMenuShortcut
        width: 445
        height: 110
        y: -10
        x: 705
        color: "#000000"
        opacity: 0.69
        radius: 10

        Behavior on y { PropertyAnimation {
                easing.type: Easing.InOutQuad
                duration: 1000
            }
        }
        Text {
            id: qmenuTxt
            x: (parent.width / 2) - (width / 2)
            y: 60
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
                //Pull up/down the quick menu
                qMenuView.toggle()
            }
        }
    }

    //Update the date and time every second
    Timer {
        id: timeTimer
        running: true
        repeat: true
        interval: 1000
        onTriggered: {
            timeTxt.text = Qt.formatDateTime(new Date(), "hh:mm AP")
            dateTxt.text = Qt.formatDateTime(new Date(), "MM/dd/yy")
        }
    }
}
