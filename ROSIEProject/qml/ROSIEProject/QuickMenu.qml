import QtQuick 2.0

Rectangle {
    width: 1920
    height: 975
    color: "#000000"
    opacity: .95

    //Functions to retrieve the widget placeholders
    function getWidget1() {
        return widget1;
    }

    function getWidget2() {
        return widget2;
    }

    onVisibleChanged: {
        //When the quick menu is displayed populate the menu
        if (visible) {
            qmenuInfoModel.clear();
            gridView.currentIndex = -1;

            //Exclude any apps that exist on the home screen
            var mywidgets = getSetting("homeWidgets");
            var apps = getSetting("apps");
            for (var key in apps) {
                var found = false;
                for (var key2 in mywidgets) {
                    if (mywidgets[key2].name === key) {
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    qmenuInfoModel.append({txt: key, act: "", ap: key})
                }
            }
            //Always add in option to add the music player (a common object) onto the home
            // scree, along with an option to log out
            qmenuInfoModel.append({txt: "Music Player", act: "musicplayer", ap: ""})
            qmenuInfoModel.append({txt: "Logout", act: "logout", ap: ""})
        }
    }

    //Create a fake mouse area behind the quick menu so we don't click
    // anything behind it
    MouseArea {
        anchors.fill: parent
    }

    Text {
        id: rosieTxt
        x: (parent.width / 2) - (width / 2)
        y: -10
        font.bold: true
        font.pointSize: 72
        font.family: mediumFont.name
        color: "#FFFFFF"
        opacity: 0.6
        text: "ROSIE"
    }

    Rectangle {
        id: menuBlock
        x: (parent.width / 2) - (width / 2)
        y: 125
        width: 970
        height: 825
        color: "#000000"
        opacity: 0.7
        radius: 50
        smooth: true
        border.color: "#FFFFFF"
        border.width: 2

        //Create a list for the menu items
        ListModel {
            id: qmenuInfoModel
        }
        Component {
            id: qmenuDelegate

            Rectangle {
                width: parent.width
                height: 80
                color: mainColor
                opacity: .5
                property string action
                property string app

                Component.onCompleted: {
                    action = act;
                    app = ap;
                }
                Text { //display the app name
                    anchors.centerIn: parent
                    font.family: mediumFont.name
                    font.pointSize: 32
                    color: "#FFF"
                    font.capitalization: Font.Capitalize
                    text: txt
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        //Update the highlight
                        gridView.currentIndex = index;
                        if (app !== "") {
                            //If we are loading an app, remove any existing ones,
                            // close the quick menu, and load the app
                            removeApps();
                            qMenuView.toggle();
                            loadApp(getSetting("apps." + app + ".file"), {});
                        }
                        else {
                            //Special actions
                            if (action === "logout") {
                                //Log the user out
                                qMenuView.toggle();
                                currentUser = 0;
                                refreshHome();
                            } else if (action === "musicplayer") {
                                //Open up the music player widget
                                qMenuView.toggle();
                                removeApps();
                                loadWidget(getSetting("widgets."+action+".file"), {"x": 660,"y":880});
                            }
                        }
                    }
                }
            }
        }
        //Create the gridview that displays weather information in the block
        ListView {
            id: gridView
            width: parent.width
            height: parent.height
            model: qmenuInfoModel
            delegate: qmenuDelegate
            highlight: Rectangle { color: "#FFF" }
        }
    }

    //Widget placeholders
    Rectangle {
        id: widget1
        x:0
        y:50
    }

    Rectangle {
        id: widget2
        y:50
    }
}
