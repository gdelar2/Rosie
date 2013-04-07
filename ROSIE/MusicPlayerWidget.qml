import QtQuick 2.0

Rectangle {
    width: 600
    height: 200
    color: "#a09b9b"
    opacity: 0.750
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
        x: 254
        y: 114
        width: 70
        height: 69

        Image {
            id: backIcon
            x: 0
            y: -1
            width: 70
            height: 70
            source: "../Image/MusicPlayer/Rewind.png"
        }
    }

    MouseArea {
        id: music_play
        x: 335
        y: 114
        width: 70
        height: 69

        Image {
            id: playIcon
            x: 0
            y: -1
            width: 70
            height: 70
            source: "../Image/MusicPlayer/Play.png"
        }
    }

    MouseArea {
        id: music_pause
        x: 414
        y: 114
        width: 70
        height: 69

        Image {
            id: pauseIcon
            x: 0
            y: -1
            width: 70
            height: 70
            source: "../Image/MusicPlayer/Pause.png"
        }
    }

    MouseArea {
        id: music_forward
        x: 495
        y: 114
        width: 70
        height: 69

        Image {
            id: forwardIcon
            x: 0
            y: -1
            width: 70
            height: 70
            source: "../Image/MusicPlayer/Forward.png"
        }
    }
}
