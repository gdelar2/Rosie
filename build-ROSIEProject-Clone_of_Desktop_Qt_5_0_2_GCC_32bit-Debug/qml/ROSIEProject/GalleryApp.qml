import QtQuick 2.0

Rectangle {
    width: 1920
    height: 980
    color: "#000000"
    opacity: 0.700
    border.width: 3


    property var picArray:["Image/GalleryPictures/Picture (1).jpg",
        "Image/GalleryPictures/Picture (2).jpg",
        "Image/GalleryPictures/Picture (3).jpg",
        "Image/GalleryPictures/Picture (4).jpg",
        "Image/GalleryPictures/Picture (5).jpg",
        "Image/GalleryPictures/Picture (6).jpg",
        "Image/GalleryPictures/Picture (7).jpg",
        "Image/GalleryPictures/Picture (8).jpg",
        "Image/GalleryPictures/Picture (9).jpg",
        "Image/GalleryPictures/Picture (10).jpg",
        "Image/GalleryPictures/Picture (11).jpg",
        "Image/GalleryPictures/Picture (12).jpg",
        "Image/GalleryPictures/Picture (13).jpg",
        "Image/GalleryPictures/Picture (14).jpg",
        "Image/GalleryPictures/Picture (15).jpg",
        "Image/GalleryPictures/Picture (16).jpg",
        "Image/GalleryPictures/Picture (17).jpg",
        "Image/GalleryPictures/Picture (18).jpg",
        "Image/GalleryPictures/Picture (19).jpg",
        "Image/GalleryPictures/Picture (20).jpg",
        "Image/GalleryPictures/Picture (21).jpg",
        ]
    property int picIndex:0


    Timer{
        id:timer
        interval:1000//milliseconds
        running: false
        repeat: true

        onTriggered: {
            picIndex++;
            if(picIndex>picArray.length){
                picIndex=0;
            }

            picArray[picIndex]
        }
    }




    Rectangle {

        x: 0
        y: 172
        width: 1920
        height: 652
        color: "#000000"
        opacity: 0.800

        id: displayedImageRectangle

        Image {

          //  x: 0
           // y: 172
            width: 1920
            height: 652

          //  opacity: 0.800

            id: displayedImage
            fillMode: Image.PreserveAspectFit

            source:picArray[picIndex]
        }




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

        onClicked: {
            timer.running=!(timer.running)
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
