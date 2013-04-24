import QtQuick 2.0
import Qt.labs.folderlistmodel 1.0
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

        ListView {
            id: list_view1
            x: 19
            y: 23
            width: 262
            height: 854
            highlightRangeMode: ListView.ApplyRange
            flickDeceleration: 1748

            FolderListModel{
                id: foldermodel
                folder: "video"
                nameFilters: ["*.*"]
            }

            Component {
                id: fileDelegate
                Row {
                    id: row1

                    Text {
                        color: "#ffffff"
                        text: fileName
                        font.pointSize: 20
                        style: Text.Sunken
                        wrapMode: Text.WordWrap
                        font.family: mediumFont.name
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: false

                        MouseArea {
                            id: mouse_area1
                            z: 1
                            hoverEnabled: false
                            anchors.fill: parent

                            onClicked: {
                                text1.text = fileName
                            }

                        }
                    }
                    spacing: 10
                }
            }

            model: foldermodel
            delegate: fileDelegate
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

    Text {
        id: text1
        x: 446
        y: 457
        color: "#ffffff"
        text: qsTr("text")
        font.pixelSize: 50
    }



}
