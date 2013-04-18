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
        source: "fonts/Exo-Bold.otf"
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
        var daytime = false;
        if(Qt.formatDateTime(new Date(), "AP") == "AM")
            daytime = true;
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
        scale: .5

       Component.onCompleted: {
           var quickMenu = header.getQuickMenu();
           var qMenuWidget1 = Qt.createComponent("TransitWidget.qml");
           var qMenuWidget2 = Qt.createComponent("WeatherWidget.qml");
           var widget1 = quickMenu.getWidget1();
           var widget2 = quickMenu.getWidget2();
           qMenuWidget1.createObject(widget1, {"y": 500, "border.color": "#FFFFFF", "border.width": 2});
           widget1.scale = 0.61;
           qMenuWidget2.createObject(widget2, {"x": 1620, "y": 300, "border.color": "#FFFFFF", "border.width": 2});
       }

        //Everything below this comment is where widgets should be placed

        WeatherWidget {
            id: weatherwidget1
            x: 1620
            y: 118
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
            visible: false
        }

        //leave the header at the bottom, items are loaded top down and
        // header needs to be on top of everything else
        Header {
            id: header
            onSettingsShortcutClicked: {
                //load the settings app here
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
