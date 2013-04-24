import QtQuick 2.0

Rectangle {
    width: 1920
    height: 980
    color: "#000000"
    opacity: 0.700
    border.width: 3

    Rectangle {
        id: rectangle2
        x: 0
        y: 172
        width: 1920
        height: 652
        color: "#000000"
        opacity: 0.800
    }

    MouseArea {
        id: playSlideButton
        x: 674
        y: 874
        width: 253
        height: 70

        Rectangle {
            id: rectangle1
            x: 0
            y: 0
            width: 253
            height: 70
            color: "#000000"
            radius: 13
            opacity: 0.700
            border.color: "#000000"

            Text {
                id: text1
                x: 52
                y: 21
                color: "#ffffff"
                text: qsTr("Play Slideshow")
                font.family: "Exo"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 22
            }
        }
    }

    MouseArea {
        id: addPhotoButton
        x: 965
        y: 874
        width: 253
        height: 70

        Rectangle {
            id: rectangle3
            x: 0
            y: 0
            width: 253
            height: 70
            color: "#000000"
            radius: 13
            opacity: 0.700
            border.color: "#000000"
            Text {
                id: text2
                x: 70
                y: 21
                color: "#ffffff"
                text: qsTr("Add Photos")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Exo"
                font.pixelSize: 22
            }
        }
    }
}
