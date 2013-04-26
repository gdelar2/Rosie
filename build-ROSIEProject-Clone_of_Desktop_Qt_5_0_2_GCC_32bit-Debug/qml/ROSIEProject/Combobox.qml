import QtQuick 2.0

Rectangle {
    id:comboBox
    //Public variables
    property variant items
    property alias selectedItem: chosenItemText.text;
    property alias selectedIndex: listView.currentIndex;
    signal comboClicked;
    width: 655;
    height: 100;
    smooth:true;
    radius: 20
    color: mainColor

    //Function to update the selected text, in case language was switched
    function setSelectedText(t,sel) {
        chosenItemText.text = t
        selectedItem = t
        //Update the selected index as language switching seems to reset it
        selectedIndex = sel
    }

    Rectangle {
        //Set up display for selected choice
        id:chosenItem
        radius:20;
        width:parent.width - 8;
        height:comboBox.height;
        smooth:true;
        anchors.fill: parent
        color: "#FFFFFF"
        opacity: .38

        MouseArea {
            anchors.fill: parent;
            //On a click of the item, bring down the drop down menu
            onClicked: {
                comboBox.state = comboBox.state==="dropDown"?"":"dropDown"
            }
        }
    }

    Text {
        anchors.top: chosenItem.top;
        anchors.left: chosenItem.left;
        anchors.margins: 2;
        id:chosenItemText
        text:comboBox.items[0];
        font.family: mediumFont.name
        font.pointSize: 60;
        color: "#000000"
        opacity: .68
        smooth:true
    }
    //Add a down "arrow", right justified, to show that it is a combo box
    Text {
        id: arrow
        anchors.right: chosenItem.right
        anchors.rightMargin: 5
        y:-125
        font.family: mediumFont.name
        font.pointSize: 150;
        color: "#000000"
        text: "^"
        opacity: .68
        rotation: 180
    }

    Rectangle {
        //Set up the drop down menu display
        id:dropDown
        width:comboBox.width;
        height:0;
        clip:true;
        radius:20;
        anchors.top: chosenItem.bottom;
        anchors.margins: 2;
        color: mainColor
        border.color: "#000"
        border.width: 5

        Rectangle {
            anchors.fill: parent
            opacity: .38
            clip:true;
            radius:20;
        }

        ListView {
            id:listView
            height:500;
            model: comboBox.items
            currentIndex: 0
            delegate: Item {
                width:comboBox.width;
                height: comboBox.height;

                Text {
                    text: modelData
                    anchors.top: parent.top;
                    anchors.left: parent.left;
                    font.family: mediumFont.name
                    font.pointSize: 60
                    opacity: .68
                    color: "#000000"
                }
                MouseArea {
                    anchors.fill: parent;
                    //On clicking a choice, update the selected item and close the menu
                    onClicked: {
                        comboBox.state = ""
                        var prevSelection = chosenItemText.text
                        chosenItemText.text = modelData
                        listView.currentIndex = index;
                        if(chosenItemText.text != prevSelection){
                            comboBox.comboClicked();
                        }
                    }
                }
            }
        }
    }

    //Set up the dropDown state
    states: State {
        name: "dropDown";
        PropertyChanges { target: dropDown; height:115*comboBox.items.length }
    }

    //Create the transition for showing/hiding the drop down menu
    transitions: Transition {
        NumberAnimation { target: dropDown; properties: "height"; easing.type: Easing.OutExpo; duration: 1000 }
    }
}
