import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    width: 1920
    height: 980
    color: mainColor

    Rectangle {
        id: rectangle1
        x: 0
        y: 41
        width: 299
        height: 899
        color: "#000000"
        opacity: 0.600
        border.color: "#ffffff"

        ListView {
            id: list_view1
            x: 19
            y: 23
            width: 262
            height: 854
            model: ListModel {
                ListElement {
                    name: "Grey"
                    colorCode: "grey"
                }

                ListElement {
                    name: "Red"
                    colorCode: "red"
                }

                ListElement {
                    name: "Blue"
                    colorCode: "blue"
                }

                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
            }
            delegate: Item {
                x: 5
                height: 40
                Row {
                    id: row1
                    Rectangle {
                        width: 40
                        height: 40
                        color: colorCode
                    }

                    Text {
                        text: name
                        font.bold: true
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    spacing: 10
                }
            }
        }
    }

    Rectangle {
        id: rectangle2
        x: 399
        y: 41
        width: 1436
        height: 694
        color: "#000000"
        opacity: 0.900
    }
}
