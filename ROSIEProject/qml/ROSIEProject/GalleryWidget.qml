import QtQuick 2.0
//import QtQuick 1.1
Rectangle {
    width: 600
    height: 650
    color: "#000000"
    opacity: 0.7


    signal widgetClicked
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
        width:600
        height: 650-48
        id: displayedImage
        y:55

        source:picArray[picIndex]
    }

    //drag code
    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height
    }


    MouseArea{
        anchors.fill: parent
        onClicked:{
            parent.widgetClicked()
        }

    }

    Text {
        id: convertTitle
        x: 0
        y: 0
        width: 523
        height: 48
        color: "#ffffff"
        text: qsTr("Gallery")
        style: Text.Raised
        anchors.left: parent.left
        anchors.leftMargin: 12
        font.bold: true
        font.family: mediumFont.name
        verticalAlignment: Text.AlignVCenter
        opacity: 1
        font.pixelSize: 36
    }


}
