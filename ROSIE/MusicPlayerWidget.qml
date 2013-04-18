import QtQuick 2.0

Rectangle {
    width: 600
    height: 200
    color: "#000000"
    opacity: 0.7
    border.width: 2
    border.color: "#000000"
    radius: 10

    Image {
        id: albumArt
        x: 16
        y: 13
        width: 174
        height: 170
        source: "qrc:/qtquickplugin/images/template_image.png"
    }

    MouseArea {
        id: music_back
        x: 282
        y: 114
        width: 70
        height: 69

        Image {
            id: backIcon
            x: 0
            y: -1
            width: 70
            height: 70
            source: "Image/MusicPlayer/Rewind.png"
        }
    }

    MouseArea {
        id: music_play
        x: 363
        y: 114
        width: 70
        height: 69

        Image {
            id: playIcon
            x: 0
            y: -1
            width: 70
            height: 70
            source: "Image/MusicPlayer/Play.png"
        }
    }

    MouseArea {
        id: music_forward
        x: 445
        y: 114
        width: 70
        height: 69

        Image {
            id: forwardIcon
            x: 0
            y: -1
            width: 70
            height: 70
            source: "Image/MusicPlayer/Forward.png"
        }
    }

    Text {
        id: songTitle
        x: 211
        y: 60
        width: 373
        height: 39
        color: "#ffffff"
        text: qsTr("Who's Awesome? Rosie Is")
        font.strikeout: false
        font.underline: false
        font.family: mediumFont.name
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 25
    }

    Text {
        id: artist
        x: 211
        y: 18
        width: 373
        height: 39
        color: "#ffffff"
        text: qsTr("The Rosies")
        font.family: mediumFont.name
        font.pixelSize: 33
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
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
