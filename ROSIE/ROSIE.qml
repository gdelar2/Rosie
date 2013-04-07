import QtQuick 2.0

Rectangle {
    width: 1920
    height: 1080
    color: mainColor

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
        x: 0
        y: 0
    }

    MusicPlayerWidget {
        x: 5
        y: 105
    }
}
