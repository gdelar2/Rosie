import QtQuick 2.0

Rectangle {
    width: 1920
    height: 980
    color: "#000000"
    opacity: 0.700
    border.width: 3

    MouseArea {
        id: breakfastButton
        x: 0
        y: 128
        width: 495
        height: 150

        Rectangle {
            id: rectangle1
            x: -105
            y: 0
            width: 600
            height: 150
            color: "#000000"
            radius: 13
            border.width: 3
            border.color: "#000000"

            Text {
                id: text1
                x: 240
                y: 28
                width: 312
                height: 94
                color: "#ffffff"
                text: qsTr("Breakfast")
                font.bold: true
                font.family: mediumFont.bold
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 70
            }
        }
    }

    MouseArea {
        id: lunchButton
        x: 0
        y: 321
        width: 495
        height: 150

        Rectangle {
            id: rectangle2
            x: -105
            y: 0
            width: 600
            height: 150
            color: "#000000"
            radius: 13
            border.width: 3
            border.color: "#000000"

            Text {
                id: text2
                x: 240
                y: 28
                width: 312
                height: 94
                color: "#ffffff"
                text: qsTr("Lunch")
                font.pixelSize: 70
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                font.family: mediumFont.bold
                horizontalAlignment: Text.AlignRight
            }
        }
    }


    MouseArea {
        id: dinnerButton
        x: 0
        y: 514
        width: 497
        height: 153

        Rectangle {
            id: rectangle3
            x: -105
            y: 2
            width: 600
            height: 150
            color: "#000000"
            radius: 13
            border.width: 3
            border.color: "#000000"

            Text {
                id: text3
                x: 240
                y: 33
                width: 312
                height: 94
                color: "#ffffff"
                text: qsTr("Dinner")
                font.bold: true
                font.family: mediumFont.bold
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 70
            }
        }
    }

    MouseArea {
        id: snacksButton
        x: 0
        y: 711
        width: 495
        height: 150

        Rectangle {
            id: rectangle4
            x: -105
            y: 0
            width: 600
            height: 150
            color: "#000000"
            radius: 13
            border.width: 3
            border.color: "#000000"

            Text {
                id: text4
                x: 240
                y: 33
                width: 312
                height: 94
                color: "#ffffff"
                text: qsTr("Snacks")
                font.family: mediumFont.bold
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 70
            }
        }
    }

    Rectangle {
        id: rectangle5
        x: 639
        y: 116
        width: 1200
        height: 806
        color: "#000000"
        radius: 0
        border.width: 3
        opacity: 0.500
        border.color: "#000000"

        MouseArea {
            id: item1Button
            x: 65
            y: 30
            width: 1070
            height: 170

            Rectangle {
                id: rectangle6
                x: 0
                y: 0
                width: 1070
                height: 170
                color: "#000000"
                radius: 13
                border.color: "#000000"

                Image {
                    id: image1
                    x: 16
                    y: 12
                    width: 190
                    height: 145
                    source: "qrc:/qtquickplugin/images/template_image.png"
                }

                Text {
                    id: text5
                    x: 226
                    y: 12
                    width: 807
                    height: 145
                    color: "#ffffff"
                    text: qsTr("text")
                    font.family: mediumFont
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 70
                }
            }
        }

        MouseArea {
            id: item2Button
            x: 65
            y: 218
            width: 1070
            height: 170

            Rectangle {
                id: rectangle7
                x: 0
                y: 0
                width: 1070
                height: 170
                color: "#000000"
                radius: 13
                border.color: "#000000"

                Image {
                    id: image2
                    x: 16
                    y: 12
                    width: 190
                    height: 145
                    source: "qrc:/qtquickplugin/images/template_image.png"
                }

                Text {
                    id: text6
                    x: 226
                    y: 13
                    width: 807
                    height: 145
                    color: "#ffffff"
                    text: qsTr("text")
                    horizontalAlignment: Text.AlignLeft
                    font.family: mediumFont
                    font.pixelSize: 70
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        MouseArea {
            id: item3Button
            x: 65
            y: 408
            width: 1070
            height: 170

            Rectangle {
                id: rectangle8
                x: 0
                y: 0
                width: 1070
                height: 170
                color: "#000000"
                radius: 13

                Image {
                    id: image3
                    x: 16
                    y: 12
                    width: 190
                    height: 145
                    source: "qrc:/qtquickplugin/images/template_image.png"
                }

                Text {
                    id: text7
                    x: 224
                    y: 12
                    width: 807
                    height: 145
                    color: "#ffffff"
                    text: qsTr("text")
                    horizontalAlignment: Text.AlignLeft
                    font.family: mediumFont
                    font.pixelSize: 70
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        MouseArea {
            id: item4Button
            x: 65
            y: 597
            width: 1070
            height: 170

            Rectangle {
                id: rectangle9
                x: 0
                y: 0
                width: 1070
                height: 170
                color: "#000000"
                radius: 13
                border.color: "#000000"

                Image {
                    id: image4
                    x: 16
                    y: 11
                    width: 190
                    height: 145
                    source: "qrc:/qtquickplugin/images/template_image.png"
                }

                Text {
                    id: text8
                    x: 226
                    y: 11
                    width: 807
                    height: 145
                    color: "#ffffff"
                    text: qsTr("text")
                    horizontalAlignment: Text.AlignLeft
                    font.family: mediumFont
                    font.pixelSize: 70
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

    }







}
