import QtQuick 2.0

Rectangle {
    width: 1920
    height: 980
    color: mainColor
    property int selectedUser: -1
    property var selectedUserImage;

    onSelectedUserChanged: {
        //Only enable the password box when a user is selected
        if (selectedUser != -1)
            passwordBox.enabled = true;
        else
            passwordBox.enabled = false;
    }

    //Fill the background with a fake mouse area
    // so that we don't click things behind it
    MouseArea {
        anchors.fill: parent
    }

    //Gui elements
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
        x: (parent.width / 2) - (width/2) - 75
        anchors.top: parent.top
        anchors.topMargin: 300
        anchors.leftMargin: 20
        color: mainColor

        Component.onCompleted: {
            //Grab all the current users
            var uInfo = JSON.parse(userInfo);
            var userOverlays = "";
            for (var user in uInfo) {
                if (user != 0) {
                    var userName = uInfo[user].username;
                    var avatar = uInfo[user].avatar;

                    var anchor = "";
                    if (user != 1)
                        anchor = ' x:(200*'+(user-1)+')+(20*'+(user-1)+');';

                    //Create all the user icons dynamically
                    var newObject = Qt.createQmlObject('import QtQuick 2.0; Rectangle {'+anchor+' Rectangle{height:200;width:200;color:"#000";opacity:0.5}Image {id: user'+user+'; width: 200; height: 200; source: "' + avatar + '"} Text {anchors.top: user'+user+'.bottom;anchors.horizontalCenter: user'+user+'.horizontalCenter;font.family:mediumFont.name;font.pointSize:32;text:"'+userName+'";} Rectangle{id:user'+user+'Overlay; anchors.fill:user'+user+';color:"#FFF";opacity:0.2;visible:false}MouseArea { anchors.fill: user'+user+'; onClicked: {if(selectedUser==-1 && user'+user+'Overlay.visible==false){user'+user+'Overlay.visible = true;selectedUser = '+user+'}else if (selectedUser=='+user+' && user'+user+'Overlay.visible == true){selectedUser=-1;user'+user+'Overlay.visible=false;}}}}',
                         userList, "dynamicImg1");
                    if (user != 1)
                        x -= (110);
                }
            }
        }
    }

    //Show the password text box
    Textbox {
        id: passwordBox
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 200
        enabled: false;

        onTextEntered: {
            var uInfo = JSON.parse(userInfo);
            //Check if passwords match
            if (uInfo[selectedUser].password === strText) {
                //Update the current user and refresh the home screen
                currentUser = selectedUser;
                refreshHome();
            } else
                errorTxt.visible = true;
            strText  = "";
        }
    }
}
