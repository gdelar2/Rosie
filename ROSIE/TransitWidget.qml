import QtQuick 2.0
import QtWebKit 3.0

Rectangle {
    width: 600
    height: 700
    border.width: 3

    WebView {
        id: transit
        x: 1
        y: 1
        width: 598
        height: 699
        url: "http://www.transitchicago.com/diydisplay/?s1=40350&s2=201&size=big&w=0&tto=n"
    }
}
