import QtQuick 2.0

Rectangle {
    width: 1920
    height: 980
    color: mainColor
    property string reminderSkeleton: '{"name":"","index":"","dateA":"","dateB":"","startA":"","startM":"","endA":"","endM":""}'

    Component.onCompleted: {
        var curDate = new Date();
        var curDay = Qt.formatDate(curDate, "d");
        var curDayText = Qt.formatDate(curDate, "ddd")
        var lastDay = curDay
        var isCurrent = true;
        var daysBefore = 0

        switch (curDayText) {
            case "Sun": daysBefore = 7;break;
            case "Mon": daysBefore = 8; break;
            case "Tue": daysBefore = 9; break;
            case "Wed": daysBefore = 10; break;
            case "Thu": daysBefore = 11; break;
            case "Fri": daysBefore = 12; break;
            case "Sat": daysBefore = 13; break;
        }
        curDate.setDate(curDate.getDate()-daysBefore)
        curDay = Qt.formatDate(curDate, "d")
        var reminders = getSetting("apps.calendar.reminders")
        for (var i = 0; i < daysBefore; ++i) {
            if (curDay > lastDay)
                isCurrent = false
            else
                isCurrent = true
            var day = ""
            if(i < 7)
                day = Qt.formatDate(curDate, "ddd")
            var chkStr = Qt.formatDate(curDate, "MM/dd/yy");
            var hasReminder = false;
            for (var key in reminders) {
                if (reminders[key].dateA === chkStr) {
                    hasReminder = true;
                    break;
                }
            }

            calendarInfoModel.append({ title: curDay,curMonth: isCurrent,curDay:curDay==lastDay,day:day,date:curDate,reminder:hasReminder })
            curDate.setDate(curDate.getDate()+1)
            curDay = Qt.formatDate(curDate, "d")
        }

        for (i = daysBefore; i < 28; ++i) {
            if (isCurrent && curDay < lastDay)
                isCurrent = false
            chkStr = Qt.formatDate(curDate, "MM/dd/yy");
            hasReminder = false;
            for (key in reminders) {
                if (reminders[key].dateA === chkStr) {
                    hasReminder = true;
                    break;
                }
            }
            calendarInfoModel.append({ title: curDay,curMonth: isCurrent,curDay:curDay==lastDay,day:"",date:curDate,reminder:hasReminder })
            curDate.setDate(curDate.getDate()+1)
            curDay = Qt.formatDate(curDate, "d")
        }
    }

    Text {
        id: monthText
        font.family: boldFont.name
        font.bold: true
        font.pointSize: 124
        font.capitalization: Font.AllUppercase
        anchors.horizontalCenter: parent.horizontalCenter
        x: 5
        opacity: .6
        text: qsTr(Qt.formatDate(new Date(), "MMMM"))
    }

    Rectangle {
        anchors.top: monthText.bottom
        anchors.topMargin: -25
        width: 1920
        color: mainColor
        height: parent.height - monthText.height + 25

        ListModel {
            id: calendarInfoModel
        }
        Component {
            id: calendarDelegate
            Item {
                height: (parent.height / 4)
                width: parent.width / 7

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: mainColor

                    Rectangle {
                        width: parent.width
                        height: parent.height
                        color: mainColor
                        border.color: "#FFFFFF"
                        border.width: 2
                        opacity: .5
                    }

                    Rectangle {
                        width: parent.width-5
                        height: parent.height-5
                        x: 2
                        y: 3
                        color: "#000000"
                        opacity: .3
                    }

                    Rectangle {
                        width: parent.width-5
                        height: parent.height-5
                        x: 2
                        y: 3
                        color: "#000000"
                        opacity: .3
                        visible: !curMonth
                    }

                    Rectangle {
                        width: parent.width-5
                        height: parent.height-5
                        x: 2
                        y: 3
                        color: "#FFFFFF"
                        opacity: .3
                        visible: curDay
                    }

                    Text {
                        font.bold: true
                        font.pointSize: 84
                        font.capitalization: Font.AllUppercase
                        font.family: boldFont.name
                        text: day
                        color: "#FFFFFF"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        opacity: .2
                    }

                    Text {
                        font.bold: true
                        font.pointSize: 36
                        font.family: regularFont.name
                        text: title
                        color: "#FFFFFF"
                        opacity: .48
                        y: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                    }

                    Rectangle {
                        width: parent.width-20
                        height: 70
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: mainColor
                        opacity: .5
                        border.color: "#000"
                        border.width: 4
                        radius: 20
                        visible: reminder
                        Text {
                            anchors.centerIn: parent
                            font.family: mediumFont.name
                            font.pointSize: 24
                            text: "REMINDER"
                        }
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            createReminderView.visible = true
                            createReminderView.setDate(Qt.formatDate(date, "dddd MMMM dd yyyy"))
                            createReminderView.dateA = Qt.formatDate(date, "MM/dd/yy");
                            createReminderView.dateB = Qt.formatDate(date, "dd/MM/yy");
                        }
                    }
                }
            }
        }
        //Create the gridview that displays weather information in the block
        GridView {
            id: gridView
            width: parent.width
            height: parent.height
            cellHeight: height / 4
            cellWidth: width / 7
            model: calendarInfoModel
            delegate: calendarDelegate

        }

        CalendarReminderView {
            id: createReminderView
        }
    }
}
