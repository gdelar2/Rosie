import QtQuick 2.0

Rectangle {
    id: vkeyb
    property variant txtBox
    property int maximumChars: 12
    property int capsLock: Font.AllLowercase
    property bool hasSpace: false
    signal returnClicked
    width: 1920
    height: 500
    color: "#000000"
    //Load the keyboard keys into a list
    ListModel {
        id: keyboardInfoModel
        ListElement {day:"1";clr:"#FFFFFF";full:false}
        ListElement {day:"2";clr:"#FFFFFF"}
        ListElement {day:"3";clr:"#FFFFFF"}
        ListElement {day:"4";clr:"#FFFFFF"}
        ListElement {day:"5";clr:"#FFFFFF"}
        ListElement {day:"6";clr:"#FFFFFF"}
        ListElement {day:"7";clr:"#FFFFFF"}
        ListElement {day:"8";clr:"#FFFFFF"}
        ListElement {day:"9";clr:"#FFFFFF"}
        ListElement {day:"0";clr:"#FFFFFF"}
        ListElement {day:"q";clr:"#FFFFFF"}
        ListElement {day:"w";clr:"#FFFFFF"}
        ListElement {day:"e";clr:"#FFFFFF"}
        ListElement {day:"r";clr:"#FFFFFF"}
        ListElement {day:"t";clr:"#FFFFFF"}
        ListElement {day:"y";clr:"#FFFFFF"}
        ListElement {day:"u";clr:"#FFFFFF"}
        ListElement {day:"i";clr:"#FFFFFF"}
        ListElement {day:"o";clr:"#FFFFFF"}
        ListElement {day:"p";clr:"#FFFFFF"}
        ListElement {day:"a";clr:"#FFFFFF"}
        ListElement {day:"s";clr:"#FFFFFF"}
        ListElement {day:"d";clr:"#FFFFFF"}
        ListElement {day:"f";clr:"#FFFFFF"}
        ListElement {day:"g";clr:"#FFFFFF"}
        ListElement {day:"h";clr:"#FFFFFF"}
        ListElement {day:"j";clr:"#FFFFFF"}
        ListElement {day:"k";clr:"#FFFFFF"}
        ListElement {day:"l";clr:"#FFFFFF"}
        ListElement {day:"";clr:"#FFFFFF";caps:true}
        ListElement {day:"←";clr:"#000000";del:true}
        ListElement {day:"z";clr:"#FFFFFF"}
        ListElement {day:"x";clr:"#FFFFFF"}
        ListElement {day:"c";clr:"#FFFFFF"}
        ListElement {day:"v";clr:"#FFFFFF"}
        ListElement {day:"b";clr:"#FFFFFF"}
        ListElement {day:"n";clr:"#FFFFFF"}
        ListElement {day:"m";clr:"#FFFFFF"}
        ListElement {day:".";clr:"#FFFFFF"}
        ListElement {day:"↵";clr:"#000000";ret:true}
    }
    Component.onCompleted: {
        //In special cases we can display a space bar
        if (hasSpace) {
            keyboardInfoModel.append({day:"SPACE",clr:"#FFFFFF",full:true})
            y -= 150;
        }
    }

    //A single key component
    Component {
        id: keyboardDelegate
        Item {
            height: (parent.height / 4)
            width: parent.width / 10

            Rectangle {
                width: parent.width
                height: parent.height
                color: mainColor

                Component.onCompleted: {
                    //Special options make it display differently
                    if(caps)
                        clIcon.visible = true;

                    if(vkeyb.capsLock)
                        clIcon.source = "Image/clOff.png"
                    else
                        clIcon.source = "Image/clOn.pnh"

                    if(full)
                        width = parent.parent.width;
                }

                Rectangle {
                    anchors.fill: parent
                    border.color: "#000000"
                    border.width: 2
                    color: mainColor;
                    opacity: .2
                }

                Rectangle {
                    id: clickRect
                    anchors.fill: parent
                    color: "#000000"
                    opacity: .3
                    visible: false
                }

                Text {
                    id:key
                    font.bold: true
                    font.pointSize: 60
                    font.family: boldFont.name
                    font.capitalization: vkeyb.capsLock
                    text: day
                    color: clr
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    opacity: .4
                }

                Image {
                    id: clIcon
                    visible: false
                    width: 64
                    height: 64
                    anchors.centerIn: parent
                    source: "Image/clOff.png"
                }

                MouseArea {
                    anchors.fill: parent
                    //Highlight when key is pressed
                    onPressed: {
                        clickRect.visible = true;
                    }

                    onClicked: {
                        //Check what key was pressed
                        if (ret) //return pressed so issue returnClicked signal
                            vkeyb.returnClicked();
                        else if(del) //delete key was pressed so remove 1 character
                            txtBox.text = txtBox.text.substr(0,txtBox.text.length-1);
                        else if (caps) //caps lock key was pressed
                            //Alternate what case the keys are in
                            if (vkeyb.capsLock == Font.AllUppercase) {
                                vkeyb.capsLock = Font.AllLowercase;
                                clIcon.source = "Image/clOff.png";
                            } else {
                                vkeyb.capsLock = Font.AllUppercase;
                                clIcon.source = "Image/clOn.png";
                            }
                        else {
                            //Check that we are under the character limit
                            if (txtBox.text.length < maximumChars) {
                                //Check for special space key
                                if (key.text === "SPACE") {
                                    txtBox.text += " ";
                                } else {
                                    //Add the key into the text box
                                    if (vkeyb.capsLock == Font.AllUppercase)
                                        txtBox.text += key.text.toUpperCase();
                                    else
                                        txtBox.text += key.text.toLowerCase();
                                }
                            }
                        }
                    }
                    //hide the highlight when key is released
                    onReleased: {
                        clickRect.visible = false;
                    }
                }
            }
        }
    }
    //Create the gridview for the keyboard
    GridView {
        id: gridView
        width: parent.width
        height: parent.height
        cellHeight: height / 4
        cellWidth: width / 10
        model: keyboardInfoModel
        delegate: keyboardDelegate

    }
}
