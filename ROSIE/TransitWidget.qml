import QtQuick 2.0
import QtWebKit 3.0

Rectangle {
    width: 600
    height: 780
    border.width: 2

    WebView {
        id: transit
        x: 1
        y: 1
        width: 598
        height: 778
        url: "http://www.etachicago.com"
    }
}
