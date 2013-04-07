import QtQuick 2.0

Rectangle {
    width: 1920
    height: 100
    color: "#0e51a7"
    //opacity: 0

    Rectangle {

        id: settingsShortcut
        width: 105
        height: 100
        x: 0
        color: "#000000"
        opacity: 0.69
        //settings button
        //Display the settings title
        Text {
            id: settingsTxt
            x: (parent.width / 2) - (width / 2)
            y: (parent.height / 2) - (height / 3)
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
        //quick menu button
    }

    Rectangle {
        id: timeBlock
        width: 320
        height: 100
        x: 1600
        color: "#000000"
        opacity: 0.69
        //time
    }
}
