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
    property bool draggable: true;

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

    property variant picArray
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
