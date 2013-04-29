import QtQuick 2.0

/*This is used in the unit converter alone to work with its drop down display */

Rectangle {
    width:400;
    height: 400;
    //public variables
    property variant items: ["Gram(g)", "Kilogram(kg)", "Pound(lb)", "Liter(L)", "Milliliter(ml)", "teaspoon", "tablespoon",
        "cup"]
    property alias selectedItem: chosenItemText.text;
    property alias selectedIndex: listView.currentIndex;
    color: mainColor
    signal comboClicked;

    //fix the items in the menu so proper conversions can be done
    function setText(){
        //Update the units
        if(dropdownmenu1.selectedItem == "Gram(g)" || dropdownmenu1.selectedItem == "Kilogram(kg)" || dropdownmenu1.selectedItem == "Pound(lb)"){
            dropdownmenu2.items = ["Gram(g)", "Kilogram(kg)", "Pound(lb)"]
        }
        if(dropdownmenu1.selectedItem == "Liter(L)" || dropdownmenu1.selectedItem == "Milliliter(ml)" || dropdownmenu1.selectedItem == "teaspoon" ||
                dropdownmenu1.selectedItem == "tablespoon" || dropdownmenu1.selectedItem == "cup"){
            dropdownmenu2.items = ["Liter(L)", "Milliliter(ml)", "teaspoon", "tablespoon","cup"]
        }
    }

    //Display the menu
    Rectangle {
            id:comboBox
            width: parent.width
            height: parent.height
            z: 100;
            smooth:true;

            //the initial text shown in the menu (the currently selected item)
            Rectangle {
                id:chosenItem
                radius:4;
                width:parent.width;
                height:comboBox.height;
                color: "#c2c4c6"
                smooth:true;
                Text {
                    anchors.top: parent.top;
                    anchors.left: parent.left;
                    anchors.margins: 8;
                    id:chosenItemText
                    x: 9
                    y: 15
                    text: "Select"
                    anchors.leftMargin: 9
                    anchors.topMargin: 15
                    font.family: mediumFont.name
                    font.pointSize: 35
                    smooth:true
                }

                MouseArea {
                    width: 226
                    height: 105
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.fill: parent;
                    //show the dropdown menu on click/touch
                    onClicked: {
                        comboBox.state = comboBox.state==="dropDown"?"":"dropDown"
                        setText()
                    }
                }
            }

            Rectangle {
                id:dropDown
                width:comboBox.width;
                height:0
                clip:true;
                radius:4;
                anchors.top: chosenItem.bottom;
                anchors.margins: 2;
                color: "lightgray"

                ListView {
                    id:listView
                    height:500;
                    model: items
                    currentIndex: 0
                    delegate: Item{
                        width:comboBox.width;
                        height: 20;

                        Text {
                            text: modelData
                            anchors.top: parent.top;
                            anchors.left: parent.left;
                            anchors.margins: 5;
                            font.pixelSize: 14

                        }
                        MouseArea {
                            anchors.fill: parent;
                            //select an item to show in the main window of the menu and retract drop menu, or just
                            //retract drop menu
                            onClicked: {
                                comboBox.state = ""
                                var prevSelection = chosenItemText.text
                                chosenItemText.text = modelData
                                if(chosenItemText.text != prevSelection){
                                    comboClicked();
                                    //perform conversions from unit converter
                                    conversion()
                                }
                                listView.currentIndex = index;
                            }
                        }
                    }
                }
            }
            //Use states to animate drop down
            states: State {
                name: "dropDown";
                PropertyChanges { target: dropDown; height:20*items.length }
            }

            transitions: Transition {
                NumberAnimation { target: dropDown; properties: "height"; easing.type: Easing.OutExpo; duration: 1000 }
            }
        }
    }
