import QtQuick 2.0

Rectangle {
    width: 1920
    height: 980
    color: mainColor
    property string changedSetting
    property int view: 0
    property bool setSettingsEnabled: true

    //set up a fake mouse area behind the settings so we don't
    // click anything behind them
    MouseArea {
        anchors.fill: parent
    }

    //Display the settings list
    Rectangle {
        id: settingsChooser
        height: parent.height
        width: 390
        color: "#000000"
        opacity: .45

        Component.onCompleted: {
            //Show a certain group on load
            showSettings(view);
            gridView.currentIndex = view;
        }

        //Switch the settings group that is currently displayed
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

        //Define the groups of settings
        ListModel {
            id: accountInfoModel
            ListElement {txt:"General";}
            ListElement {txt:"Accounts";}
            ListElement {txt:"Location";}
            ListElement {txt:"News";}
            ListElement {txt:"Transit";}
            ListElement {txt:"Browser";}
            ListElement {txt:"Quick Menu";}
        }
        Component {
            id: accountDelegate
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
        //Create the list view for the groups of settings
        ListView {
            id: gridView
            enabled: setSettingsEnabled //menu choices can be disabled
            anchors.fill: parent
            model: accountInfoModel
            delegate: accountDelegate
            highlight: Rectangle { color: "#FFF" }
        }
    }

    //The settings view display for a particular group of settings
    Rectangle {
        id: settingsView
        anchors.left: settingsChooser.right
        width: parent.width - settingsChooser.width

        //General settings group
        Rectangle {
            id: generalSettings
            anchors.fill: parent
            color: mainColor
            z:2
            onVisibleChanged: {
                //When group is visible load in store options
                if (visible == true) {
                    switch (getSetting("theme")) {
                        case "#2C3E50": themeCombo.setSelectedText("Default", 0);break;
                        case "#27AE60": themeCombo.setSelectedText("Nephritis", 1);break;
                        case "#2980B9": themeCombo.setSelectedText("Belize Hole", 2);break;
                        case "#8E44AD": themeCombo.setSelectedText("Wisteria", 3);break;
                        case "#E74C3C": themeCombo.setSelectedText("Alizarin", 4);break;
                    }
                    switch (getSetting("units")) {
                        case "F": unitCombo.setSelectedText("American", 0);break;
                        case "C": unitCombo.setSelectedText("Metric", 1);break;
                    }
                    switch (getSetting("dateFormat")) {
                        case "MM/dd/yy": dateCombo.setSelectedText("Month-Day-Year", 0);break;
                        case "dd/MM/yy": dateCombo.setSelectedText("Day-Month-Year", 1);break;
                    }
                    switch (getSetting("timeFormat")) {
                        case "hh:mm AP": timeCombo.setSelectedText("12-Hour", 0);break;
                        case "hh:mm": timeCombo.setSelectedText("24-Hour", 1);break;
                    }
                }
            }

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
            //Choose a theme
            Combobox {
                id: themeCombo
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.top: themeTxt.top
                anchors.verticalCenter: themeTxt.verticalCenter
                items: ["Default", "Nephritis", "Belize Hole", "Wisteria", "Alizarin"]
                z:1000

                onComboClicked: { //Update the main color and save it
                    if (selectedIndex == 0)
                        mainColor = "#2C3E50";
                    else if (selectedIndex == 1)
                        mainColor = "#27AE60";
                    else if (selectedIndex == 2)
                        mainColor = "#2980B9";
                    else if (selectedIndex == 3)
                        mainColor = "#8E44AD";
                    else if (selectedIndex == 4)
                        mainColor = "#E74C3C";
                    setSetting("theme", mainColor);
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
            //Choose a language
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
            //Choose the types of units
            Combobox {
                id: unitCombo
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.top: unitTxt.top
                anchors.verticalCenter: unitTxt.verticalCenter
                items: ["American", "Metric"]
                z:900

                onComboClicked: {
                    //Save the new setting and update any widgets on the home screen
                    if (selectedIndex == 0)
                        setSetting("units", "F");
                    else
                        setSetting("units", "C");
                    refreshHome(false);
                }
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
            //Choose the date format
            Combobox {
                id: dateCombo
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.top: dateTxt.top
                anchors.verticalCenter: dateTxt.verticalCenter
                items: ["Month-Day-Year", "Day-Month-Year"]
                z:800

                onComboClicked: {
                    //Save the date format
                    if (selectedIndex == 0)
                        setSetting("dateFormat", "MM/dd/yy")
                    else
                        setSetting("dateFormat", "dd/MM/yy")
                }
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
            //Choose the time format
            Combobox {
                id: timeCombo
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.top: timeTxt.top
                anchors.verticalCenter: timeTxt.verticalCenter
                items: ["12-Hour", "24-Hour"]
                z:700

                onComboClicked: {
                    //Save the time format
                    if (selectedIndex == 0)
                        setSetting("timeFormat", "hh:mm AP")
                    else
                        setSetting("timeFormat", "hh:mm")
                }
            }
        }

        //Account settings group
        Rectangle {
            id: accountSettings
            anchors.fill: parent
            color: mainColor

            onVisibleChanged: {
                //If not the guest load in the users info
                if (currentUser != 0) {
                    nameTxtbox.enabled = false;
                    nameTxtbox.strText = getSetting("username");
                    modifyButton.visible = true;
                    switch (getSetting("avatar")) {
                        case "Image/User/chess.png":rectangle1.color = "#FFFFFF";break;
                        case "Image/User/games.png":rectangle2.color = "#FFFFFF";break;
                        case "Image/User/light_bulb.png":rectangle3.color = "#FFFFFF";break;
                        case "Image/User/magic_wand.png":rectangle4.color = "#FFFFFF";break;
                        case "Image/User/paint_brush.png":rectangle5.color = "#FFFFFF";break;
                        case "Image/User/star.png":rectangle6.color = "#FFFFFF";break;
                        case "Image/User/target.png":rectangle7.color = "#FFFFFF";break;
                        case "Image/User/umbrella.png":rectangle8.color = "#FFFFFF";break;
                    }
                    row1.imageSource = getSetting("avatar");
                    appRow1.numSelected = 0;
                    switch (getSetting("homeWidgets[0].name")) {
                        case "unitconverter": rectangle9.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "musicplayer": rectangle10.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "gallery": rectangle11.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "news": rectangle12.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "video": rectangle13.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "webbrowser": rectangle14.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "recipe": rectangle15.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "timer": rectangle16.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "calendar": rectangle17.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "weather": rectangle18.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "transit": rectangle19.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "todo": rectangle20.color = "#FFFFFF"; appRow1.numSelected++;break;
                    }
                    switch (getSetting("homeWidgets[1].name")) {
                        case "unitconverter": rectangle9.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "musicplayer": rectangle10.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "gallery": rectangle11.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "news": rectangle12.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "video": rectangle13.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "webbrowser": rectangle14.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "recipe": rectangle15.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "timer": rectangle16.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "calendar": rectangle17.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "weather": rectangle18.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "transit": rectangle19.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "todo": rectangle20.color = "#FFFFFF"; appRow1.numSelected++;break;

                    }
                    switch (getSetting("homeWidgets[2].name")) {
                        case "unitconverter": rectangle9.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "musicplayer": rectangle10.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "gallery": rectangle11.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "news": rectangle12.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "video": rectangle13.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "webbrowser": rectangle14.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "recipe": rectangle15.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "timer": rectangle16.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "calendar": rectangle17.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "weather": rectangle18.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "transit": rectangle19.color = "#FFFFFF"; appRow1.numSelected++;break;
                        case "todo": rectangle20.color = "#FFFFFF"; appRow1.numSelected++;break;
                    }
                    passTxtbox1.strText = getSetting("password");
                } else {
                    addBox.x = 80;
                }
            }

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
                maxChars: 8
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

            //Avatar choice
            Row {
                id: row1
                x: 370
                y: 243
                width: 1075
                height: 117
                spacing: 18
                property string imageSource: ""
                //Store the User's imageSource of their avatar

                //Display all the icons and highlight/select them when they are clicked
                // allows only 1 to be selected
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

            //Display the app choices
            Row {
                id: appRow1
                x: 80
                y: 525
                width: 1499
                height: 111
                spacing: 18
                property int numSelected: 0
                property var appArray: ["","",""]
                //appArray is what will store their top 3 apps
                property string lastMod: "";

                onNumSelectedChanged: {
                    //When the number of selected items changes
                    // we figure out whether an app was deselected
                    // or selected and either remove it from
                    // the app array or find an open spot and
                    // put the new app in
                    if (numSelected == 0) {
                        if (appArray[0] === lastMod)
                            appArray[0] = "";
                        else if (appArray[1] === lastMod)
                            appArray[1] = "";
                        else if (appArray[2] === lastMod)
                            appArray[2] = "";
                    } else if (numSelected == 1) {
                        if (appArray[0] === lastMod)
                            appArray[0] = "";
                        else if (appArray[1] === lastMod)
                            appArray[1] = "";
                        else if (appArray[2] === lastMod)
                            appArray[2] = "";
                        else {
                            if (appArray[0] === "")
                                appArray[0] = lastMod;
                            else if (appArray[1] === "")
                                appArray[1] = lastMod;
                            else if (appArray[2] === "")
                                appArray[2] = lastMod;
                        }
                    } else {
                        if (appArray[0] === "")
                            appArray[0] = lastMod;
                        else if (appArray[1] === "")
                            appArray[1] = lastMod;
                        else if (appArray[2] === "")
                            appArray[2] = lastMod;
                    }
                    lastMod = "";
                }

                //Displays all the available app choices and only allows 3
                // to be chosen
                Rectangle {
                    id: rectangle9
                    x: 13
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.80
                    property int stateSel: 0
                    property string appselection: "unitconverter"

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
                            appRow1.lastMod = "unitconverter";
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
                    property string appselection: "musicplayer"

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
                            appRow1.lastMod = "musicplayer";
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
                    property string appselection: "gallery"

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
                            appRow1.lastMod = "gallery";
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
                    property string appselection: "news"

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
                            appRow1.lastMod = "news";
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
                    property string appselection: "video"

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
                            appRow1.lastMod = "video";
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
                    id: rectangle15
                    x: 6
                    y: 0
                    width: 112
                    height: 112
                    color: "#000000"
                    opacity: 0.800
                    property int stateSel: 0
                    property string appselection: "recipe"

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
                            appRow1.lastMod = "recipe";
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
                    property string appselection: "timer"

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
                            appRow1.lastMod = "timer";
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
                    property string appselection: "calendar"

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
                            appRow1.lastMod = "calendar";
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
                    property string appselection: "weather"

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
                            appRow1.lastMod = "weather";
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
                    property string appselection: "transit"

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
                            appRow1.lastMod = "transit";
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
                    property string appselection: "todo"

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
                            appRow1.lastMod = "todo";
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

            //Allow user to define a password
            Textbox {
                id: passTxtbox1
                x: 485
                y: 670
                strText: ""
                anchors.leftMargin: 80
                z:100
            }

            //Define the account modify button
            Rectangle {
                id: modifyButton
                x: 80
                y: 811
                width: 429
                height: 120
                color: "#000000"
                radius: 20
                opacity: 0.700
                visible: false

                Text {
                    id: modifyText
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Modify")
                    font.family: mediumFont.name
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 64
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        //Update the current user with the available
                        // options when modify button is clicked
                        setSetting("avatar", row1.imageSource);
                        setSetting("password", passTxtbox1.strText);
                        if (appRow1.appArray[0] === "")
                            appRow1.appArray[0] = "-1";
                        if (appRow1.appArray[1] === "")
                            appRow1.appArray[1] = "-1";
                        if (appRow1.appArray[2] === "")
                            appRow1.appArray[2] = "-1";
                        setSetting("homeWidgets[0].name", appRow1.appArray[0]);
                        setSetting("homeWidgets[1].name", appRow1.appArray[1]);
                        setSetting("homeWidgets[2].name", appRow1.appArray[2]);
                        //close the settings and refresh the home screen
                        refreshHome();
                    }
                }
            }

            //Add user button
            Rectangle {
                id: addBox
                x: modifyButton.x + modifyButton.width + 20
                y: 811
                width: 429
                height: 120
                color: "#000000"
                radius: 20
                opacity: 0.700

                Text {
                    id: addText
                    //x: 82
                    //y: 24
                    anchors.centerIn: parent
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
                        //If the username box is disable that means the current users
                        // information is loaded in
                        // otherwise we can create a new user with the information
                        if (nameTxtbox.enabled == true) {
                            //make the new user and store the settings
                            var newUser = addUser(nameTxtbox.strText, passTxtbox1.strText, row1.imageSource);
                            if (appRow1.appArray[0] === "")
                                appRow1.appArray[0] = "-1";
                            if (appRow1.appArray[1] === "")
                                appRow1.appArray[1] = "-1";
                            if (appRow1.appArray[2] === "")
                                appRow1.appArray[2] = "-1";

                            setSetting("homeWidgets[0].name", appRow1.appArray[0], newUser);
                            setSetting("homeWidgets[1].name", appRow1.appArray[1], newUser);
                            setSetting("homeWidgets[2].name", appRow1.appArray[2], newUser);
                            //If this is the first user we want them to log in
                            if (newUser === 1)
                                loadApp("Login.qml", {});
                            else
                                refreshHome();
                        } else {
                            //Clear all the account settings to prepare for a new
                            // account
                            nameTxtbox.enabled = true;
                            nameTxtbox.strText = "";
                            passTxtbox1.strText = "";
                            //clear selected avatar
                            row1.imageSource = "";
                            rectangle1.color = "#000000";
                            rectangle2.color = "#000000";
                            rectangle3.color = "#000000";
                            rectangle4.color = "#000000";
                            rectangle5.color = "#000000";
                            rectangle6.color = "#000000";
                            rectangle7.color = "#000000";
                            rectangle8.color = "#000000";
                            //clear selected apps
                            rectangle9.color = "#000000";
                            rectangle10.color = "#000000";
                            rectangle11.color = "#000000";
                            rectangle12.color = "#000000";
                            rectangle13.color = "#000000";
                            rectangle15.color = "#000000";
                            rectangle16.color = "#000000";
                            rectangle17.color = "#000000";
                            rectangle18.color = "#000000";
                            rectangle19.color = "#000000";
                            rectangle20.color = "#000000";
                            appRow1.numSelected = 0;
                            //Hide the modify button
                            addBox.x = 80;
                            modifyButton.visible = false;
                        }
                    }
                }
            }

        }

        //Location settings group
        Rectangle {
            id: locationSettings
            anchors.fill: parent
            color: mainColor

            Textbox { //Use a textbox to get users city or zip
                id: locBox
                x: 80
                y: 250
                anchors.leftMargin: 80
                //Load in the current users setting
                strText: getSetting("city")
                z:999

                onTextEntered: {
                    setSetting("city", strText);
                }
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

        //News settings group
        Rectangle {
            id: newsSettings
            anchors.fill: parent
            color: mainColor

            onVisibleChanged: {
                if (visible) {
                    //Load in the users current choice
                    switch(getSetting("news")) {
                        case "http%3A%2F%2Fnews.google.com%2Fnews%3Foutput%3Drss": newsCombo.setSelectedText("Google News", 0);break;
                        case "http%3A%2F%2Frss.cnn.com%2Frss%2Fcnn_topstories.rss": newsCombo.setSelectedText("CNN News", 1);break;
                    }
                }
            }

            Text {
                id: newsTxt
                anchors.left: parent.left
                anchors.leftMargin: 80
                anchors.top: parent.top
                anchors.topMargin: 120
                font.family: mediumFont.name
                font.pointSize: 64
                color: "#000"
                opacity: .68
                text: "News Source:"
            }
            Combobox { //Display the choices
                id: newsCombo
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.top: newsTxt.top
                anchors.verticalCenter: newsTxt.verticalCenter
                items: ["Google News", "CNN News"]
                z:950

                onComboClicked: {
                    //Save the users choice
                    if (selectedIndex == 0)
                        setSetting("news", "http%3A%2F%2Fnews.google.com%2Fnews%3Foutput%3Drss");
                    else
                        setSetting("news", "http%3A%2F%2Frss.cnn.com%2Frss%2Fcnn_topstories.rss");
                    refreshHome(false);
                }
            }

        }

        //Transit settings group
        Rectangle {
            id: transitSettings
            anchors.fill: parent
            color: mainColor

            onVisibleChanged: {
                if(visible) {
                    //Load in the current users settings
                    transitTextbox1.strText = getSetting("transit1").replace(" ", "");
                    transitTextbox2.strText = getSetting("transit2").replace(" ", "");
                    transitTextbox3.strText = getSetting("transit3").replace(" ", "");
                }
            }

            Text {
                id: transitTxt
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 120
                font.family: mediumFont.name
                font.pointSize: 64
                color: "#000"
                opacity: .68
                text: "Monitor up to 3 stops"
            }
            //Display textboxes for the 3 possible choices
            Textbox {
                id: transitTextbox1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: transitTxt.bottom
                anchors.topMargin: 20
                strText: ""
                z:999

                onTextEntered: {
                    //Save users choice and update home screen
                    if (strText != "")
                        setSetting("transit1", strText);
                    else
                        setSetting("transit1", " ");
                    refreshHome(false);
                }
            }
            Textbox {
                id: transitTextbox2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: transitTextbox1.bottom
                anchors.topMargin: 20
                strText: ""
                z:999

                onTextEntered: {
                    //Save users choice and update home screen
                    if (strText != "")
                        setSetting("transit2", strText);
                    else
                        setSetting("transit2", " ");
                    refreshHome(false);
                }
            }
            Textbox {
                id: transitTextbox3
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: transitTextbox2.bottom
                anchors.topMargin: 20
                strText: ""
                z:999

                onTextEntered: {
                    //Save users choice and update home screen
                    if (strText != "")
                        setSetting("transit3", strText);
                    else
                        setSetting("transit3", " ");
                    refreshHome(false);
                }
            }
        }

        //Web browser settings group
        Rectangle {
            id: browserSettings
            anchors.fill: parent
            color: mainColor

            onVisibleChanged: {
                if(visible) {
                    //Load in the current users settings
                    homepageTextbox.strText = getSetting("homepage");
                }
            }

            Text {
                id: homepageTxt
                anchors.left: parent.left
                anchors.leftMargin: 80
                anchors.top: parent.top
                anchors.topMargin: 120
                font.family: mediumFont.name
                font.pointSize: 64
                color: "#000"
                opacity: .68
                text: "Homepage:"
            }
            Textbox { //Allow user to specify a homepage
                id: homepageTextbox
                anchors.right: parent.right
                anchors.rightMargin: 200
                anchors.top: homepageTxt.top
                anchors.verticalCenter: homepageTxt.verticalCenter
                strText: ""
                z:999

                onTextEntered: {
                    if (strText != "")
                        setSetting("homepage", strText);
                }
            }
        }

        //Quick menu settings group
        Rectangle {
            id: quickMenuSettings
            anchors.fill: parent
            color: mainColor

            onVisibleChanged: {
                if (visible) {
                    //Load in the current users choices
                    switch (getSetting("qmWidgets[0].name")) {
                        case "weather": quickWidget1.color = "#ffffff"; quickWidget1.stateSel = 1; tinyWidRow.numSelected++; break;
                        case "transit": quickWidget2.color = "#ffffff"; quickWidget2.stateSel = 1; tinyWidRow.numSelected++; break;
                        case "gallerytiny": quickWidget3.color = "#ffffff"; quickWidget3.stateSel = 1; tinyWidRow.numSelected++; break;
                    }
                    switch (getSetting("qmWidgets[1].name")) {
                        case "weather": quickWidget1.color = "#ffffff"; quickWidget1.stateSel = 1; tinyWidRow.numSelected++; break;
                        case "transit": quickWidget2.color = "#ffffff"; quickWidget2.stateSel = 1; tinyWidRow.numSelected++; break;
                        case "gallerytiny": quickWidget3.color = "#ffffff"; quickWidget3.stateSel = 1; tinyWidRow.numSelected++; break;
                    }
                }
            }

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

            //Allow user to display two quick menu widgets
            Row {
                id: tinyWidRow
                x: 456
                y: 250
                width: 392
                height: 111
                spacing: 28
                property int numSelected: 0
                property string lastMod: ""

                onNumSelectedChanged: {
                    //When the number of selected items changes
                    // we determine whether we need to remove an app choice
                    // or add one in. We save the setting
                    if (numSelected == 0) {
                        if (getSetting("qmWidgets[0].name") === lastMod)
                            setSetting("qmWidgets[0].name", "-1");
                        else if (getSetting("qmWidgets[1].name") === lastMod)
                            setSetting("qmWidgets[1].name", "-1");
                    } else if (numSelected == 1) {
                        if (getSetting("qmWidgets[0].name") === lastMod)
                            setSetting("qmWidgets[0].name", "-1");
                        else if (getSetting("qmWidgets[1].name") === lastMod)
                            setSetting("qmWidgets[1].name", "-1");
                        else {
                            if (getSetting("qmWidgets[0].name") === "-1")
                                setSetting("qmWidgets[0].name", lastMod);
                            else if (getSetting("qmWidgets[1].name") === "-1")
                                setSetting("qmWidgets[1].name", lastMod);
                        }
                    } else {
                        if (getSetting("qmWidgets[0].name") === "-1")
                            setSetting("qmWidgets[0].name", lastMod);
                        else if (getSetting("qmWidgets[1].name") === "-1")
                            setSetting("qmWidgets[1].name", lastMod);
                    }
                    lastMod = "";
                    //Refresh the home screen
                    refreshHome(false);
                }

                //Display the widget choices, allow only 2 to be selected
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
                            tinyWidRow.lastMod = "weather";
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
                            tinyWidRow.lastMod = "transit";
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
                            tinyWidRow.lastMod = "gallerytiny";
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
