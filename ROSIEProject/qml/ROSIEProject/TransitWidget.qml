import QtQuick 2.0
import QtWebKit 3.0

Rectangle {
    width: 600
    height: 650
    border.width: 2
    radius: 10
    property bool draggable: true;

    Component.onCompleted: {
        var stops = "";
        //Show up to 3 saved transit stops
        if (getSetting("transit1") !== " ") {
            stops += "s1=" + getSetting("transit1");
            if (getSetting("transit2") !== " ") {
                stops += "&s2=" + getSetting("transit2");
                if (getSetting("transit3") !== " ")
                    stops+= "&s3=" + getSetting("transit3");
            }
            stops += "&";
        }
        //Load the transit information
        transit.url = "http://www.transitchicago.com/diydisplay/?"+stops + "size=big&w=0&tto=n"
    }

    WebView { //We use a browser to show the info
        id: transit
        x: 2
        y: 2
        width: 593
        height: 643
        url: ""
    }

    //Make the widget draggable
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
}
