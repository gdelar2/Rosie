import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    width: 600
    height: 650
    color: "#000000"
    opacity: 0.7
    radius: 13
    property bool draggable: true;

    MediaPlayer{ //Create the media player for a video
        id: videoFile
        source: "video/Kodak Zi8.mp4"
    }

    Text { //Show the video title
        id: convertTitle
        x: 12
        y: 10
        width: 523
        height: 48
        color: "#ffffff"
        text: qsTr("Video")
        style: Text.Raised
        anchors.left: parent.left
        anchors.leftMargin: 12
        font.bold: true
        font.family: mediumFont.name
        verticalAlignment: Text.AlignVCenter
        opacity: 1
        font.pixelSize: 36
    }

    //Make the widget draggable and have it open the video app on click
    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height

        onClicked: {
            videoFile.stop()
            loadApp("VideoApp.qml", {});
        }
        onPressed: {
            if(!draggable)
                drag.target = null;
        }
    }

    Rectangle { //Display the video
        id: rectangle1
        x: 12
        y: 64
        width: 576
        height: 328
        color: "#000000"
        opacity: 1

        VideoOutput{
            anchors.fill: parent
            source: videoFile
        }
    }

    //Load the controls into a row
    Row {
        id: row1
        x: 140
        y: 417
        width: 320
        height: 100
        spacing: 9

        Rectangle {
            id: rectangle2
            x: 7
            y: 6
            width: 155
            height: 90
            color: "#000000"
            radius: 13
            opacity: 0.800

            Text {
                id: text1
                x: 33
                y: 15
                color: "#ffffff"
                text: qsTr("Play")
                font.family: mediumFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 46

                MouseArea{
                    anchors.fill: parent

                    onClicked: { //play the video
                        text1.color = "#000000"
                        rectangle2.color = "#ffffff"

                        text2.color = "#ffffff"
                        rectangle3.color = "#000000"

                        videoFile.play()
                    }
                }
            }
        }

        Rectangle {
            id: rectangle3
            x: 180
            y: 6
            width: 155
            height: 90
            color: "#000000"
            radius: 13
            opacity: 0.800

            Text {
                id: text2
                x: 16
                y: 15
                color: "#ffffff"
                text: qsTr("Pause")
                font.family: mediumFont.name
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 46

                MouseArea{
                    anchors.fill: parent

                    onClicked: { //pause the video
                        text2.color = "#000000"
                        rectangle3.color = "#ffffff"

                        text1.color = "#ffffff"
                        rectangle2.color = "#000000"

                        videoFile.pause()
                    }
                }

            }
        }
    }
}
