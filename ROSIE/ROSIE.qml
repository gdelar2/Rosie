import QtQuick 2.0

Rectangle {
    width: 1920
    height: 1080
    color: mainColor
    //0-1 scale, doesn't work great but still gives a bit more insight as to how it looks
    scale: .5

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
        id: lightfont
        source: "fonts/Exo-Light.otf"
    }
    FontLoader {
        id: regularFont
        source: "fonts/Exo-Regular.otf"
    }

    Header {
        onSettingsShortcutClicked: {
            //load the settings app here
        }
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
    }

    TransitWidget {
        x: 8
        y: 152
    }

    UnitConvertWidget{
        x:8
        y: 152
        visible: false
    }

}
