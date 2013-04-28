import QtQuick 2.0

Rectangle {
    width: 600
    height: 650
    color: "#000000"
    opacity: 0.7
    radius: 13
    property bool draggable: true;
    property var newsData
    property int curIndex: 0

    Component.onCompleted: {
        getData();
    }

    function getData(){
        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function() {
           if (doc.readyState === XMLHttpRequest.DONE) {
               newsData = JSON.parse(doc.responseText);
               ticker.start();
               ticker.triggeredOnStart = true;
           }
        }
        doc.open("GET", "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=8&q=" + getSetting("news"));
        doc.send();
    }

    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height

        //clicking here opens up the WebBrowserApp with the appropriate headline link
        onClicked: {
            loadApp("WebBrowserApp.qml", {webUrl: newsData.responseData.feed.entries[curIndex].link})
        }

        onPressed: {
            if(!draggable)
                drag.target = null;
        }
    }

    Timer {
        id: ticker
        interval:10000//milliseconds
        running: false
        repeat: true

        onTriggered: {
            if (curIndex >= newsData.responseData.feed.entries.length)
                curIndex = 0;
            title.text = newsData.responseData.feed.title;
            var head =  newsData.responseData.feed.entries[curIndex].title;
            while (head.match(/&#39;/))
                head = head.replace("&#39;", "'");
            for (var i = 0; i < head.length; ++i) {
                if (i % 28 == 0 && i != 0) {
                    head = head.substring(0, i) + "\n" + head.substring(i, head.length);
                }
            }
            headline.text = head;
            var bod = newsData.responseData.feed.entries[curIndex].contentSnippet;
            while (bod.match(/&#39;/))
                bod = bod.replace("&#39;", "'");
            for (i = 0; i < bod.length; ++i) {
                if (i % 31 == 0 && i != 0) {
                    bod = bod.substring(0, i) + "\n" + bod.substring(i, bod.length);
                }
            }
            body.text = bod;
            curIndex++;
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
        text: qsTr("LOADING FEED...")
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

        //be able to pull (if possible) a photo from the headline
    }

    Rectangle {
        id: textBackground
        x: 40
        y: 372
        width: 521
        height: 250
        color: "#000000"

        Text {
            id: body
            x: 10
            y: 12
            width: 501
            height: 226
            color: "#ffffff"
            text: qsTr("")
            font.family: mediumFont.name
            font.pixelSize: 32

            //a small beginning part of the article
        }
    }


}
