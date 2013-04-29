import QtQuick 2.0

Rectangle {
    function setDate(date) {
        reminderDateText.text = date
    }

    width: 1095
    height: 680
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    visible: false
    radius: 20
    color: mainColor
    border.color: "#000000"
    border.width: 6
    z: 1000
    property string dateA
    property string dateB

    MouseArea {
        anchors.fill: parent
    }

    Text {
        id: remText
        font.pointSize: 64
        font.family: mediumFont.name
        anchors.horizontalCenter: parent.horizontalCenter
        y:10
        opacity: .68
        text: "NEW REMINDER"
    }

    Rectangle {
        height: 2
        width: parent.width - (parent.width / 4)
        border.color: "#000000"
        border.width: 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: remText.bottom
        opacity: .68
    }

    Text {
        id: reminderDateText
        font.bold: true
        font.pointSize: 36
        font.family: regularFont.name
        text: ""
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: remText.bottom
        anchors.topMargin: 40
        opacity: .68
    }

    Rectangle {
        id: rem
        anchors.top: reminderDateText.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        property string shours
        property string sminutes
        property string stime
        property string ehours
        property string eminutes
        property string etime

        Component.onCompleted: {
            var curDate = new Date();
            shours = Qt.formatDateTime(curDate, "hh");
            sminutes = Qt.formatDateTime(curDate, "mm");
            stime = Qt.formatDateTime(curDate, "AP");
            curDate.setMinutes(curDate.getMinutes()+30);
            ehours = Qt.formatDateTime(curDate, "hh");
            eminutes = Qt.formatDateTime(curDate, "mm");
            etime = Qt.formatDateTime(curDate, "AP");

        }

        Rectangle {
            id: startBox
            height: 100
            x: -170

            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                x: 40
                y:-35
                text: "^"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var date = new Date();
                        if(rem.shours === "12")
                            rem.shours = "0";
                        date.setHours(rem.shours);
                        date.setHours(date.getHours()+1)
                        date.setMinutes(rem.sminutes);
                        rem.shours = Qt.formatDateTime(date, "hh");
                    }
                }
            }
            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                x: 165
                y:-35
                text: "^"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var date = new Date();
                        date.setHours(rem.shours);
                        date.setMinutes(rem.sminutes);
                        date.setMinutes(date.getMinutes()+1)
                        rem.sminutes = Qt.formatDateTime(date, "mm");
                    }
                }
            }
            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                x: 280
                y:-35
                text: "^"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (rem.stime === "AM")
                            rem.stime = "PM";
                        else
                            rem.stime = "AM";
                    }
                }
            }

            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                text: parent.parent.shours+":"+parent.parent.sminutes+" "+parent.parent.stime
            }

            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                x: 40
                y: 40
                text: "^"
                rotation: 180

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var date = new Date();
                        if(rem.shours === "01")
                            rem.shours = "13";
                        date.setHours(rem.shours);
                        date.setHours(date.getHours()-1)
                        date.setMinutes(rem.sminutes);
                        rem.shours = Qt.formatDateTime(date, "hh");
                    }
                }
            }
            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                x: 165
                y: 40
                text: "^"
                rotation: 180

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var date = new Date();
                        date.setHours(rem.shours);
                        date.setMinutes(rem.sminutes);
                        date.setMinutes(date.getMinutes()-1)
                        rem.sminutes = Qt.formatDateTime(date, "mm");
                    }
                }
            }
            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                x: 280
                y: 40
                text: "^"
                rotation: 180

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (rem.stime === "AM")
                            rem.stime = "PM";
                        else
                            rem.stime = "AM";
                    }
                }
            }
        }

        Rectangle {
            id: endBox
            anchors.top: startBox.bottom
            anchors.topMargin: 50
            x: -170

            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                x: 40
                y:-35
                text: "^"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var date = new Date();
                        if(rem.ehours === "12")
                            rem.ehours = "0";
                        date.setHours(rem.ehours);
                        date.setHours(date.getHours()+1)
                        date.setMinutes(rem.eminutes);
                        rem.ehours = Qt.formatDateTime(date, "hh");
                    }
                }
            }
            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                x: 165
                y:-35
                text: "^"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var date = new Date();
                        date.setHours(rem.ehours);
                        date.setMinutes(rem.eminutes);
                        date.setMinutes(date.getMinutes()+1)
                        rem.eminutes = Qt.formatDateTime(date, "mm");
                    }
                }
            }
            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                x: 280
                y:-35
                text: "^"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (rem.etime === "AM")
                            rem.etime = "PM";
                        else
                            rem.etime = "AM";
                    }
                }
            }

            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                text: parent.parent.ehours+":"+parent.parent.eminutes+" "+parent.parent.etime
            }

            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                x: 40
                y: 40
                text: "^"
                rotation: 180

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var date = new Date();
                        if(rem.ehours === "01")
                            rem.ehours = "13";
                        date.setHours(rem.ehours);
                        date.setHours(date.getHours()-1)
                        date.setMinutes(rem.eminutes);
                        rem.ehours = Qt.formatDateTime(date, "hh");
                    }
                }
            }
            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                x: 165
                y: 40
                text: "^"
                rotation: 180

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var date = new Date();
                        date.setHours(rem.ehours);
                        date.setMinutes(rem.eminutes);
                        date.setMinutes(date.getMinutes()-1)
                        rem.eminutes = Qt.formatDateTime(date, "mm");
                    }
                }
            }
            Text {
                font.family: mediumFont.name
                font.pointSize: 64
                x: 280
                y: 40
                text: "^"
                rotation: 180

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (rem.etime === "AM")
                            rem.etime = "PM";
                        else
                            rem.etime = "AM";
                    }
                }
            }
        }
    }

    Rectangle {
        width: 160;
        height: 80
        anchors.right: cancelBtn.left
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        radius: 10
        smooth: true
        border.color: "#FFF"
        border.width: 3
        color: "#000"
        opacity: .38

        Text {
            anchors.centerIn: parent
            font.family: mediumFont.name
            font.pointSize: 32
            color: "#FFF"
            text: "Set"
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                parent.parent.visible = false
                var uInfo = JSON.parse(userInfo);
                var cur = uInfo[currentUser].apps.calendar.reminders;
                var curStr = JSON.stringify(cur);
                if (curStr === "[]")
                    curStr = "[" + reminderSkeleton + "]";
                else
                    curStr = curStr.substring(0, curStr.length - 1) + "," + reminderSkeleton + "]";
                var remArray = JSON.parse(curStr);
                var newRem = remArray[remArray.length - 1];
                newRem.name = "";
                newRem.dateA = dateA;
                newRem.dateB = dateB;
                var h = rem.shours;
                if (h > 12)
                    h -= 12;
                newRem.startA = h + ":" + rem.sminutes + " " + rem.stime;
                h = rem.ehours;
                if (h>12)
                    h -= 12;
                newRem.endA = rem.ehours + ":" + rem.eminutes + " " + rem.etime;
                if (rem.stime === "AM") {
                    newRem.startM = rem.shours + ":" + rem.sminutes;
                } else {
                    newRem.startM = (parseInt(rem.shours) + 12) + ":" + rem.sminutes;
                }
                if (rem.etime === "AM") {
                    newRem.endM = rem.ehours + ":" + rem.eminutes;
                } else {
                    newRem.endM = (parseInt(rem.ehours) + 12) + ":" + rem.eminutes;
                }
                remArray[remArray.length - 1] = newRem;
                uInfo[currentUser].apps.calendar.reminders = remArray;
                userInfo = JSON.stringify(uInfo);
                removeApps();
                loadApp("CalendarApp.qml", {})
                refreshHome(false);
            }
        }
    }

    Rectangle {
        id: cancelBtn
        width: 240;
        height: 80
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        radius: 10
        smooth: true
        border.color: "#FFF"
        border.width: 3
        color: "#000"
        opacity: .38

        Text {
            anchors.centerIn: parent
            font.family: mediumFont.name
            font.pointSize: 32
            color: "#FFF"
            text: "Cancel"
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                parent.parent.visible = false
            }
        }
    }
}
