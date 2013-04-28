import QtQuick 2.0

Rectangle {
    width: 1920
    height: 975
    color: "#000000"
    opacity: .95

    function getWidget1() {
        return widget1;
    }

    function getWidget2() {
        return widget2;
    }

    onVisibleChanged: {
        if (visible) {

        }
    }

    MouseArea {
        anchors.fill: parent
    }

    Text {
        id: rosieTxt
        x: (parent.width / 2) - (width / 2)
        y: -10
        font.bold: true
        font.pointSize: 72
        font.family: mediumFont.name
        color: "#FFFFFF"
        opacity: 0.6
        text: "ROSIE"
    }

    Rectangle {
        id: menuBlock
        x: (parent.width / 2) - (width / 2)
        y: 125
        width: 970
        height: 825
        color: "#000000"
        opacity: 0.7
        radius: 50
        smooth: true
        border.color: "#FFFFFF"
        border.width: 2
        Text {
            id: shortcutMenuHome
            x: (parent.width / 2) - (width / 2)
            font.bold: true
            font.pointSize: 64
            font.family: mediumFont.name
            color: "#FFFFFF"
            opacity: .8
            text: "SETTINGS"
        }
        Text {
            id: shortcutMenuLogout
            x: (parent.width / 2) - (width / 2)
            y: shortcutMenuHome.y + shortcutMenuHome.height + 20
            font.bold: true
            font.pointSize: 64
            font.family: mediumFont.name
            color: "#FFFFFF"
            opacity: .8
            text: "LOGOUT"
        }
    }

    Rectangle {
        id: widget1
        x:0
        y:50
    }

    Rectangle {
        id: widget2
        y:50
    }
}
