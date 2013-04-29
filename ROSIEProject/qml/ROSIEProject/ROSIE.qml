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
     * Guests have limited widgets/apps
     */
    //Define the basic json user object skeleton in string representation
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
        '"apps":{'+
            '"calendar":{'+
                '"file":"CalendarApp.qml",'+
                '"reminders":[]'+
            '},'+
            '"gallery":{'+
                '"file":"GalleryApp.qml"'+
            '},'+
            '"recipe":{'+
                '"file":"RecipeApp.qml"'+
            '},'+
            '"settings":{'+
                '"file":"SettingsApp.qml"'+
            '},'+
            '"unitconverter":{'+
                '"file":"UnitConverterApp.qml"'+
            '},'+
            '"video":{'+
                '"file":"VideoApp.qml"'+
            '},'+
            '"weather":{'+
                '"file":"WeatherApp.qml"'+
            '},'+
            '"webbrowser":{'+
                '"file":"WebBrowserApp.qml"'+
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
                    '"width":600,'+
                    '"notes":[]'+
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
    //Define the json user array object
    property string userInfo: '[]'
    //Picture paths for the gallery
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

    //Load various fonts used throughout the app
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

    //Return a certain user setting
    function getSetting(name, user) {
        //If a specific user is not defined we use the current user
        if (typeof user === 'undefined')
            user = currentUser;
        //Parse the user array string into a json object
        var uInfo = JSON.parse(userInfo);
        var retValue = uInfo[user];
        //The name of the value we want will be specified in json format
        // we parse it dynamically
        var tmpGet = name;
        while (tmpGet.length > 0) {
            var idx = -1;
            if (tmpGet[0] === '.') //skip periods
                tmpGet = tmpGet.substring(1);
            if (tmpGet[0] === '[') { //parse out specific indexes
                idx = parseInt(tmpGet[1]);
                tmpGet = tmpGet.substring(3);
            }
            if (idx > -1) //grab the index if there is one
                retValue = retValue[idx];
            var prop = tmpGet.match(/^[a-zA-Z0-9]*/);
            //if there exists an object with the property
            // name we've parsed, grab it and repeat the loop
            if (retValue[prop])
                retValue = retValue[prop];
            //Trim out what we've parsed
            tmpGet = tmpGet.substring(prop[0].length);
        }
        //Return the requested setting
        return retValue;
    }

    //Set a certain setting
    function setSetting(name, value, user) {
        //if a user is not provided then we
        // are modifying the current user
        if(typeof user === 'undefined')
            user = currentUser;
        //Parse the user array
        var uInfo = JSON.parse(userInfo);
        var retValue = uInfo[user];

        //Use a recursive function to set the desired setting
        uInfo[user] = setSettingRecurse(retValue, name, value);

        //Save the user array back into a string form
        userInfo = JSON.stringify(uInfo);
    }

    //Recursive function set set a particular setting
    function setSettingRecurse(json, name, value) {
        //If there's nothing else to attempt to get
        // return the current value
        if (name.length === 0)
            return value;

        //Because the property name is in json format
        // we parse out the current property
        var retValue = json;
        var tmpGet = name;
        var idx = -1;
        if (tmpGet[0] === '.') //ignore dots
            tmpGet = tmpGet.substring(1);
        if (tmpGet[0] === '[') { //parse an index
            idx = parseInt(tmpGet[1]);
            tmpGet = tmpGet.substring(4);
        }
        var prop = tmpGet.match(/^[a-zA-Z]*/);
        tmpGet = tmpGet.substring(prop[0].length);
        //Recurse into the next property until we reach the end and
        // return the wanted assignment value into the json object
        if(idx > -1)
            json[idx][prop] = setSettingRecurse(json[idx][prop], tmpGet, value);
        else
            json[prop] = setSettingRecurse(json[prop], tmpGet, value);

        //Return the current json backwards in the the recursive function calls
        return json;
    }

    //Add a new user into the user array
    function addUser(username, password,avatar) {
        //Parse the user skeleton
        var skeleton = JSON.parse(userSkeleton)
        //Fill in the wanted information
        skeleton.username = username;
        skeleton.password = password;
        skeleton.avatar = avatar;
        var skeletonStr = JSON.stringify(skeleton);
        //Place the new user into the string representation of the array
        if (currentUser == -1) {
            userInfo = '[' + skeletonStr + ']';
            currentUser = 0;
        } else
            userInfo = userInfo.substring(0, userInfo.length - 1) + ',' + skeletonStr + ']';
        //Return the index of the new user
        var uInfo = JSON.parse(userInfo);
        return uInfo.length - 1;
    }

    //Refresh the home screen
    function refreshHome(removeApp) {
        //Specify whether we want to remove any open apps
        if (typeof removeApp === 'undefined')
            removeApp = true;
        //Remove any apps and widgets
        if (removeApp)
            removeApps();
        removeWidgets();
        removeQmWidgets();

        //Load in the users quick menu widgets
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
        //Load the users home screen widgets
        if (getSetting("homeWidgets[0].name") !== "-1")
            loadWidget(getSetting("widgets."+getSetting("homeWidgets[0].name")+".file"), {"x": 0,"y":300});
        if (getSetting("homeWidgets[1].name") !== "-1")
            loadWidget(getSetting("widgets."+getSetting("homeWidgets[1].name")+".file"), {"x": (1920/2)-(getSetting("widgets."+getSetting("homeWidgets[1].name")+".properties.width")/4),"y":300})
        if (getSetting("homeWidgets[2].name") !== "-1")
            loadWidget(getSetting("widgets."+getSetting("homeWidgets[2].name")+".file"), {"x": 1920-getSetting("widgets."+getSetting("homeWidgets[2].name")+".properties.width"),"y":300})
        //Set the main color
        mainColor = getSetting("theme");

        //If we are the quest we do not need the quick menu
        if (currentUser == 0)
            header.toggleQuickMenu(false);
        else
            header.toggleQuickMenu(true);

        //If guest is the only user we load up the user settings
        // to make them add one
        if (removeApp) {
            if (currentUser == 0 && JSON.parse(userInfo).length === 1)
                loadApp("SettingsApp.qml", {view: 1, setSettingsEnabled:false});
        }
    }

    //Load a particular widget into the quick menu
    function qMenuWidgetLoad(widgetId, widget, scale, properties) {
        //Get the quick menu
        var quickMenu = header.getQuickMenu();
        var qMenuWidget = Qt.createComponent(widget);
        var qWidget;
        //Grab the widget place holder
        if(widgetId === 1)
            qWidget = quickMenu.getWidget1();
        else
            qWidget = quickMenu.getWidget2();
        //Create the object
        qMenuWidget.createObject(qWidget, properties);
    }

    //Load an app
    function loadApp(appQmlFile, properties) {
        //Change the current state
        currentState = "APP"
        //Load the app onto the screen
        var app = Qt.createComponent(appQmlFile);
        app.createObject(currentApp, properties);
        if (!currentApp.visible)
            currentApp.visible = true;
    }

    //Load a widget
    function loadWidget(widgetQmlFile, properties) {
        //Load a particular widget onto the home screen
        var app = Qt.createComponent(widgetQmlFile);
        app.createObject(widgetScreen, properties);
    }

    //remvoe any quick menu widgets
    function removeQmWidgets() {
        var quickMenu = header.getQuickMenu();
        if (quickMenu.getWidget1().children.length > 0)
            quickMenu.getWidget1().children[0].destroy();
        if (quickMenu.getWidget2().children.length > 0)
            quickMenu.getWidget2().children[0].destroy();
    }

    //Remove any open apps
    function removeApps() {
        for (var i = 0; i < currentApp.children.length; i++) {
            currentApp.children[i].destroy();
        }
        currentApp.visible = false;
    }

    //Remove all widgets on the home screen
    function removeWidgets() {
        for (var i = 0; i < widgetScreen.children.length; i++) {
            widgetScreen.children[i].destroy();
        }
    }

    //Convert the icon id from the weather service
    // into a particular image. Icons were taken from
    // DeviantArt, a link to them is available in the
    // Image/Weather folder in source.txt
    function convertWeatherIcon(icon, checkTime) {
        var daytime = true;
        var currentDate = new Date()
        //A few images have different day and night icons, determine
        // which we want to display based on time (displays night between 7pm and 5am)
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
        //Ability to scale down the screen
        scale: 1

       //On app load
       Component.onCompleted: {
           //On first load we create a guest user
           var newUser = addUser("Guest", "", "Image/User/chess.png");

           //Refresh the home screen
           refreshHome();
       }

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

            //Top left button click actions
            onReturnShortcutClicked: {
                //If we are a guest and on the home screen and there are other users
                // we load the login display
                if (currentUser == 0 && currentState === "HOME" && JSON.parse(userInfo).length > 1) {
                    loadApp("Login.qml", {});
                } else if (currentState === "HOME") { //if we are logged in and not guest this button logs us out
                    currentUser = 0;
                    refreshHome();
                } else if (currentState === "APP") { //if we are in an app this button closes the app
                    removeApps();
                    currentState = "HOME";
                }
            }
        }

        //Welcome screen
        Rectangle {
            width: 1920;
            height: 1080;
            anchors.centerIn: parent
            color: mainColor;
            visible: true

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //Hide welcome screen when clicked
                    parent.visible=false
                }
            }

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
