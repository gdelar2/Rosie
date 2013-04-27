import QtQuick 2.0

Rectangle {
    width: 300
    height: 400
    color: "#000000"
    border.width: 2
    border.color: "#000000"
    opacity: 0.700
    radius: 13

    signal widgetClicked

    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height
    }

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
        interval:1000//milliseconds
        running: true
        repeat: true

        onTriggered: {
            picIndex++;
            if(picIndex>picArray.length){
                picIndex=0;
            }

            picArray[picIndex]
        }
    }

    Image{
        width:parent.width
        height: 339
        id: displayedImage

           // fillMode: Image.PreserveAspectFit
        source:picArray[picIndex]
    }

    MouseArea {
        id: goToGalleryButton
        x: 26
        y: 339 //277
        width: 249
        height: 61



        Rectangle {
            id: gotoGalleryBorder
            x: 0
            y: 0
            width: 249
            height: 61
            color: "#000000"
            radius: 13
            opacity: 0.700

            Text {
                id: gotoGalleryText
                x: 25
                y: 8
                width: 200
                height: 45
                color: "#ffffff"
                text: qsTr("Go To Gallery")
                font.bold: true
                font.family: mediumFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 34
            }
        }

        onClicked: {
            parent.widgetClicked()
        }
    }



}
