import QtQuick 2.0

Rectangle {
    width: 1920
    height: 980
    color: mainColor
    property string changedSetting
    property int view: 0
    signal settingChanged

    MouseArea {
        anchors.fill: parent
    }

    Rectangle {
        id: settingsChooser
        height: parent.height
        width: 390
        color: "#000000"
        opacity: .45

        Component.onCompleted: {
            showSettings(view);
            gridView.currentIndex = view;
        }

        function showSettings(view) {
            if (view === 0) {
                generalSettings.visible = true;
                accountSettings.visible = false;
                locationSettings.visible = false;
                newsSettings.visible = false;
                transitSettings.visible = false;
                browserSettings.visible = false;
                quickMenuSettings.visible = false;
            } else if (view === 1){
                generalSettings.visible = false;
                accountSettings.visible = true;
                locationSettings.visible = false;
                newsSettings.visible = false;
                transitSettings.visible = false;
                browserSettings.visible = false;
                quickMenuSettings.visible = false;
            } else if (view === 2){
                generalSettings.visible = false;
                accountSettings.visible = false;
                locationSettings.visible = true;
                newsSettings.visible = false;
                transitSettings.visible = false;
                browserSettings.visible = false;
                quickMenuSettings.visible = false;
            } else if (view === 3){
                generalSettings.visible = false;
                accountSettings.visible = false;
                locationSettings.visible = false;
                newsSettings.visible = true;
                transitSettings.visible = false;
                browserSettings.visible = false;
                quickMenuSettings.visible = false;
            } else if (view === 4){
                generalSettings.visible = false;
                accountSettings.visible = false;
                locationSettings.visible = false;
                newsSettings.visible = false;
                transitSettings.visible = true;
                browserSettings.visible = false;
                quickMenuSettings.visible = false;
            } else if (view === 5){
                generalSettings.visible = false;
                accountSettings.visible = false;
                locationSettings.visible = false;
                newsSettings.visible = false;
                transitSettings.visible = false;
                browserSettings.visible = true;
                quickMenuSettings.visible = false;
            } else if (view === 6){
                generalSettings.visible = false;
                accountSettings.visible = false;
                locationSettings.visible = false;
                newsSettings.visible = false;
                transitSettings.visible = false;
                browserSettings.visible = false;
                quickMenuSettings.visible = true;
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
            ListElement {txt:"Quick Menu";}
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
                        mainColor = "#08216F";
                    else if (selectedIndex == 1)
                        mainColor = "#8F1E00";
                    else
                        mainColor = "#008F24";
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

            MouseArea {
                anchors.fill: parent
            }

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
                property string imageSource: ""
                //Store the User's imageSource of their avatar

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
                            row1.imageSource = "Image/User/chess.png"
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
                            row1.imageSource = "Image/User/games.png"
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
                            row1.imageSource = "Image/User/light_bulb.png"
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
                            row1.imageSource = "Image/User/magic_wand.png"
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
                            row1.imageSource = "Image/User/paint_brush.png"
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
                            row1.imageSource = "Image/User/star.png"
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
                            row1.imageSource = "Image/User/target.png"
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
                            row1.imageSource = "Image/User/umbrella.png"
                        }
                    }
                }
            }

            Text {
                id: appTxt1
                x: 80
                y: 397
                color: "#000000"
                text: "Select Your 3 Apps:"
                anchors.top: parent.top
                opacity: 0.680
                font.pointSize: 64
                anchors.leftMargin: 80
                anchors.topMargin: 397
                anchors.left: parent.left
                font.family: mediumFont.name
            }

            Row {
                id: appRow1
                x: 11
                y: 525
                width: 1499
                height: 111
                spacing: 14
                property int numSelected: 0
                property var appArray: ["UnitConverWidget.qml","RecipeWidget.qml","MusicPlayerWidget.qml"]
                //appArray is what will store their top 3 apps

                Rectangle {
                    id: rectangle9
                    x: 13
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.80
                    property int stateSel: 0

                    Image {
                        id: image1
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/calculator.png"
                    }

                    Text {
                        id: text1
                        x: 17
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Unit Convertor")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 12
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(appRow1.numSelected < 3){
                                if(rectangle9.stateSel === 0){
                                    rectangle9.color = "#ffffff"
                                    rectangle9.stateSel = 1
                                    appRow1.numSelected = appRow1.numSelected + 1
                                    //if selected add the .qml widget file associated

                                }

                                else{
                                    rectangle9.color = "#000000"
                                    rectangle9.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                            else if(appRow1.numSelected === 3){
                                if(rectangle9.stateSel === 1){
                                    rectangle9.color = "#000000"
                                    rectangle9.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }
                        }
                    }
                }

                Rectangle {
                    id: rectangle10
                    x: 17
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.800
                    property int stateSel: 0

                    Image {
                        id: image2
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/music_note.png"
                    }

                    Text {
                        id: text2
                        x: 40
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Music")
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(appRow1.numSelected < 3){
                                if(rectangle10.stateSel === 0){
                                    rectangle10.color = "#ffffff"
                                    rectangle10.stateSel = 1
                                    appRow1.numSelected = appRow1.numSelected + 1

                                }

                                else{
                                    rectangle10.color = "#000000"
                                    rectangle10.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                            else if(appRow1.numSelected === 3){
                                if(rectangle10.stateSel === 1){
                                    rectangle10.color = "#000000"
                                    rectangle10.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                        }
                    }
                }

                Rectangle {
                    id: rectangle11
                    x: 14
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.800
                    property int stateSel: 0

                    Image {
                        id: image3
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/photo.png"
                    }

                    Text {
                        id: text3
                        x: 37
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Gallery")
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(appRow1.numSelected < 3){
                                if(rectangle11.stateSel === 0){
                                    rectangle11.color = "#ffffff"
                                    rectangle11.stateSel = 1
                                    appRow1.numSelected = appRow1.numSelected + 1

                                }

                                else{
                                    rectangle11.color = "#000000"
                                    rectangle11.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                            else if(appRow1.numSelected === 3){
                                if(rectangle11.stateSel === 1){
                                    rectangle11.color = "#000000"
                                    rectangle11.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                        }
                    }
                }

                Rectangle {
                    id: rectangle12
                    x: 18
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.800
                    property int stateSel: 0

                    Image {
                        id: image4
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/rss.png"
                    }

                    Text {
                        id: text4
                        x: 41
                        y: 92
                        color: "#ffffff"
                        text: qsTr("News")
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(appRow1.numSelected < 3){
                                if(rectangle12.stateSel === 0){
                                    rectangle12.color = "#ffffff"
                                    rectangle12.stateSel = 1
                                    appRow1.numSelected = appRow1.numSelected + 1

                                }

                                else{
                                    rectangle12.color = "#000000"
                                    rectangle12.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                            else if(appRow1.numSelected === 3){
                                if(rectangle12.stateSel === 1){
                                    rectangle12.color = "#000000"
                                    rectangle12.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                        }
                    }
                }

                Rectangle {
                    id: rectangle13
                    x: 19
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.800
                    property int stateSel: 0

                    Image {
                        id: image5
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/film.png"
                    }

                    Text {
                        id: text5
                        x: 22
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Video Player")
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(appRow1.numSelected < 3){
                                if(rectangle13.stateSel === 0){
                                    rectangle13.color = "#ffffff"
                                    rectangle13.stateSel = 1
                                    appRow1.numSelected = appRow1.numSelected + 1

                                }

                                else{
                                    rectangle13.color = "#000000"
                                    rectangle13.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                            else if(appRow1.numSelected === 3){
                                if(rectangle13.stateSel === 1){
                                    rectangle13.color = "#000000"
                                    rectangle13.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                        }
                    }
                }

                Rectangle {
                    id: rectangle14
                    x: 12
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.800
                    property int stateSel: 0

                    Image {
                        id: image6
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/world.png"
                    }

                    Text {
                        id: text6
                        x: 34
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Browser")
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(appRow1.numSelected < 3){
                                if(rectangle14.stateSel === 0){
                                    rectangle14.color = "#ffffff"
                                    rectangle14.stateSel = 1
                                    appRow1.numSelected = appRow1.numSelected + 1
                                }

                                else{
                                    rectangle14.color = "#000000"
                                    rectangle14.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                            else if(appRow1.numSelected === 3){
                                if(rectangle14.stateSel === 1){
                                    rectangle14.color = "#000000"
                                    rectangle14.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                        }
                    }
                }

                Rectangle {
                    id: rectangle15
                    x: 6
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.800
                    property int stateSel: 0

                    Image {
                        id: image7
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/coffee.png"
                    }

                    Text {
                        id: text7
                        x: 35
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Recipes")
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(appRow1.numSelected < 3){
                                if(rectangle15.stateSel === 0){
                                    rectangle15.color = "#ffffff"
                                    rectangle15.stateSel = 1
                                    appRow1.numSelected = appRow1.numSelected + 1

                                }

                                else{
                                    rectangle15.color = "#000000"
                                    rectangle15.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                            else if(appRow1.numSelected === 3){
                                if(rectangle15.stateSel === 1){
                                    rectangle15.color = "#000000"
                                    rectangle15.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                        }
                    }
                }

                Rectangle {
                    id: rectangle16
                    x: 19
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.800
                    property int stateSel: 0

                    Image {
                        id: image8
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/clock.png"
                    }

                    Text {
                        id: text8
                        x: 40
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Timer")
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(appRow1.numSelected < 3){
                                if(rectangle16.stateSel === 0){
                                    rectangle16.color = "#ffffff"
                                    rectangle16.stateSel = 1
                                    appRow1.numSelected = appRow1.numSelected + 1

                                }

                                else{
                                    rectangle16.color = "#000000"
                                    rectangle16.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                            else if(appRow1.numSelected === 3){
                                if(rectangle16.stateSel === 1){
                                    rectangle16.color = "#000000"
                                    rectangle16.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                        }
                    }
                }

                Rectangle {
                    id: rectangle17
                    x: 21
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.800
                    property int stateSel: 0

                    Image {
                        id: image9
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/calendar.png"
                    }

                    Text {
                        id: text9
                        x: 32
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Calendar")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 12
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(appRow1.numSelected < 3){
                                if(rectangle17.stateSel === 0){
                                    rectangle17.color = "#ffffff"
                                    rectangle17.stateSel = 1
                                    appRow1.numSelected = appRow1.numSelected + 1

                                }

                                else{
                                    rectangle17.color = "#000000"
                                    rectangle17.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                            else if(appRow1.numSelected === 3){
                                if(rectangle17.stateSel === 1){
                                    rectangle17.color = "#000000"
                                    rectangle17.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                        }
                    }
                }

                Rectangle {
                    id: rectangle18
                    x: 21
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.800
                    property int stateSel: 0

                    Image {
                        id: image10
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/cloud.png"
                    }

                    Text {
                        id: text10
                        x: 33
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Weather")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 12
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(appRow1.numSelected < 3){
                                if(rectangle18.stateSel === 0){
                                    rectangle18.color = "#ffffff"
                                    rectangle18.stateSel = 1
                                    appRow1.numSelected = appRow1.numSelected + 1

                                }

                                else{
                                    rectangle18.color = "#000000"
                                    rectangle18.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                            else if(appRow1.numSelected === 3){
                                if(rectangle18.stateSel === 1){
                                    rectangle18.color = "#000000"
                                    rectangle18.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                        }
                    }
                }

                Rectangle {
                    id: rectangle19
                    x: 21
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.800
                    property int stateSel: 0

                    Image {
                        id: image11
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/map_pin.png"
                    }

                    Text {
                        id: text11
                        x: 38
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Transit")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 12
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(appRow1.numSelected < 3){
                                if(rectangle19.stateSel === 0){
                                    rectangle19.color = "#ffffff"
                                    rectangle19.stateSel = 1
                                    appRow1.numSelected = appRow1.numSelected + 1

                                }

                                else{
                                    rectangle19.color = "#000000"
                                    rectangle19.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                            else if(appRow1.numSelected === 3){
                                if(rectangle19.stateSel === 1){
                                    rectangle19.color = "#000000"
                                    rectangle19.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                        }
                    }
                }

                Rectangle {
                    id: rectangle20
                    x: 21
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.800
                    property int stateSel: 0

                    Image {
                        id: image12
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/edit.png"
                    }

                    Text {
                        id: text12
                        x: 32
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Todo List")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 12
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(appRow1.numSelected < 3){
                                if(rectangle20.stateSel === 0){
                                    rectangle20.color = "#ffffff"
                                    rectangle20.stateSel = 1
                                    appRow1.numSelected = appRow1.numSelected + 1

                                }

                                else{
                                    rectangle20.color = "#000000"
                                    rectangle20.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                            else if(appRow1.numSelected === 3){
                                if(rectangle20.stateSel === 1){
                                    rectangle20.color = "#000000"
                                    rectangle20.stateSel = 0
                                    appRow1.numSelected = appRow1.numSelected - 1
                                }

                            }

                        }
                    }
                }

            }

            Text {
                id: passTxt1
                x: 80
                y: 671
                color: "#000000"
                text: "Password:"
                anchors.topMargin: 671
                opacity: 0.680
                anchors.leftMargin: 80
                font.family: mediumFont.name
                anchors.left: parent.left
                anchors.top: parent.top
                font.pointSize: 64
            }

            Textbox {
                id: passTxtbox1
                x: 485
                y: 670
                strText: ""
                anchors.leftMargin: 80
            }

            Rectangle {
                id: addBox
                x: 80
                y: 811
                width: 429
                height: 120
                color: "#000000"
                radius: 20
                opacity: 0.700

                Text {
                    id: addText
                    x: 82
                    y: 24
                    color: "#ffffff"
                    text: qsTr("Add User")
                    font.family: mediumFont.name
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 64
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        //User information get's stored and calls the addUser function.
                        var newUser = addUser("username", "password", "avatar_source_url");
                        setSetting("homeWidgets[0].name", "", newUser);
                        setSetting("homeWidgets[1].name", "", newUser);
                        setSetting("homeWidgets[2].name", "", newUser);
                    }
                }
            }

        }

        Rectangle {
            id: locationSettings
            anchors.fill: parent
            color: mainColor

            Textbox {
                id: locBox
                x: 80
                y: 250
                anchors.leftMargin: 80
                strText: ""
                z:999
            }

            Text {
                id: locTxt
                x: 80
                y: 120
                color: "#000000"
                text: "Location (city or zipcode):"
                opacity: 0.680
                anchors.topMargin: 120
                anchors.leftMargin: 80
                font.family: mediumFont.name
                anchors.left: parent.left
                anchors.top: parent.top
                font.pointSize: 64
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

        Rectangle {
            id: quickMenuSettings
            anchors.fill: parent
            color: mainColor

            Text {
                id: locTxt1
                x: 80
                y: 120
                color: "#000000"
                text: "Select 2 Quick Menu Widgets:"
                anchors.leftMargin: 80
                font.family: mediumFont.name
                anchors.left: parent.left
                anchors.topMargin: 120
                anchors.top: parent.top
                opacity: 0.680
                font.pointSize: 64
            }

            Row {
                id: tinyWidRow
                x: 456
                y: 250
                width: 392
                height: 111
                spacing: 28
                property int numSelected: 0

                Rectangle {
                    id: quickWidget1
                    x: 13
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.80
                    property int stateSel: 0

                    Image {
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/cloud.png"
                    }

                    Text {
                        x: 33
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Weather")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 12
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(tinyWidRow.numSelected < 2){
                                if(quickWidget1.stateSel === 0){
                                    quickWidget1.color = "#ffffff"
                                    quickWidget1.stateSel = 1
                                    tinyWidRow.numSelected = tinyWidRow.numSelected + 1
                                }

                                else{
                                    quickWidget1.color = "#000000"
                                    quickWidget1.stateSel = 0
                                    tinyWidRow.numSelected = tinyWidRow.numSelected - 1
                                }

                            }

                            else if(tinyWidRow.numSelected === 2){
                                if(quickWidget1.stateSel === 1){
                                    quickWidget1.color = "#000000"
                                    quickWidget1.stateSel = 0
                                    tinyWidRow.numSelected = tinyWidRow.numSelected - 1
                                }

                            }

                        }
                    }
                }

                Rectangle {
                    id: quickWidget2
                    x: 13
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.80
                    property int stateSel: 0

                    Image {
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/map_pin.png"
                    }

                    Text {
                        x: 37
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Transit")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 12
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(tinyWidRow.numSelected < 2){
                                if(quickWidget2.stateSel === 0){
                                    quickWidget2.color = "#ffffff"
                                    quickWidget2.stateSel = 1
                                    tinyWidRow.numSelected = tinyWidRow.numSelected + 1
                                }

                                else{
                                    quickWidget2.color = "#000000"
                                    quickWidget2.stateSel = 0
                                    tinyWidRow.numSelected = tinyWidRow.numSelected - 1
                                }

                            }

                            else if(tinyWidRow.numSelected === 2){
                                if(quickWidget2.stateSel === 1){
                                    quickWidget2.color = "#000000"
                                    quickWidget2.stateSel = 0
                                    tinyWidRow.numSelected = tinyWidRow.numSelected - 1
                                }

                            }

                        }
                    }
                }

                Rectangle {
                    id: quickWidget3
                    x: 13
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.80
                    property int stateSel: 0

                    Image {
                        x: 15
                        y: 6
                        width: 83
                        height: 83
                        source: "Image/User/photo.png"
                    }

                    Text {
                        x: 37
                        y: 92
                        color: "#ffffff"
                        text: qsTr("Gallery")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 12
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            if(tinyWidRow.numSelected < 2){
                                if(quickWidget3.stateSel === 0){
                                    quickWidget3.color = "#ffffff"
                                    quickWidget3.stateSel = 1
                                    tinyWidRow.numSelected = tinyWidRow.numSelected + 1
                                }

                                else{
                                    quickWidget3.color = "#000000"
                                    quickWidget3.stateSel = 0
                                    tinyWidRow.numSelected = tinyWidRow.numSelected - 1
                                }

                            }

                            else if(tinyWidRow.numSelected === 2){
                                if(quickWidget3.stateSel === 1){
                                    quickWidget3.color = "#000000"
                                    quickWidget3.stateSel = 0
                                    tinyWidRow.numSelected = tinyWidRow.numSelected - 1
                                }

                            }

                        }
                    }
                }

            }

        }

    }
}
