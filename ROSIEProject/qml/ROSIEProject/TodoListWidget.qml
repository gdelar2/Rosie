import QtQuick 2.0
//import FileIO 1.0
Rectangle {
    property bool draggable: true;
    Rectangle {
        width: 600
        height: 650
        color: "#000000"
        opacity: 0.7
        radius: 13
        z: 1000

        Component.onCompleted: {
            //Load in any saved notes
            var notes = getSetting("widgets.todo.properties.notes");
            if (notes.length > 0) {
                for (var key in notes) {
                    body.text += "·" + notes[key].text + "\n";
                }
            }
        }

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

        //Make the widget draggable
        MouseArea {
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.XandYAxis
            drag.minimumX: 0
            drag.maximumX: application.width - parent.width
            drag.minimumY: -200
            drag.maximumY: application.height - height -300

            onPressed: {
                if(!draggable)
                    drag.target = null;
            }
        }

        //Make the + button open keyboard
        MouseArea {
            anchors.fill: addButton
            onClicked: {
                keyboard.visible = true;
                textbox.visible = true
                textboxText.visible = true;
            }
        }
    }

    //Custom keyboard for notes
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

    VirtualKeyboard { //keyboard
        id: keyboard
        x: 0 - parent.x
        y: 1080-height-parent.y
        visible: false
        txtBox: textboxText
        maximumChars:300
        //Include a spacebar
        hasSpace: true
        z: 1000

        onReturnClicked: {
            //Hide the keyboard when return is clicked
            keyboard.visible = false;
            textbox.visible = false
            textboxText.visible = false;
            var txt = textboxText.text;
            //Wrap the text
            for (var i = 0; i < txt.length; ++i) {
                if (i % 27 == 0 && i != 0) {
                    txt = txt.substring(0, i) + "\n" + txt.substring(i, txt.length);
                }
            }
            //Save the note into the users settings
            var uInfo = JSON.parse(userInfo);
            var user = uInfo[currentUser];
            var curNotes = user.widgets.todo.properties.notes;
            var curStr = JSON.stringify(curNotes);
            if (curStr === '[]')
                curStr = '[{"text":"'+txt+'"}]'
            else
                curStr = curStr.substring(0, curStr.length - 1) + '{"text":"'+txt+'"}]';
            uInfo[currentUser].widgets.todo.properties.notes = JSON.parse(curStr);
            //Save the new settings
            userInfo = JSON.stringify(uInfo);
            //Show the new note in the widget
            body.text += "·" + txt + "\n";
            textboxText.text = "";
        }
    }
}
