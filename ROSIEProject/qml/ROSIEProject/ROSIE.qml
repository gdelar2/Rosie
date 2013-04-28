import QtQuick 2.0
Flickable {
    width: 1360//800
    height: 760//600
    contentWidth: application.width
    contentHeight: application.height

    property string mainColor
    property string currentState: "HOME"
    property int currentUser: -1
    /**
     * The default home widgets should be enough for guests
     * they won't have access to settings anyway
     * We can just say that guests have limited widgets/apps
     */
    property string userSkeleton: '{'+
        '"username":"",'+
        '"password":"",'+
        '"avatar":"",'+
        '"dateFormat":"MM/dd/yy",'+
        '"timeFormat":"hh:mm AP",'+
        '"homepage":"http://google.com",'+
        '"city":"chicago",'+
        '"transit1":"6700",'+
        '"transit2":" ",'+
        '"transit3":" ",'+
        '"theme":"#2C3E50",'+
        '"units":"F",'+
        '"news":"http%3A%2F%2Fnews.google.com%2Fnews%3Foutput%3Drss",'+
        '"homeWidgets":['+
            '{'+
                '"name":"gallery"'+
            '},{'+
                '"name":"news"'+
            '},{'+
                '"name":"weather"'+
            '}'+
        '],'+
        '"qmWidgets":['+
            '{'+
                '"name":"gallerytiny"'+
            '},{'+
                '"name":"weather"'+
            '}'+
        '],'+
        '"qmItems":['+
            '{'+
                '"value":"SETTINGS",'+
                '"app":"settings",'+ //if app is not blank load app, else do action
                '"action":""'+
            '},{'+
                '"value":"LOGOUT",'+
                '"app":"",'+
                '"action":"logout"'+
            '}'+
        '],'+
        '"apps":{'+
            '"calendar":{'+
                '"file":"CalendarApp.qml",'+
                '"reminders":[]'+
            '},'+
            '"gallery":{'+
                '"file":"GalleryApp.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"recipe":{'+
                '"file":"RecipeApp.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"settings":{'+
                '"file":"SettingsApp.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"unitconverter":{'+
                '"file":"UnitConverterApp.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"video":{'+
                '"file":"VideoApp.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"weather":{'+
                '"file":"WeatherApp.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"webbrowser":{'+
                '"file":"WebBrowserApp.qml",'+
                '"properties":{'+
                '}'+
            '}'+
        '},'+
        '"widgets":{'+
            '"calendar":{'+
                '"file":"CalendarWidget.qml",'+
                '"properties":{'+
                    '"width":600'+
                '}'+
            '},'+
            '"gallery":{'+
                '"file":"GalleryWidget.qml",'+
                '"properties":{'+
                    '"width":600'+
                '}'+
            '},'+
            '"gallerytiny":{'+
                '"file":"GalleryTinyWidget.qml",'+
                '"properties":{'+
                    '"width":300'+
                '}'+
            '},'+
            '"musicplayer":{'+
                '"file":"MusicPlayerWidget.qml",'+
                '"properties":{'+
                    '"width":600'+
                '}'+
            '},'+
            '"news":{'+
                '"file":"NewsWidget.qml",'+
                '"properties":{'+
                    '"width":600'+
                '}'+
            '},'+
            '"recipe":{'+
                '"file":"RecipeWidget.qml",'+
                '"properties":{'+
                    '"width":600'+
                '}'+
            '},'+
            '"timer":{'+
                '"file":"TimerWidget.qml",'+
                '"properties":{'+
                    '"width":600'+
                '}'+
            '},'+
            '"todo":{'+
                '"file":"TodoListWidget.qml",'+
                '"properties":{'+
                    '"width":600'+
                '}'+
            '},'+
            '"transit":{'+
                '"file":"TransitWidget.qml",'+
                '"properties":{'+
                    '"width":600'+
                '}'+
            '},'+
            '"unitconverter":{'+
                '"file":"UnitConvertWidget.qml",'+
                '"properties":{'+
                    '"width":600'+
                '}'+
            '},'+
            '"video":{'+
                '"file":"VideoWiget.qml",'+
                '"properties":{'+
                    '"width":600'+
                '}'+
            '},'+
            '"weather":{'+
                '"file":"WeatherWidget.qml",'+
                '"properties":{'+
                    '"width":300'+
                '}'+
            '}'+
        '}'+
    '}'
    //Guest is created in onCompleted event
    property string userInfo: '[]'
    property variant picPaths:["Image/GalleryPictures/Picture (1).jpg",
        "Image/GalleryPictures/Picture (2).jpg",
        "Image/GalleryPictures/Picture (3).jpg",
        "Image/GalleryPictures/Picture (4).jpg",
        "Image/GalleryPictures/Picture (5).jpg",
        "Image/GalleryPictures/Picture (6).jpg",
        "Image/GalleryPictures/Picture (7).jpg",
        "Image/GalleryPictures/Picture (8).jpg",
        "Image/GalleryPictures/Picture (9).jpg",
        "Image/GalleryPictures/Picture (10).jpg",
        "Image/GalleryPictures/Picture (11).jpg",
        "Image/GalleryPictures/Picture (12).jpg",
        "Image/GalleryPictures/Picture (13).jpg",
        "Image/GalleryPictures/Picture (14).jpg",
        "Image/GalleryPictures/Picture (15).jpg",
        "Image/GalleryPictures/Picture (16).jpg",
        "Image/GalleryPictures/Picture (17).jpg",
        "Image/GalleryPictures/Picture (18).jpg",
        "Image/GalleryPictures/Picture (19).jpg",
        "Image/GalleryPictures/Picture (20).jpg",
        "Image/GalleryPictures/Picture (21).jpg",
        "Image/GalleryPictures/Picture(22).jpg",
        "Image/GalleryPictures/Picture(23).jpg",
        "Image/GalleryPictures/Picture(24).jpg",
    ]

    //Load fonts
    FontLoader {
        id: mediumFont
        source: "fonts/Exo-Medium.otf"
    }
    FontLoader {
        id: boldFont
        source: "fonts/Exo-Black.otf"
    }
    FontLoader {
        id: lightFont
        source: "fonts/Exo-ExtraLight.otf"
    }
    FontLoader {
        id: regularFont
        source: "fonts/Exo-Regular.otf"
    }

    function getUser(username) {
        var users = JSON.parse(userInfo)
        for(var key in users) {
            if (users[key].username === username)
                return users[key];
        }
        return null;
    }

    function getSetting(name, user) {
        if (typeof user === 'undefined')
            user = currentUser;
        var uInfo = JSON.parse(userInfo);
        var retValue = uInfo[user];
        var tmpGet = name;
        while (tmpGet.length > 0) {
            var idx = -1;
            if (tmpGet[0] === '.')
                tmpGet = tmpGet.substring(1);
            if (tmpGet[0] === '[') {
                idx = parseInt(tmpGet[1]);
                tmpGet = tmpGet.substring(3);
            }
            if (idx > -1)
                retValue = retValue[idx];
            var prop = tmpGet.match(/^[a-zA-Z0-9]*/);
            if (retValue[prop])
                retValue = retValue[prop];
            tmpGet = tmpGet.substring(prop[0].length);
        }
        return retValue;
    }

    function setSetting(name, value, user) {
        if(typeof user === 'undefined')
            user = currentUser;
        var uInfo = JSON.parse(userInfo);
        var retValue = uInfo[user];
        var startedWith = JSON.stringify(retValue);

        uInfo[user] = setSettingRecurse(retValue, name, value);

        userInfo = JSON.stringify(uInfo);
    }

    function setSettingRecurse(json, name, value) {
        if (name.length === 0)
            return value;

        var retValue = json;
        var tmpGet = name;
        var idx = -1;
        if (tmpGet[0] === '.')
            tmpGet = tmpGet.substring(1);
        if (tmpGet[0] === '[') {
            idx = parseInt(tmpGet[1]);
            tmpGet = tmpGet.substring(4);
        }
        var prop = tmpGet.match(/^[a-zA-Z]*/);
        tmpGet = tmpGet.substring(prop[0].length);
        if(idx > -1)
            json[idx][prop] = setSettingRecurse(json[idx][prop], tmpGet, value);
        else
            json[prop] = setSettingRecurse(json[prop], tmpGet, value);

        return json;
    }

    function addUser(username, password,avatar) {
        var skeleton = JSON.parse(userSkeleton)
        skeleton.username = username;
        skeleton.password = password;
        skeleton.avatar = avatar;
        var skeletonStr = JSON.stringify(skeleton);
        if (currentUser == -1) {
            userInfo = '[' + skeletonStr + ']';
            currentUser = 0;
        } else
            userInfo = userInfo.substring(0, userInfo.length - 1) + ',' + skeletonStr + ']';
        var uInfo = JSON.parse(userInfo);
        return uInfo.length - 1;
    }

    function refreshHome(removeApp) {
        if (typeof removeApp === 'undefined')
            removeApp = true;
        //load in currentUser settings
        //apps, etc.
        if (removeApp)
            removeApps();
        removeWidgets();
        removeQmWidgets();

        if (getSetting("qmWidgets[0].name") !== "-1") {
            if (getSetting("qmWidgets[0].name") === "transit")
                qMenuWidgetLoad(1, getSetting("widgets."+getSetting("qmWidgets[0].name")+".file"), false, {"scale":0.6, "y":200, "x": -122,"border.color": "#FFFFFF", "border.width": 2, "draggable": false});
            else
                qMenuWidgetLoad(1, getSetting("widgets."+getSetting("qmWidgets[0].name")+".file"), false, {"y": 300, "border.color": "#FFFFFF", "border.width": 2, "draggable": false});
        }
        if (getSetting("qmWidgets[1].name") !== "-1") {
            if (getSetting("qmWidgets[1].name") === "transit")
                qMenuWidgetLoad(2, getSetting("widgets."+getSetting("qmWidgets[1].name")+".file"), false, {"x": 1440, "scale":0.6, "y":180, "border.color": "#FFFFFF", "border.width": 2, "draggable": false, "clickable":false});
            else
                qMenuWidgetLoad(2, getSetting("widgets."+getSetting("qmWidgets[1].name")+".file"), false, {"x": 1620, "y": 300, "border.color": "#FFFFFF", "border.width": 2, "draggable": false, "clickable":false});
        }
        if (getSetting("homeWidgets[0].name") !== "-1")
            loadWidget(getSetting("widgets."+getSetting("homeWidgets[0].name")+".file"), {"x": 0,"y":300});
        if (getSetting("homeWidgets[1].name") !== "-1")
            loadWidget(getSetting("widgets."+getSetting("homeWidgets[1].name")+".file"), {"x": (1920/2)-(getSetting("widgets."+getSetting("homeWidgets[1].name")+".properties.width")/4),"y":300})
        if (getSetting("homeWidgets[2].name") !== "-1")
            loadWidget(getSetting("widgets."+getSetting("homeWidgets[2].name")+".file"), {"x": 1920-getSetting("widgets."+getSetting("homeWidgets[2].name")+".properties.width"),"y":300})
        mainColor = getSetting("theme");

        //load quick menu items

        if (currentUser == 0)
            header.toggleQuickMenu(true);
        else
            header.toggleQuickMenu(true);

        //Auto load an app you're working on
        if (removeApp) {
            if (currentUser == 0 && JSON.parse(userInfo).length === 1)
                loadApp("SettingsApp.qml", {view: 1, setSettingsEnabled:false});
            else
                loadApp("SettingsApp.qml", {});
        }
    }

    function qMenuWidgetLoad(widgetId, widget, scale, properties) {
        var quickMenu = header.getQuickMenu();
        var qMenuWidget = Qt.createComponent(widget);
        var qWidget;
        if(widgetId === 1)
            qWidget = quickMenu.getWidget1();
        else
            qWidget = quickMenu.getWidget2();
        qMenuWidget.createObject(qWidget, properties);
        if(scale)
            qWidget.scale = 0.61;
    }

    function loadApp(appQmlFile, properties) {
        currentState = "APP"
        var app = Qt.createComponent(appQmlFile);
        app.createObject(currentApp, properties);
        if (!currentApp.visible)
            currentApp.visible = true;
    }

    function loadWidget(widgetQmlFile, properties) {
        var app = Qt.createComponent(widgetQmlFile);
        app.createObject(widgetScreen, properties);
    }

    function removeQmWidgets() {
        var quickMenu = header.getQuickMenu();
        if (quickMenu.getWidget1().children.length > 0)
            quickMenu.getWidget1().children[0].destroy();
        if (quickMenu.getWidget2().children.length > 0)
            quickMenu.getWidget2().children[0].destroy();
    }

    function removeApps() {
        for (var i = 0; i < currentApp.children.length; i++) {
            currentApp.children[i].destroy();
        }
        currentApp.visible = false;
    }

    function removeWidgets() {
        for (var i = 0; i < widgetScreen.children.length; i++) {
            widgetScreen.children[i].destroy();
        }
    }

    function convertWeatherIcon(icon, checkTime) {
        var daytime = true;
        var currentDate = new Date()
        if(checkTime && (currentDate.getHours() > 19 || currentDate.getHours() < 5))
            daytime = false;
        switch(icon) {
            case "113":
                if (daytime)
                    return "Image/Weather/1.png";
                else
                    return "Image/Weather/9.png";
            case "116":
                if(daytime)
                    return "Image/Weather/2.png";
                else
                    return "Image/Weather/10.png";
            case "119":
            case "122":
            case "122":
                return "Image/Weather/3.png";
            case "176":
            case "182":
            case "185":
            case "263":
            case "266":
            case "281":
            case "293":
            case "296":
            case "317":
            case "353":
            case "362":
                if(daytime)
                    return "Image/Weather/4.png";
                else
                    return "Image/Weather/11.png";
            case "299":
            case "302":
            case "305":
            case "308":
            case "312":
            case "284":
            case "311":
            case "314":
            case "320":
            case "350":
            case "356":
            case "359":
            case "365":
            case "374":
            case "377":
            case "386":
                return "Image/Weather/5.png";
            case "200":
            case "389":
            case "392":
            case "395":
                return "Image/Weather/6.png";
            case "143":
            case "248":
            case "260":
                return "Image/Weather/7.png";
            case "179":
            case "227":
            case "230":
            case "323":
            case "326":
            case "329":
            case "332":
            case "335":
            case "338":
            case "368":
            case "371":
                return "Image/Weather/8.png";
            default: return "Image/Weather/1.png";
        }
    }

    function addPicture(){
        var path

        //getpathsomehow
        picPaths.push(path)
    }
    //Click and drag to see
    /*
    The buttons in the header hang outside the screen a bit to
    hide some of the rounded corners, this is visible when scaled
    down but isn't when full screen
    **/
    Rectangle {
        id: application
        width: 1920
        height: 1080
        color: mainColor
        //0-1 scale, doesn't work great but still gives a bit more insight as to how it looks
        scale: 0.5

       Component.onCompleted: {
           var newUser = addUser("Guest", "", "Image/User/chess.png");

           /*//Get setting example
           console.log("U: " + getSetting("username"));
           //Set setting example
           setSetting("username", "1337Guest")
           console.log("NEW U: " + getSetting("username"));*/

           /*//Get setting example
           console.log("HW[0]: " + getSetting("homeWidgets[0].name"));
           //Set setting example
           setSetting("homeWidgets[0].name", "gallery")
           console.log("NEW HW[0]: " + getSetting("homeWidgets[0].name"));
           setSetting("homeWidgets[0].name", "todo")*/
setSetting("homeWidgets[0].name", "calendar")
           refreshHome();
       }

       //Everything below this comment is where widgets should be placed

       //Rectangle to load widgets into
       Rectangle {
           id: widgetScreen
           x: 0
           width: 1920
           height: 1080
           color: mainColor
       }

       //Rectangle to load apps into
        Rectangle {
            id: currentApp
            x:0
            y:100
            visible: false
            width: 1920
            height: 1080-header.height
        }

        //header
        Header {
            id: header

            onReturnShortcutClicked: {
                if (currentUser == 0 && currentState === "HOME" && JSON.parse(userInfo).length > 1) {
                    //show login, call refreshHome() after logging in
                    loadApp("Login.qml", {});
                } else if (currentState === "HOME") {
                    //Log out
                    //Show message "You have been logged out"
                    //Activate timer to fade out message
                    currentUser = 0;
                    refreshHome();
                } else if (currentState === "APP") {
                    //Close app
                    removeApps();
                    currentState = "HOME";
                }
            }
        }

        Rectangle {
            width: 1920;
            height: 1080;
            anchors.centerIn: parent
            color: mainColor;
            visible: true

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    parent.visible=false
                }
            }

            //Needs to be replaced!!!!
            Rectangle {
                id: bg
                anchors.centerIn: parent
                height: 500
                width: 400
                border.color: "#FFF"
                border.width: 5
                color: "#000";
                opacity: 0.3
            }

            Image{
                id: welcomeImage
                anchors.top: bg.top
                anchors.topMargin: 25
                anchors.left: bg.left
                anchors.leftMargin: 75
                width: 250
                height: 250
                source: "Image/welcome.png"
            }
            Text {
                id: rtxt
                anchors.top: welcomeImage.bottom
                anchors.topMargin: 25
                anchors.horizontalCenter: welcomeImage.horizontalCenter
                font.bold: true
                font.family: boldFont.name
                font.pointSize: 36
                horizontalAlignment: Text.AlignHCenter
                text: "R.O.S.I.E"
            }
            Text {
                id: wtxt
                anchors.top: rtxt.bottom
                anchors.topMargin: 3
                anchors.horizontalCenter: rtxt.horizontalCenter
                font.bold: true
                font.family: boldFont.name
                font.pointSize: 36
                horizontalAlignment: Text.AlignHCenter
                text: "Welcomes"
            }
            Text {
                anchors.top: wtxt.bottom
                anchors.topMargin: 3
                anchors.horizontalCenter: wtxt.horizontalCenter
                font.bold: true
                font.family: boldFont.name
                font.pointSize: 36
                horizontalAlignment: Text.AlignHCenter
                text: "YOU!"
            }

            Text {
                anchors.top: bg.bottom
                anchors.topMargin: 50
                anchors.horizontalCenter: bg.horizontalCenter
                font.family: mediumFont.name
                font.pointSize: 36
                text: "Touch anywhere to proceed to the main screen"
            }
        }
    }


}
