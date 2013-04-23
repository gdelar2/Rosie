import QtQuick 2.0

Rectangle {
    width: 300
    height: 400
    color: "#000000"
    border.width: 2
    border.color: "#000000"
    opacity: 0.700
    radius: 13

    Image {
        id: currentPicture
        x: 14
        y: 20
        width: 271
        height: 227
        source: "qrc:/qtquickplugin/images/template_image.png"
    }

    MouseArea {
        id: goToGalleryButton
        x: 26
        y: 277
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
    }

    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height
    }

}
