import QtQuick 2.0
import Qt.labs.folderlistmodel 1.0
import QtMultimedia 5.0

Rectangle {
    width: 1920
    height: 980
    color: mainColor
    property string fileVideo: ""

    Rectangle {
        id: rectangle1
        x: 0
        y: 41
        width: 548
        height: 899
        color: "#000000"
        opacity: 0.600

        ListView {
            id: list_view1
            x: 19
            y: 23
            width: 510
            height: 854
            highlightRangeMode: ListView.ApplyRange
            flickDeceleration: 1748


            FolderListModel{
                id: foldermodel
                folder: "video"
                nameFilters: ["*.*"]
            }

            Component {
                id: fileDelegate
                Row {
                    id: row1

                    Text {
                        color: "#ffffff"
                        width: 510
                        text: fileName
                        font.pointSize: 20
                        style: Text.Sunken
                        wrapMode: Text.WordWrap
                        font.family: mediumFont.name
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: false

                        MouseArea {
                            id: mouse_area1
                            z: 1
                            hoverEnabled: false
                            anchors.fill: parent

                            onClicked: {
                                title.text = fileName
                                fileVideo = fileName
                                text1.color = "#ffffff"
                                play.color = "#000000"
                                text2.color = "#ffffff"
                                pause.color = "#000000"
                                text3.color = "#ffffff"
                                stop.color = "#000000"
                            }

                        }
                    }
                    spacing: 10
                }
            }

            model: foldermodel
            delegate: fileDelegate
        }

    }

    MediaPlayer{
        id: videoFile
        source: "video/" + fileVideo
    }

    Rectangle {
        id: stage
        x: 680
        y: 111
        width: 1133
        height: 694
        color: "#000000"
        opacity: 0.900

        VideoOutput{
            anchors.fill: parent
            source: videoFile
        }
    }

    Text {
        id: title
        x: 685
        y: 41
        color: "#ffffff"
        text: qsTr("text")
        font.pixelSize: 50
    }

    Row {
        id: row2
        x: 933
        y: 829
        width: 627
        height: 129
        spacing: 33

        Rectangle {
            id: play
            x: 9
            y: 11
            width: 187
            height: 108
            color: "#000000"
            radius: 30
            opacity: 0.700


            MouseArea{
                anchors.fill: parent

                onClicked: {
                    videoFile.play()
                    play.color = "#ffffff"
                    text1.color = "#000000"
                    text2.color = "#ffffff"
                    pause.color = "#000000"
                    text3.color = "#ffffff"
                    stop.color = "#000000"
                }
            }

            Text {
                id: text1
                x: 55
                y: 28
                color: "#ffffff"
                text: qsTr("Play")
                font.family: mediumFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 40
            }
        }

        Rectangle {
            id: pause
            x: 216
            y: 11
            width: 187
            height: 108
            color: "#000000"
            radius: 30
            opacity: 0.800

            MouseArea{
                anchors.fill: parent

                onClicked: {
                    videoFile.pause()
                    pause.color = "#ffffff"
                    text2.color = "#000000"
                    text1.color = "#ffffff"
                    play.color = "#000000"
                    text3.color = "#ffffff"
                    stop.color = "#000000"
                }
            }

            Text {
                id: text2
                x: 40
                y: 28
                color: "#ffffff"
                text: qsTr("Pause")
                font.pixelSize: 40
                verticalAlignment: Text.AlignVCenter
                font.family: mediumFont.name
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Rectangle {
            id: stop
            x: 220
            y: 12
            width: 187
            height: 108
            color: "#000000"
            radius: 30
            opacity: 0.800

            MouseArea{
                anchors.fill: parent

                onClicked: {
                    videoFile.stop()
                    stop.color = "#ffffff"
                    text3.color = "#000000"
                    text2.color = "#ffffff"
                    pause.color = "#000000"
                    text1.color = "#ffffff"
                    play.color = "#000000"
                }
            }

            Text {
                id: text3
                x: 52
                y: 28
                color: "#ffffff"
                text: qsTr("Stop")
                font.pixelSize: 40
                verticalAlignment: Text.AlignVCenter
                font.family: mediumFont.name
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }



}
