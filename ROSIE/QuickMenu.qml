import QtQuick 2.0

Rectangle {
    width: 1920
    height: 975
    color: "#000000"
    opacity: .8

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
        Text {
            id: shortcutMenuHome
            x: (parent.width / 2) - (width / 2)
            font.bold: true
            font.pointSize: 64
            font.family: mediumFont.name
            color: "#FFFFFF"
            opacity: .8
            text: "HOME"
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
}
