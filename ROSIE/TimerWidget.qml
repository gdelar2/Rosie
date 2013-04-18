import QtQuick 2.0

Rectangle {
    width: 600
    height: 650
    color: "#000000"
    opacity: 0.7

    Text {
        id: convertTitle
        x: 12
        y: 10
        width: 523
        height: 48
        color: "#ffffff"
        text: qsTr("Timer")
        style: Text.Raised
        anchors.left: parent.left
        anchors.leftMargin: 12
        font.bold: true
        font.family: mediumFont.name
        verticalAlignment: Text.AlignVCenter
        opacity: 1
        font.pixelSize: 36
    }

    Rectangle {
        id: hourRectangle
        x: 12
        y: 94
        width: 200
        height: 200
        color: "#000000"

        Text {
            id: hourTitle
            x: 76
            y: 157
            color: "#ffffff"
            text: qsTr("Hour")
            font.bold: true
            font.family: mediumFont.name
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 22
        }

        Text {
            id: hour
            x: 25
            y: 3
            color: "#ffffff"
            text: qsTr("00")
            font.family: mediumFont.name
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 137
        }
    }

    Rectangle {
        id: minuteRectangle
        x: 306
        y: 94
        width: 200
        height: 200
        color: "#000000"

        Text {
            id: minuteTitle
            x: 67
            y: 160
            color: "#ffffff"
            text: qsTr("Minute")
            font.bold: true
            font.family: mediumFont.name
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: minute
            x: 27
            y: 6
            color: "#ffffff"
            text: qsTr("00")
            verticalAlignment: Text.AlignVCenter
            font.family: mediumFont.name
            font.pixelSize: 137
            horizontalAlignment: Text.AlignHCenter
        }
    }



    MouseArea {
        id: upButton1
        x: 220
        y: 108
        width: 75
        height: 75

        Rectangle {
            id: rectangle4
            x: 0
            y: 0
            width: 75
            height: 75
            color: "#000000"
            opacity: 0.800

            Text {
                id: uparrow1
                x: 23
                y: 49
                width: 30
                height: 0
                color: "#ffffff"
                text: qsTr("^")
                style: Text.Raised
                font.bold: true
                font.family: mediumFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 125
            }
        }
    }

    MouseArea {
        id: upButton2
        x: 517
        y: 108
        width: 75
        height: 75

        Rectangle {
            id: rectangle7
            x: 0
            y: 0
            width: 75
            height: 75
            color: "#000000"
            opacity: 0.800

            Text {
                id: uparrow2
                x: 23
                y: 49
                width: 30
                height: 0
                color: "#ffffff"
                text: qsTr("^")
                style: Text.Raised
                font.pixelSize: 125
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: mediumFont.name
                font.bold: true
            }
        }
    }

    MouseArea {
        id: downButton1
        x: 220
        y: 195
        width: 75
        height: 75

        Rectangle {
            id: rectangle5
            x: 0
            y: 0
            width: 75
            height: 75
            color: "#000000"
            opacity: 0.800

            Text {
                id: downarrow1
                x: 53
                y: 26
                width: 30
                height: 0
                color: "#ffffff"
                text: qsTr("^")
                rotation: 180
                style: Text.Raised
                font.pixelSize: 125
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: mediumFont.name
                font.bold: true
            }
        }
    }

    MouseArea {
        id: downButton2
        x: 517
        y: 195
        width: 75
        height: 75

        Rectangle {
            id: rectangle6
            x: 0
            y: 0
            width: 75
            height: 75
            color: "#000000"
            opacity: 0.800

            Text {
                id: downarrow2
                x: 53
                y: 25
                width: 30
                height: 0
                color: "#ffffff"
                text: qsTr("^")
                rotation: 180
                style: Text.Raised
                font.pixelSize: 125
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: mediumFont.name
                font.bold: true
            }
        }
    }


    MouseArea {
        id: startButton
        x: 12
        y: 329
        width: 241
        height: 70

        Rectangle {
            id: startRectangle
            x: 0
            y: 0
            width: 241
            height: 70
            color: "#000000"
            opacity: 0.800

            Text {
                id: startText
                x: 84
                y: 14
                color: "#ffffff"
                text: qsTr("Start")
                font.family: mediumFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 32
            }
        }
    }


    MouseArea {
        id: stopButton
        x: 345
        y: 329
        width: 241
        height: 70

        Rectangle {
            id: stopRectangle
            x: 0
            y: 0
            width: 241
            height: 70
            color: "#000000"
            opacity: 0.800

            Text {
                id: stopText
                x: 88
                y: 14
                color: "#ffffff"
                text: qsTr("Stop")
                font.pixelSize: 32
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: mediumFont.name
            }
        }
    }

    MouseArea {
        id: changeButton
        x: 180
        y: 440
        width: 241
        height: 70

        Rectangle {
            id: changeRectangle
            x: 0
            y: 0
            width: 241
            height: 70
            color: "#000000"
            opacity: 0.800

            Text {
                id: changeText
                x: 5
                y: 19
                color: "#ffffff"
                text: qsTr("Minutes / Seconds")
                font.family: mediumFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 28
            }
        }
    }
}
