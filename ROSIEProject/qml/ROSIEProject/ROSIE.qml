import QtQuick 2.0

Flickable {
    width: 1360//800
    height: 760//600
    contentWidth: application.width
    contentHeight: application.height

    property string mainColor: "#0e51a7"
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

    function convertWeatherIcon(icon) {
        var daytime = true;
        var currentDate = new Date()
        if(currentDate.getHours() > 19 || currentDate.getHours() < 5)
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
        //0-1 scale, doesn't work great but still gives a bit more insight as to how it looks
        scale: 0.5

       Component.onCompleted: {
           qMenuWidgetLoad(1, "TransitWidget.qml", true, {"y": 500, "border.color": "#FFFFFF", "border.width": 2});
           qMenuWidgetLoad(2, "WeatherWidget.qml", false, {"x": 1620, "y": 300, "border.color": "#FFFFFF", "border.width": 2});
           header.toggleQuickMenu();
           //Auto load an app you're working on
           //loadApp("WeatherApp.qml", {})
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
        }

        //Everything below this comment is where widgets should be placed

        WeatherWidget {
            id: weatherwidget1
            x: 1620
            y: 118

            onWidgetClicked: {
                parent.loadApp("WeatherApp.qml", {})
            }
        }

        CalendarWidget {
            id: calendarWidget
            x: 0
            y: 100

            onWidgetClicked: {
                parent.loadApp("CalendarApp.qml", {})
            }
        }

        RecipeWidget{
            id: recipeWidget
            x: 100
            y: 200
            visible: false

            onWidgetClicked:{
                parent.loadApp("RecipeApp.qml", {})
            }
        }

        VideoWiget{
            id: videoWidget
            x: 100
            y: 300
            visible: true

            onWidgetClicked:{
                parent.loadApp("VideoApp.qml", {})
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
            visible: false
        }

        TimerWidget{

            y: 300
            visible: true
        }

        Rectangle {
            id: currentApp
            x:0
            y:100
            visible: false
            width: 1920
            height: 980
        }

        //leave the header at the bottom, items are loaded top down and
        // header needs to be on top of everything else
        Header {
            id: header
            onReturnShortcutClicked: {
                //load the settings app here
                if (currentApp.children.length > 0) {
                    for (var i = 0; i < currentApp.children.length; i++) {
                        currentApp.children[i].destroy()
                    }
                    currentApp.visible = false
                }
            }
        }

        GalleryApp{

        visible: false
        }

        GalleryTinyWidget{
        visible: false
        }

        GalleryWidget{
    visible: false
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
