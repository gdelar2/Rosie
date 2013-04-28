import QtQuick 2.0

Rectangle {
    width: 1920
    height: 980
    color: mainColor
    property int selectedUser
    property var selectedUserImage;

    onSelectedUserChanged: {
        passwordBox.enabled = true;
        //do something here maybe?
        console.log("IT CHANGED!");
    }

    MouseArea {
        anchors.fill: parent
    }

    Text {
        id: loginTxt
        width: 100
        height: 100
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -50
        font.family: mediumFont.name
        font.pointSize: 64
        text: "Login"
    }

    Text {
        id: errorTxt
        width: 100
        height: 100
        anchors.top: loginTxt.bottom
        anchors.topMargin: 15
        x: 600
        font.family: mediumFont.name
        font.pointSize: 64
        color: "red";
        text: "ERROR LOGGING IN!"
        visible: false;
    }

    Rectangle {
        id: userList
        height: 300
        x: (parent.width / 2) - (width/2) - 50
        anchors.top: parent.top
        anchors.topMargin: 300
        anchors.leftMargin: 20
        color: mainColor

        Component.onCompleted: {
            var uInfo = JSON.parse(userInfo);
            var userOverlays = "";
            for (var user in uInfo) {
                if (user !== 0) {
                    var userName = uInfo[user].username;
                    var avatar = uInfo[user].avatar;


                    var newObject = Qt.createQmlObject('import QtQuick 2.0; Rectangle {Rectangle{height:150;width:150;color:"#000";opacity:0.5}Image {id: user'+user+'; width: 150; height: 150; source: "' + avatar + '"} Rectangle{id:user'+user+'Overlay; anchors.fill:user'+user+';color:"#FFF";opacity:0.2;visible:false}MouseArea { anchors.fill: user'+user+'; onClicked: {user'+user+'Overlay.visible = true;selectedUser = '+user+'}}}',
                         userList, "dynamicImg1");

                    //need to figure out how to support more than 1 user
                }
            }
        }
    }

    Textbox {
        id: passwordBox
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 100
        enabled: false;

        onTextEntered: {
            var uInfo = JSON.parse(userInfo);
            if (uInfo[selectedUser].password === strText) {
                currentUser = selectedUser;
                refreshHome();
            } else
                errorTxt.visible = true;
            strText  = "";
        }
    }
}
