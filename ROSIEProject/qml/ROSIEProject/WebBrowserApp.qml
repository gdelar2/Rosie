import QtQuick 2.0
import QtWebKit 3.0

Rectangle {
    width: 1920
    height: 980
    color: mainColor
    //Load the users homepage on open
    property string webUrl: getSetting("homepage");

    WebView{
        id: webview1
        x: 32
        y: 190
        width: 1856
        height: 736

        url: webUrl

    }

    //Textbox for url
    Textbox {
        id: textbox1
        x: 306
        y: 80
        width: 980
        strText: "http://"
    }

    //Various browser controls
    Image {
        id: back
        x: 42
        y: 81
        width: 100
        height: 100
        source: "Image/Browser/left_arrow.png"

        MouseArea{
            anchors.fill: parent

            onClicked:{
                webview1.goBack()
            }
        }
    }

    Image {
        id: forward
        x: 169
        y: 81
        width: 100
        height: 100
        source: "Image/Browser/right_arrow.png"

        MouseArea{
            anchors.fill: parent

            onClicked: {
                webview1.goForward()
            }
        }
    }

    Image {
        id: refresh
        x: 1420
        y: 81
        width: 100
        height: 100
        source: "Image/Browser/refresh.png"

        MouseArea{
            anchors.fill: parent

            onClicked: {
                webview1.reload()
            }
        }
    }

    Image {
        id: home
        x: 1556
        y: 81
        width: 100
        height: 100
        source: "Image/Browser/home.png"

        MouseArea{
            anchors.fill: parent

            onClicked: {
                webview1.url = getSetting("homepage");
            }
        }
    }

    Rectangle {
        id: rectangle2
        x: 1294
        y: 81
        width: 100
        height: 100
        color: "#000000"
        opacity: 0.700

        Text {
            id: text1
            x: 16
            y: 16
            color: "#ffffff"
            text: qsTr("GO")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: mediumFont.name
            font.pixelSize: 53
        }

        MouseArea{
            anchors.fill: parent

            onClicked: {
                webview1.url = textbox1.strText
            }
        }
    }
}
