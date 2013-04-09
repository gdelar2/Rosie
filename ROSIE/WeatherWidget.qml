import QtQuick 1.1

Rectangle {
    width: 300
    height: 400
    color: "#000000"
    border.width: 2
    border.color: "#000000"
    opacity: 0.700

    Image {
        id: image1
        x: 72
        y: 5
        width: 156
        height: 149
        source: "qrc:/qtquickplugin/images/template_image.png"
    }

    Text {
        id: currentTemp
        x: 112
        y: 162
        text: qsTr("text")
        font.bold: true
        font.family: "Exo"
        color: "#FFFFFF"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 40
    }

    Text {
        id: maxTemp
        x: 199
        y: 214
        text: qsTr("text")
        font.bold: true
        font.family: "Exo"
        color: "#FFFFFF"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 40
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: minTemp
        x: 35
        y: 214
        text: qsTr("text")
        font.bold: true
        font.family: "Exo"
        color: "#FFFFFF"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 40
        verticalAlignment: Text.AlignVCenter
    }

}
