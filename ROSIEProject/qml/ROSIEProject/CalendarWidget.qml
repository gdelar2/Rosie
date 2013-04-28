import QtQuick 2.0

Rectangle {
    width: 600
    height: 650
    color: "#000000"
    opacity: 0.7
    radius: 13
    property bool draggable: true;

    Rectangle {
        id: titleView

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

    Rectangle {
        id: list
        y: 80

        Text {
            font.family: mediumFont.name
            font.pointSize: 36
            x: 10
            color: "#FFFFFF"
            opacity: .8
            text: "None"
        }
    }

    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height
        onClicked: {
            loadApp("CalendarApp.qml");
        }

        onPressed: {
            if(!draggable)
                drag.target = null;
        }
    }
}
