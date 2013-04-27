import QtQuick 2.0

Rectangle {
    width: 600
    height: 650
    color: "#000000"
    opacity: 0.7
    property bool draggable: true;

    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height

        //clicking here opens up the WebBrowserApp with the appropriate headline link

        onPressed: {
            if(!draggable)
                drag.target = null;
        }
    }

    Text {
        id: title
        x: 12
        y: 10
        width: 523
        height: 48
        color: "#ffffff"
        text: qsTr("News")
        style: Text.Raised
        anchors.left: parent.left
        anchors.leftMargin: 12
        font.bold: true
        font.family: mediumFont.name
        verticalAlignment: Text.AlignVCenter
        opacity: 1
        font.pixelSize: 36
    }

    Text {
        id: headline
        x: 40
        y: 91
        width: 521
        height: 90
        color: "#ffffff"
        text: qsTr("Headline Goes Here")
        font.family: mediumFont.name
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 40

        //title of the news article
    }

    Image {
        id: pressPhoto
        x: 162
        y: 185
        width: 277
        height: 217
        source: "qrc:/qtquickplugin/images/template_image.png"

        //be able to pull (if possible) a photo from the headline
    }

    Rectangle {
        id: textBackground
        x: 40
        y: 432
        width: 521
        height: 200
        color: "#000000"

        Text {
            id: body
            x: 10
            y: 12
            width: 501
            height: 176
            color: "#ffffff"
            text: qsTr("text")
            font.family: mediumFont.name
            font.pixelSize: 20

            //a small beginning part of the article
        }
    }


}
