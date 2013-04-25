import QtQuick 2.0
import QtWebKit 3.0

Rectangle {
    width: 1920
    height: 980
    color: mainColor

    WebView{
        id: webview1
        x: 32
        y: 190
        width: 1856
        height: 736

        url: "http://www.google.com"
    }


    Rectangle {
        id: rectangle1
        x: 302
        y: 90
        width: 957
        height: 82
        color: "#000000"
        opacity: 0.700

        TextInput {
            id: urltext
            x: 14
            y: 6
            width: 930
            height: 71
            color: "#ffffff"
            text: qsTr("http://")
            selectedTextColor: "#5a2b2b"
            selectionColor: "#884f3b"
            font.family: mediumFont.name
            font.pixelSize: 55
        }
    }

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
                webview1.url = "http://www.google.com"
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
                webview1.url = urltext.text
            }
        }
    }

}
