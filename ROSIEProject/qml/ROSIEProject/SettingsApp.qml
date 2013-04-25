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

            Textbox {
                anchors.leftMargin: 80
                strText: ""
                z:999
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
