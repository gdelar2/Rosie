import QtQuick 2.0

Rectangle {
    property string strText
    property double tboxScale: 1
    property int maxChars: 12
    signal textEntered

    width: 655;
    height: 100;
    smooth:true;
    radius: 20
    color: mainColor

    MouseArea {
        anchors.fill: parent
        onClicked: {
            textbox.visible = true;
            keyboard.visible = true;
            textboxText.visible = true;
        }
    }

    Rectangle {
        anchors.fill: parent
        smooth:true;
        radius: 20
        opacity: .38
        scale: tboxScale
    }

    Text {
        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.fill: parent
        font.family: mediumFont.name
        font.pointSize: 60
        opacity: .68
        color: "#000000"
        text: strText
        scale: tboxScale
    }

    Rectangle {
        id: textbox
        width: parent.parent.parent.parent.width
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
        text: strText
        visible: false
    }

    VirtualKeyboard {
        id: keyboard
        x:0 - parent.x - parent.parent.x-parent.parent.parent.x
        y: 1080-height-parent.y-parent.height
        visible: false
        txtBox: textboxText
        maximumChars: maxChars

        onReturnClicked: {
            textbox.visible = false;
            keyboard.visible = false;
            textboxText.visible = false;
            strText = textboxText.text;
            parent.textEntered();
            textboxText.text = "";
        }
    }
}
