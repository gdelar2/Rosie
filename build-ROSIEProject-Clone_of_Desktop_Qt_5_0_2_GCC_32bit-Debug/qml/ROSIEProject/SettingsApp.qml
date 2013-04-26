import QtQuick 2.0

Rectangle {
    width: 1920
    height: 980
    color: mainColor
    property string changedSetting
    signal settingChanged

    Rectangle {
        id: settingsChooser
        height: parent.height
        width: 390
        color: "#000000"
        opacity: .45

        Component.onCompleted: {
            showSettings(0);
        }

        function showSettings(view) {
            if (view === 0) {
                generalSettings.visible = true;
                accountSettings.visible = false;
                locationSettings.visible = false;
                newsSettings.visible = false;
                transitSettings.visible = false;
                browserSettings.visible = false;
            } else if (view === 1){
                generalSettings.visible = false;
                accountSettings.visible = true;
                locationSettings.visible = false;
                newsSettings.visible = false;
                transitSettings.visible = false;
                browserSettings.visible = false;
            } else if (view === 2){
                generalSettings.visible = false;
                accountSettings.visible = false;
                locationSettings.visible = true;
                newsSettings.visible = false;
                transitSettings.visible = false;
                browserSettings.visible = false;
            } else if (view === 3){
                generalSettings.visible = false;
                accountSettings.visible = false;
                locationSettings.visible = false;
                newsSettings.visible = true;
                transitSettings.visible = false;
                browserSettings.visible = false;
            } else if (view === 4){
                generalSettings.visible = false;
                accountSettings.visible = false;
                locationSettings.visible = false;
                newsSettings.visible = false;
                transitSettings.visible = true;
                browserSettings.visible = false;
            } else if (view === 5){
                generalSettings.visible = false;
                accountSettings.visible = false;
                locationSettings.visible = false;
                newsSettings.visible = false;
                transitSettings.visible = false;
                browserSettings.visible = true;
            }
        }

        ListModel {
            id: calendarInfoModel
            ListElement {txt:"General";}
            ListElement {txt:"Accounts";}
            ListElement {txt:"Location";}
            ListElement {txt:"News";}
            ListElement {txt:"Transit";}
            ListElement {txt:"Browser";}
        }
        Component {
            id: calendarDelegate
            Rectangle {
                width: parent.width
                height: 100
                color: mainColor
                Text {
                    anchors.centerIn: parent
                    font.family: mediumFont.name
                    font.pointSize: 45
                    color: "#FFF"
                    text: txt
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        gridView.currentIndex = index;
                        settingsChooser.showSettings(index);
                    }
                }
            }
        }
        //Create the gridview that displays weather information in the block
        ListView {
            id: gridView
            anchors.fill: parent
            model: calendarInfoModel
            delegate: calendarDelegate
            highlight: Rectangle { color: "#FFF" }
        }
    }

    Rectangle {
        id: settingsView
        anchors.left: settingsChooser.right
        width: parent.width - settingsChooser.width

        Rectangle {
            id: generalSettings
            anchors.fill: parent
            color: mainColor
            z:2


            Text {
                id: themeTxt
                anchors.left: parent.left
                anchors.leftMargin: 80
                anchors.top: parent.top
                anchors.topMargin: 120
                font.family: mediumFont.name
                font.pointSize: 64
                color: "#000"
                opacity: .68
                text: "Theme:"
            }
            Combobox {
                id: themeCombo
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.top: themeTxt.top
                anchors.verticalCenter: themeTxt.verticalCenter
                items: ["Default", "Red", "Green"]
                z:1000

                onComboClicked: {
                    if (selectedIndex == 0)
                        mainColor = "#0e51a7";
                    else if (selectedIndex == 1)
                        mainColor = "red";
                    else
                        mainColor = "green";
                }
            }
            Text {
                id: langTxt
                anchors.left: parent.left
                anchors.leftMargin: 80
                anchors.top: themeTxt.bottom
                anchors.topMargin: 20
                font.family: mediumFont.name
                font.pointSize: 64
                color: "#000"
                opacity: .68
                text: "Language:"
            }
            Combobox {
                id: langCombo
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.top: langTxt.top
                anchors.verticalCenter: langTxt.verticalCenter
                items: ["English", "Spanish"]
                z:950
            }

            Text {
                id: unitTxt
                anchors.left: parent.left
                anchors.leftMargin: 80
                anchors.top: langTxt.bottom
                anchors.topMargin: 20
                font.family: mediumFont.name
                font.pointSize: 64
                color: "#000"
                opacity: .68
                text: "Units:"
            }
            Combobox {
                id: unitCombo
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.top: unitTxt.top
                anchors.verticalCenter: unitTxt.verticalCenter
                items: ["American", "Metric"]
                z:900
            }

            Text {
                id: dateTxt
                anchors.left: parent.left
                anchors.leftMargin: 80
                anchors.top: unitTxt.bottom
                anchors.topMargin: 20
                font.family: mediumFont.name
                font.pointSize: 64
                color: "#000"
                opacity: .68
                text: "Date Format:"
            }
            Combobox {
                id: dateCombo
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.top: dateTxt.top
                anchors.verticalCenter: dateTxt.verticalCenter
                items: ["Month-Day-Year", "Day-Month-Year"]
                z:800
            }

            Text {
                id: timeTxt
                anchors.left: parent.left
                anchors.leftMargin: 80
                anchors.top: dateTxt.bottom
                anchors.topMargin: 20
                font.family: mediumFont.name
                font.pointSize: 64
                color: "#000"
                opacity: .68
                text: "Time Format:"
            }
            Combobox {
                id: timeCombo
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.top: timeTxt.top
                anchors.verticalCenter: timeTxt.verticalCenter
                items: ["12-Hour", "24-Hour"]
                z:700
            }
        }

        Rectangle {
            id: accountSettings
            anchors.fill: parent
            color: mainColor

            Text {
                id: nameTxt
                anchors.left: parent.left
                anchors.leftMargin: 80
                anchors.top: parent.top
                anchors.topMargin: 120
                font.family: mediumFont.name
                font.pointSize: 64
                color: "#000"
                opacity: .68
                text: "Name:"
            }


            Textbox {
                id: nameTxtbox
                anchors.leftMargin: 80
                strText: ""
                x: 400
                y: 120
                z:999
            }

            Text {
                id: avatarTxt
                x: 80
                y: 253
                color: "#000000"
                text: "Avatar:"
                anchors.topMargin: 253
                anchors.top: parent.top
                font.pointSize: 64
                anchors.leftMargin: 80
                anchors.left: parent.left
                font.family: mediumFont.name
                opacity: 0.680
            }

            Row {
                id: row1
                x: 370
                y: 243
                width: 1075
                height: 117
                spacing: 18

                Rectangle {
                    id: rectangle1
                    x: 0
                    y: 0
                    width: 118
                    height: 117
                    color: "#000000"
                    opacity: 0.800

                    Image {
                        width: 118
                        height: 117
                        source: "Image/User/chess.png"
                    }

                    MouseArea{
                        anchors.fill: parent

                        onClicked: {
                            rectangle1.color = "#ffffff"
                            rectangle2.color = "#000000"
                            rectangle3.color = "#000000"
                            rectangle4.color = "#000000"
                            rectangle5.color = "#000000"
                            rectangle6.color = "#000000"
                            rectangle7.color = "#000000"
                            rectangle8.color = "#000000"
                        }
                    }
                }

                Rectangle {
                    id: rectangle2
                    x: 8
                    y: 0
                    width: 118
                    height: 117
                    color: "#000000"
                    opacity: 0.800

                    Image {
                        width: 118
                        height: 117
                        source: "Image/User/games.png"
                    }

                    MouseArea{
                        anchors.fill: parent

                        onClicked: {
                            rectangle2.color = "#ffffff"
                            rectangle1.color = "#000000"
                            rectangle3.color = "#000000"
                            rectangle4.color = "#000000"
                            rectangle5.color = "#000000"
                            rectangle6.color = "#000000"
                            rectangle7.color = "#000000"
                            rectangle8.color = "#000000"
                        }
                    }
                }

                Rectangle {
                    id: rectangle3
                    x: -3
                    y: 0
                    width: 118
                    height: 117
                    color: "#000000"
                    opacity: 0.800

                    Image {
                        width: 118
                        height: 117
                        source: "Image/User/light_bulb.png"
                    }

                    MouseArea{
                        anchors.fill: parent

                        onClicked: {
                            rectangle3.color = "#ffffff"
                            rectangle2.color = "#000000"
                            rectangle1.color = "#000000"
                            rectangle4.color = "#000000"
                            rectangle5.color = "#000000"
                            rectangle6.color = "#000000"
                            rectangle7.color = "#000000"
                            rectangle8.color = "#000000"
                        }
                    }
                }

                Rectangle {
                    id: rectangle4
                    x: -8
                    y: 0
                    width: 118
                    height: 117
                    color: "#000000"
                    opacity: 0.800

                    Image {
                        width: 118
                        height: 117
                        source: "Image/User/magic_wand.png"
                    }

                    MouseArea{
                        anchors.fill: parent

                        onClicked: {
                            rectangle4.color = "#ffffff"
                            rectangle2.color = "#000000"
                            rectangle3.color = "#000000"
                            rectangle1.color = "#000000"
                            rectangle5.color = "#000000"
                            rectangle6.color = "#000000"
                            rectangle7.color = "#000000"
                            rectangle8.color = "#000000"
                        }
                    }
                }

                Rectangle {
                    id: rectangle5
                    x: -3
                    y: 0
                    width: 118
                    height: 117
                    color: "#000000"
                    opacity: 0.800

                    Image {
                        width: 118
                        height: 117
                        source: "Image/User/paint_brush.png"
                    }

                    MouseArea{
                        anchors.fill: parent

                        onClicked: {
                            rectangle5.color = "#ffffff"
                            rectangle2.color = "#000000"
                            rectangle3.color = "#000000"
                            rectangle4.color = "#000000"
                            rectangle1.color = "#000000"
                            rectangle6.color = "#000000"
                            rectangle7.color = "#000000"
                            rectangle8.color = "#000000"
                        }
                    }
                }

                Rectangle {
                    id: rectangle6
                    x: -2
                    y: 0
                    width: 118
                    height: 117
                    color: "#000000"
                    opacity: 0.800

                    Image {
                        width: 118
                        height: 117
                        source: "Image/User/star.png"
                    }

                    MouseArea{
                        anchors.fill: parent

                        onClicked: {
                            rectangle6.color = "#ffffff"
                            rectangle2.color = "#000000"
                            rectangle3.color = "#000000"
                            rectangle4.color = "#000000"
                            rectangle5.color = "#000000"
                            rectangle1.color = "#000000"
                            rectangle7.color = "#000000"
                            rectangle8.color = "#000000"
                        }
                    }
                }

                Rectangle {
                    id: rectangle7
                    x: 1
                    y: 0
                    width: 118
                    height: 117
                    color: "#000000"
                    opacity: 0.800

                    Image {
                        width: 118
                        height: 117
                        source: "Image/User/target.png"
                    }

                    MouseArea{
                        anchors.fill: parent

                        onClicked: {
                            rectangle7.color = "#ffffff"
                            rectangle2.color = "#000000"
                            rectangle3.color = "#000000"
                            rectangle4.color = "#000000"
                            rectangle5.color = "#000000"
                            rectangle6.color = "#000000"
                            rectangle1.color = "#000000"
                            rectangle8.color = "#000000"
                        }
                    }
                }

                Rectangle {
                    id: rectangle8
                    x: -1
                    y: 0
                    width: 118
                    height: 117
                    color: "#000000"
                    opacity: 0.800

                    Image {
                        width: 118
                        height: 117
                        source: "Image/User/umbrella.png"
                    }

                    MouseArea{
                        anchors.fill: parent

                        onClicked: {
                            rectangle8.color = "#ffffff"
                            rectangle2.color = "#000000"
                            rectangle3.color = "#000000"
                            rectangle4.color = "#000000"
                            rectangle5.color = "#000000"
                            rectangle6.color = "#000000"
                            rectangle7.color = "#000000"
                            rectangle1.color = "#000000"
                        }
                    }
                }
            }
        }

        Rectangle {
            id: locationSettings
            anchors.fill: parent
            color: mainColor

            Textbox {
                anchors.leftMargin: 80
                strText: ""
                z:999
            }
        }

        Rectangle {
            id: newsSettings
            anchors.fill: parent
            color: mainColor

            Textbox {
                anchors.leftMargin: 80
                strText: ""
                z:999
            }
        }

        Rectangle {
            id: transitSettings
            anchors.fill: parent
            color: mainColor

            Textbox {
                anchors.leftMargin: 80
                strText: ""
                z:999
            }
        }

        Rectangle {
            id: browserSettings
            anchors.fill: parent
            color: mainColor

            Textbox {
                anchors.leftMargin: 80
                strText: ""
                z:999
            }
        }
    }
}
