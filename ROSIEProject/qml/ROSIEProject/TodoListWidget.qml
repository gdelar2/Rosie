import QtQuick 2.0
//import FileIO 1.0
Rectangle {
    width: 600
    height: 650
    color: "#000000"
    opacity: 0.7
    z: 10000
    property bool draggable: true;


    Text {
        id: convertTitle
        x: 12
        y: 10
        width: 523
        height: 48
        color: "#ffffff"
        text: qsTr("ToDo")
        style: Text.Raised
        anchors.left: parent.left
        anchors.leftMargin: 12
        font.bold: true
        font.family: mediumFont.name
        verticalAlignment: Text.AlignVCenter
        opacity: 1
        font.pixelSize: 45
    }

    Text {
        id: addButton
        height: 50
        width: 50
        color: "#ffffff"
        text: qsTr("+")
        style: Text.Raised
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        font.bold: true
        font.family: mediumFont.name
        verticalAlignment: Text.AlignVCenter
        opacity: 1
        font.pixelSize: 52
    }

    Text {
        id: body
        width: parent.width - 10
        height: parent.height - 50
        color: "#ffffff"
        text: qsTr("")
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: convertTitle.bottom
        anchors.topMargin: 15
        font.bold: true
        font.family: mediumFont.name
        opacity: 1
        font.pixelSize: 32
    }

    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height

        onPressed: {
            if(!draggable)
                drag.target = null;
        }
    }

    MouseArea {
        anchors.fill: addButton
        onClicked: {
            keyboard.visible = true;
            textbox.visible = true
            textboxText.visible = true;
        }
    }
    Rectangle {
        id: textbox
        width: 1920
        height: 140
        anchors.bottom: keyboard.top
        anchors.left: keyboard.left
        opacity: .48
        visible: false
    }
    Text {
        id: textboxText
        anchors.fill: textbox
        anchors.verticalCenter: textbox.verticalCenter
        font.family: mediumFont.name
        font.pointSize: 82
        opacity: .68
        color: "#000000"
        visible: false
    }
    VirtualKeyboard {
        id: keyboard
        x: 0 - parent.x
        y: 1080-height-parent.y
        visible: false
        txtBox: textboxText

        onReturnClicked: {
            keyboard.visible = false;
            textbox.visible = false
            textboxText.visible = false;
            body.text += "·" + textboxText.text + "\n";
            textboxText.text = "";
        }
    }
}
