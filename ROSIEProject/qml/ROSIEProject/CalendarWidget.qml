import QtQuick 2.0

Rectangle {
    width: 600
    height: 650
    color: "#000000"
    opacity: 0.7
    radius: 13
    property bool draggable: true;

    Component.onCompleted: {
        //Retrieve any current reminders
        var reminders = getSetting("apps.calendar.reminders");
        gridView.currentIndex = -1;
        //populate the reminders list display
        if (reminders.length === 0) {
            calendarInfoModel.append({txt:"None"})
        } else {
            for (var key in reminders) {
                var date = "";
                var time = "";
                if (getSetting("dateFormat") === "MM/dd/yy")
                    date = reminders[key].dateA;
                else
                    date = reminders[key].dateB;
                if (getSetting("timeFormat") === "hh:mm")
                    time = reminders[key].startM;
                else
                    time = reminders[key].startA;
                calendarInfoModel.append({txt: "Reminder: " + date + " " + time})
            }
        }
    }

    Rectangle {
        id: titleView
        height: 80

        Rectangle {
            id: title
            width: parent.parent.width
            height: 80
            color: "#FFFFFF"
            opacity: .4
        }

        Text {
            id: convertTitle
            color: "#ffffff"
            text: qsTr(Qt.formatDate(new Date(), "ddd MMM dd"))
            style: Text.Raised
            anchors.left: parent.left
            anchors.leftMargin: 12
            anchors.verticalCenter: title.verticalCenter
            font.bold: true
            font.family: mediumFont.name
            verticalAlignment: Text.AlignVCenter
            opacity: 1
            font.pixelSize: 36
        }
    }
    //Reminders list
    ListModel {
        id: calendarInfoModel
    }
    //Single reminder component
    Component {
        id: calendarDelegate
        Rectangle {
            width: parent.width
            height: 100
            color: mainColor
            Text {
                anchors.centerIn: parent
                font.family: mediumFont.name
                font.pointSize: 32
                color: "#FFF"
                text: txt
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    gridView.currentIndex = index;
                }
            }
        }
    }
    //List display
    ListView {
        id: gridView
        width: parent.width
        height: parent.height - title.height
        anchors.top: titleView.bottom
        model: calendarInfoModel
        delegate: calendarDelegate
        highlight: Rectangle { color: "#FFF" }
    }

    //If widget is clicked on open up the associated app
    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height
        onClicked: {
            loadApp("CalendarApp.qml", {});
        }

        onPressed: {
            if(!draggable)
                drag.target = null;
        }
    }
}
