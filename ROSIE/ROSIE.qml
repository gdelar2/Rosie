import QtQuick 1.1

Rectangle {
    width: 1920
    height: 1080
    color: mainColor
    //0-1 scale, doesn't work great but still gives a bit more insight as to how it looks
    scale: 1

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

    MusicPlayerWidget {
        x: 1181
        y: 721
    }
    Header {
        onSettingsShortcutClicked: {
            //load the settings app here
        }

        WeatherWidget {
            id: weatherwidget1
            x: 1620
            y: 118
        }
    }
}
