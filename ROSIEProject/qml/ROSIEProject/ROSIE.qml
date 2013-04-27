import QtQuick 2.0
Flickable {
    width: 1360//800
    height: 760//600
    contentWidth: application.width
    contentHeight: application.height

    property string mainColor: "#0e51a7"
    property string currentState: "HOME"
    property int currentUser: -1
    //guest, none, [news, unit, weather], [],
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
              '"app":"",'+ //if app is not null load app, else do action
              '"action":""'+
            '},{'+
              '"app":"",'+
              '"action":""'+
            '},{'+
              '"app":"",'+
              '"action":""'+
            '},{'+
              '"app":"",'+
              '"action":""'+
            '},{'+
              '"app":"",'+
              '"action":""'+
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
                '"file":"UnitConvertWidget",'+
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

    function getSetting(name) {
        var uInfo = JSON.parse(userInfo);
        var retValue = uInfo[currentUser];
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

    function setSetting(name, value) {
        var uInfo = JSON.parse(userInfo);
        var retValue = uInfo[currentUser];
        var startedWith = JSON.stringify(retValue);

        uInfo[currentUser] = setSettingRecurse(retValue, name, value);

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
    }

    function refreshHome() {
        //load in currentUser settings
        //apps, etc.
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
        var app = Qt.createComponent(appQmlFile);
        app.createObject(widgetScreen, properties);
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
           addUser("Guest", "", "Image/User/chess.png");

           //Get setting example
           console.log("U: " + getSetting("username"));
           //Set setting example
           setSetting("username", "1337Guest")
           console.log("NEW U: " + getSetting("username"));

           //Get setting example
           console.log("HW[0]: " + getSetting("homeWidgets[0].name"));
           //Set setting example
           setSetting("homeWidgets[0].name", "weather")
           console.log("NEW HW[0]: " + getSetting("homeWidgets[0].name"));

           qMenuWidgetLoad(1, "TransitWidget.qml", true, {"y": 500, "border.color": "#FFFFFF", "border.width": 2});
           qMenuWidgetLoad(2, "WeatherWidget.qml", false, {"x": 1620, "y": 300, "border.color": "#FFFFFF", "border.width": 2});
           header.toggleQuickMenu();
           //Auto load an app you're working on
           loadApp("SettingsApp.qml", {})
       }

       //Everything below this comment is where widgets should be placed

       //Rectangle to load widgets into
       Rectangle {
           id: widgetScreen
           x: 0
           y: header.height
           width: 1920
           height: 1080-header.height
           color: mainColor
       }

        WeatherWidget {
            id: weatherwidget1
            x: 1620
            y: 118

            onWidgetClicked: {
                loadApp("WeatherApp.qml", {})
            }
        }

        CalendarWidget {
            id: calendarWidget
            x: 0
            y: 100

            onWidgetClicked: {
                loadApp("CalendarApp.qml", {})
            }
        }

        RecipeWidget{
            id: recipeWidget
            x: 100
            y: 200
            visible: true

            onWidgetClicked:{
                loadApp("RecipeApp.qml", {})
            }
        }

        VideoWiget{
            id: videoWidget
            x: 100
            y: 300
            visible: true

            onWidgetClicked:{
                loadApp("VideoApp.qml", {})
            }
        }

        MusicPlayerWidget {
            x: 1181
            y: 721
            visible: true
        }

        TransitWidget {
            x: 8
            y: 152
            visible: false
        }

        UnitConvertWidget{
            x:8
            y: 152
            visible: true

            onWidgetClicked:{
                loadApp("UnitConverterApp.qml", {})
            }
        }

        TimerWidget{

            y: 300
            visible: true
        }



        GalleryApp{
            picArray: picPaths
            visible: false
        }

        WebBrowserApp{
            x: 0
            y: 100

            visible: false
        }

        GalleryTinyWidget{
            visible: true
            x:10
            y:50
            picArray: picPaths

            onWidgetClicked: {
                loadApp("GalleryApp.qml",{picArray: picPaths})
            }
        }

        GalleryWidget{
            picArray: picPaths
             visible: false
             onWidgetClicked: {
                  loadApp("GalleryApp.qml",{picArray: picPaths})
             }

        }

        //Place any widgets above this, currentApp, header, and welcomeImage
        // must be the last items in the file
        Rectangle {
            id: currentApp
            x:0
            y:100
            visible: false
            width: 1920
            height: 1080-header.height
        }

        //leave the header at the bottom, items are loaded top down and
        // header needs to be on top of everything else
        Header {
            id: header

            onReturnShortcutClicked: {
                if (currentUser == 0 && currentState === "HOME") {
                    //show login, call refreshHome() after logging in
                    // and header.toggleQuickMenu();
                } else if (currentState === "HOME") {
                    //Log out
                    //Show message "You have been logged out"
                    //Activate timer to fade out message
                    currentUser = 0;
                    refreshHome();
                    header.toggleQuickMenu();
                } else if (currentState === "APP") {
                    //
                    for (var i = 0; i < currentApp.children.length; i++) {
                        currentApp.children[i].destroy();
                    }
                    currentApp.visible = false;
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
