import QtQuick 2.0

Rectangle {
    width: 600
    height: 200
    color: "#000000"
    opacity: 0.7
    border.width: 2
    border.color: "#000000"

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
        font.family: "Exo"
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
        font.family: "Exo"
        font.pixelSize: 33
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
