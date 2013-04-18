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
        id: lightfont
        source: "fonts/Exo-Light.otf"
    }
    FontLoader {
        id: regularFont
        source: "fonts/Exo-Regular.otf"
    }

    //Click and drag to see
    Rectangle {
        id: application
        width: 1920
        height: 1080
        color: mainColor
        //0-1 scale, doesn't work great but still gives a bit more insight as to how it looks
        scale: .5

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
            visible: true
        }


        TimerWidget{
            visible: true
        }

        //leave the header at the bottom, items are loaded top down and
        // header needs to be on top of everything else
        Header {
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
