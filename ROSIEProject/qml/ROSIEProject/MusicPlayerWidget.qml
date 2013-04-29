import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    width: 600
    height: 200
    color: "#000000"
    opacity: 0.7
    border.width: 2
    border.color: "#000000"
    radius: 10
    property bool draggable: true;

    //Make the widget draggable
    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height

        onPressed: {
            if(!draggable)
                drag.target = null;
        }
    }

    //Create a media player and populate it with some songs
    MediaPlayer{
        id: currentMusic
        property var myArray: ["music/02 - November 25_ Morning.mp3", "music/02 - Roy Orbison - In Dreams.mp3", "music/03 - 1934_ Grandmother & Kimitake.mp3", "music/06 - 1937_ Saint Sebastian.mp3", "music/07 Cousins.mp3"];
        source: myArray[0]
        property int arrayIndex: 0
    }

    //Create the various player controls
    MouseArea {
        id: music_back
        x: 176
        y: 114
        width: 70
        height: 69

        Image {
            id: backIcon
            x: 0
            y: -1
            width: 70
            height: 70
            source: "Image/MusicPlayer/skip_backward.png"
        }

        onClicked:{
            //Load in the correct song into the player
            currentMusic.stop()
            currentMusic.arrayIndex -= 1
            if (currentMusic.arrayIndex === -1){
                currentMusic.arrayIndex = 4
                currentMusic.source = currentMusic.myArray[currentMusic.arrayIndex]
            }

            else{
                currentMusic.source = currentMusic.myArray[currentMusic.arrayIndex]
            }

            playIcon.source = "Image/MusicPlayer/play.png"
        }
    }

    MouseArea {
        id: music_play
        x: 265
        y: 114
        width: 70
        height: 69
        property int whichState: 1

        Image {
            id: playIcon
            x: 0
            y: -1
            width: 70
            height: 70
            source: "Image/MusicPlayer/play.png"
        }

        onClicked: {
            //Load in the correct song into the player
            songTitle.text = currentMusic.metaData.title
            artist.text = currentMusic.metaData.albumArtist
            if(whichState === 1){
                whichState = 2
                currentMusic.play()
                playIcon.source = "Image/MusicPlayer/pause.png"
            }

            else{
                whichState = 1
                currentMusic.pause()
                playIcon.source = "Image/MusicPlayer/play.png"
            }


        }
    }

    MouseArea {
        id: music_forward
        x: 357
        y: 114
        width: 70
        height: 69

        Image {
            id: forwardIcon
            x: 0
            y: -1
            width: 70
            height: 70
            source: "Image/MusicPlayer/skip_forward.png"
        }

        onClicked:{
            //Load in the correct song into the player
            currentMusic.stop()
            currentMusic.arrayIndex += 1
            if (currentMusic.arrayIndex === 5){
                currentMusic.arrayIndex = 0
                currentMusic.source = currentMusic.myArray[currentMusic.arrayIndex]
            }

            else{
                currentMusic.source = currentMusic.myArray[currentMusic.arrayIndex]
            }

            playIcon.source = "Image/MusicPlayer/play.png"
        }
    }

    Text {
        id: songTitle
        x: 114
        y: 63
        width: 373
        height: 39
        color: "#ffffff"
        text: "currentMusic.metaData.title"
        font.strikeout: false
        font.underline: false
        font.family: mediumFont.name
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 25
    }

    Text {
        id: artist
        x: 114
        y: 21
        width: 373
        height: 39
        color: "#ffffff"
        text: "currentMusic.metaData.albumArtist"
        font.family: mediumFont.name
        font.pixelSize: 33
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

}
