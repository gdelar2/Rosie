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

    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height
    }

    MediaPlayer{
        id: currentMusic
        property var myArray: ["music/02 - November 25_ Morning.mp3", "music/02 - Roy Orbison - In Dreams.mp3", "music/03 - 1934_ Grandmother & Kimitake.mp3", "music/06 - 1937_ Saint Sebastian.mp3", "music/07 Cousins.mp3"];
        source: myArray[0]
        property int arrayIndex: 0
    }

    Image {
        id: albumArt
        x: 16
        y: 13
        width: 174
        height: 170
        source: "Image/RecipeApp/MacAndCheese.jpg"
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

        onClicked:{
            currentMusic.stop()
            currentMusic.arrayIndex -= 1
            if (currentMusic.arrayIndex === -1){
                currentMusic.arrayIndex = 4
                currentMusic.source = currentMusic.myArray[currentMusic.arrayIndex]
            }

            else{
                currentMusic.source = currentMusic.myArray[currentMusic.arrayIndex]
            }

            playIcon.source = "Image/MusicPlayer/Play.png"
        }
    }

    MouseArea {
        id: music_play
        x: 363
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
            source: "Image/MusicPlayer/Play.png"
        }

        onClicked: {

            songTitle.text = currentMusic.metaData.title
            artist.text = currentMusic.metaData.albumArtist
            if(whichState === 1){
                whichState = 2
                currentMusic.play()
                playIcon.source = "Image/MusicPlayer/Pause.png"
            }

            else{
                whichState = 1
                currentMusic.pause()
                playIcon.source = "Image/MusicPlayer/Play.png"
            }


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

        onClicked:{
            currentMusic.stop()
            currentMusic.arrayIndex += 1
            if (currentMusic.arrayIndex === 5){
                currentMusic.arrayIndex = 0
                currentMusic.source = currentMusic.myArray[currentMusic.arrayIndex]
            }

            else{
                currentMusic.source = currentMusic.myArray[currentMusic.arrayIndex]
            }

            playIcon.source = "Image/MusicPlayer/Play.png"
        }
    }

    Text {
        id: songTitle
        x: 211
        y: 60
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
        x: 211
        y: 18
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
