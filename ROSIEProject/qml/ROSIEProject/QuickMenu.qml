import QtQuick 2.0

Rectangle {
    width: 1920
    height: 975
    color: "#000000"
    opacity: .95

    function getWidget1() {
        return widget1;
    }

    function getWidget2() {
        return widget2;
    }

    onVisibleChanged: {
        if (visible) {
            calendarInfoModel.clear();
            gridView.currentIndex = -1;

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
                    calendarInfoModel.append({txt: key, act: "", ap: key})
                }
            }
            calendarInfoModel.append({txt: "Music Player", act: "musicplayer", ap: ""})
            calendarInfoModel.append({txt: "Logout", act: "logout", ap: ""})
        }
    }

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

        ListModel {
            id: calendarInfoModel
        }
        Component {
            id: calendarDelegate

            Rectangle {
                width: parent.width
                height: 100
                color: mainColor
                opacity: .5
                property string action
                property string app

                Component.onCompleted: {
                    action = act;
                    app = ap;
                }
                Text {
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
                        gridView.currentIndex = index;
                        if (app !== "") {
                            removeApps();
                            qMenuView.toggle();
                            loadApp(getSetting("apps." + app + ".file"), {});
                        }
                        else {
                            if (action === "logout") {
                                qMenuView.toggle();
                                currentUser = 0;
                                refreshHome();
                            } else if (action === "musicplayer") {
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
            model: calendarInfoModel
            delegate: calendarDelegate
            highlight: Rectangle { color: "#FFF" }
        }
    }

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
