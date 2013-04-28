import QtQuick 2.0
Flickable {
    width: 1360//800
    height: 760//600
    contentWidth: application.width
    contentHeight: application.height

    property string mainColor: "#08216F" //"#008F24" //"#8F1E00"
    property string currentState: "HOME"
    property int currentUser: -1
    property string userSkeleton: '{'+
        '"username":"",'+
        '"password":"",'+
        '"avatar":"",'+
        '"dateFormat":"MM/dd/yy",'+
        '"timeFormat":"hh:mm AP",'+
        '"homeWidgets":['+
            '{'+
                '"name":"news"'+
            '},{'+
                '"name":"unitconverter"'+
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
                '"properties":{'+
                '}'+
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
                '}'+
            '},'+
            '"gallery":{'+
                '"file":"GalleryWidget.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"gallerytiny":{'+
                '"file":"GalleryTinyWidget.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"musicplayer":{'+
                '"file":"MusicPlayerWidget.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"news":{'+
                '"file":"NewsWidget.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"recipe":{'+
                '"file":"RecipeWidget.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"timer":{'+
                '"file":"TimerWidget.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"todo":{'+
                '"file":"TodoListWidget.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"transit":{'+
                '"file":"TransitWidget.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"unitconverter":{'+
                '"file":"UnitConvertWidget.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"video":{'+
                '"file":"VideoWidget.qml",'+
                '"properties":{'+
                '}'+
            '},'+
            '"weather":{'+
                '"file":"WeatherWidget.qml",'+
                '"properties":{'+
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

    //For logging in
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
            var prop = tmpGet.match(/^[a-zA-Z]*/);
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

    function refreshHome() {
        //load in currentUser settings
        //apps, etc.
        removeApps();
        removeWidgets();

        qMenuWidgetLoad(1, getSetting("widgets."+getSetting("qmWidgets[0].name")+".file"), false, {"y": 300, "border.color": "#FFFFFF", "border.width": 2, "draggable": false});
        qMenuWidgetLoad(2, getSetting("widgets."+getSetting("qmWidgets[1].name")+".file"), false, {"x": 1620, "y": 300, "border.color": "#FFFFFF", "border.width": 2, "draggable": false});
        loadWidget(getSetting("widgets."+getSetting("homeWidgets[0].name")+".file"), {"x": 0,"y":300});
        loadWidget(getSetting("widgets."+getSetting("homeWidgets[1].name")+".file"), {"x": 1920/2,"y":300})
        loadWidget(getSetting("widgets."+getSetting("homeWidgets[2].name")+".file"), {"x": 1600,"y":300})

        //load quick menu items

        if (currentUser == 0)
            header.toggleQuickMenu(true);
        else
            header.toggleQuickMenu(true);

        //Auto load an app you're working on
        loadApp("SettingsApp.qml", {view: 1});
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
        var app = Qt.createComponent(appQmlFile);
        app.createObject(currentApp, properties);
        if (!currentApp.visible)
            currentApp.visible = true;
        currentState = "APP"
    }

    function loadWidget(widgetQmlFile, properties) {
        var app = Qt.createComponent(widgetQmlFile);
        app.createObject(widgetScreen, properties);
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
           console.log("Guest ID: " + newUser)

           //Get setting example
           console.log("U: " + getSetting("username"));
           //Set setting example
           setSetting("username", "1337Guest")
           console.log("NEW U: " + getSetting("username"));

           //Get setting example
           console.log("HW[0]: " + getSetting("homeWidgets[0].name"));
           //Set setting example
           setSetting("homeWidgets[0].name", "gallery")
           console.log("NEW HW[0]: " + getSetting("homeWidgets[0].name"));
           //setSetting("homeWidgets[0].name", "news")

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
                if (currentUser == 0 && currentState === "HOME") {
                    //show login, call refreshHome() after logging in
                    //loadApp("Login.qml", {onLoggedIn:refreshHome()});
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

        Image{
            id: welcomeImage
            width: 1920
            height:1080
            source: "Image/welcome.png"
            visible: true
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    welcomeImage.visible=false
                }
            }
        }
    }


}
