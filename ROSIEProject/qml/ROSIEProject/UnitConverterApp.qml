import QtQuick 2.0

Rectangle {
    width: 1900
    height: 1000
    color: mainColor
    opacity: 1

    property string conversionTo: ""

    function conversion(){
        //conversions (26 of them total)
        if(dropdownmenu1.selectedItem == "Gram(g)" && dropdownmenu2.selectedItem == "Kilogram(kg)"){
            conversionTo = parseInt(cFrom.text)/1000
        }
        if(dropdownmenu1.selectedItem == "Gram(g)" && dropdownmenu2.selectedItem == "Pound(lb)"){
            conversionTo = parseInt(cFrom.text)*0.002
        }
        if(dropdownmenu1.selectedItem == "Kilogram(kg)" && dropdownmenu2.selectedItem == "Gram(g)"){
            conversionTo = parseInt(cFrom.text)*1000
        }
        if(dropdownmenu1.selectedItem == "Kilogram(kg)" && dropdownmenu2.selectedItem == "Pound(lb)"){
            conversionTo = parseInt(cFrom.text)*2.204
        }
        if(dropdownmenu1.selectedItem == "Pound(lb)" && dropdownmenu2.selectedItem == "Gram(g)"){
            conversionTo = parseInt(cFrom.text)*453.592
        }
        if(dropdownmenu1.selectedItem == "Pound(lb)" && dropdownmenu2.selectedItem == "Kilogram(kg)"){
            conversionTo = parseInt(cFrom.text)*0.453
        }
        if(dropdownmenu1.selectedItem == "Liter(L)" && dropdownmenu2.selectedItem == "Milliliter(ml)"){
            conversionTo = parseInt(cFrom.text)*1000
        }
        if(dropdownmenu1.selectedItem == "Liter(L)" && dropdownmenu2.selectedItem == "teaspoon"){
            conversionTo = parseInt(cFrom.text)*202.884
        }
        if(dropdownmenu1.selectedItem == "Liter(L)" && dropdownmenu2.selectedItem == "tablespoon"){
            conversionTo = parseInt(cFrom.text)*67.628
        }
        if(dropdownmenu1.selectedItem == "Liter(L)" && dropdownmenu2.selectedItem == "cup"){
            conversionTo = parseInt(cFrom.text)*4.226
        }
        if(dropdownmenu1.selectedItem == "Milliliter(ml)" && dropdownmenu2.selectedItem == "Liter(L)"){
            conversionTo = parseInt(cFrom.text)/1000
        }
        if(dropdownmenu1.selectedItem == "Milliliter(ml)" && dropdownmenu2.selectedItem == "cup"){
            conversionTo = parseInt(cFrom.text)*0.004
        }
        if(dropdownmenu1.selectedItem == "Milliliter(ml)" && dropdownmenu2.selectedItem == "teaspoon"){
            conversionTo = parseInt(cFrom.text)*0.067
        }
        if(dropdownmenu1.selectedItem == "Milliliter(ml)" && dropdownmenu2.selectedItem == "tablespoon"){
            conversionTo = parseInt(cFrom.text)*0.202
        }
        if(dropdownmenu1.selectedItem == "cup" && dropdownmenu2.selectedItem == "Liter(L)"){
            conversionTo = parseInt(cFrom.text)/4.226
        }
        if(dropdownmenu1.selectedItem == "cup" && dropdownmenu2.selectedItem == "Milliiter(ml)"){
            conversionTo = parseInt(cFrom.text)*236.588
        }
        if(dropdownmenu1.selectedItem == "cup" && dropdownmenu2.selectedItem == "teaspoon"){
            conversionTo = parseInt(cFrom.text)*47.999
        }
        if(dropdownmenu1.selectedItem == "cup" && dropdownmenu2.selectedItem == "tablespoon"){
            conversionTo = parseInt(cFrom.text)*15.999
        }
        if(dropdownmenu1.selectedItem == "teaspoon" && dropdownmenu2.selectedItem == "Liter(L)"){
            conversionTo = parseInt(cFrom.text)/202.884
        }
        if(dropdownmenu1.selectedItem == "teaspoon" && dropdownmenu2.selectedItem == "Milliliter(ml)"){
            conversionTo = parseInt(cFrom.text)/.202
        }
        if(dropdownmenu1.selectedItem == "teaspoon" && dropdownmenu2.selectedItem == "tablespoon"){
            conversionTo = parseInt(cFrom.text)*0.333
        }
        if(dropdownmenu1.selectedItem == "teaspoon" && dropdownmenu2.selectedItem == "cup"){
            conversionTo = parseInt(cFrom.text)*0.020
        }
        if(dropdownmenu1.selectedItem == "tablespoon" && dropdownmenu2.selectedItem == "Liter(L)"){
            conversionTo = parseInt(cFrom.text)/67.628
        }
        if(dropdownmenu1.selectedItem == "tablespoon" && dropdownmenu2.selectedItem == "Milliliter(ml)"){
            conversionTo = parseInt(cFrom.text)/67.628
        }
        if(dropdownmenu1.selectedItem == "tablespoon" && dropdownmenu2.selectedItem == "teaspoon"){
            conversionTo = parseInt(cFrom.text)/0.333
        }
        if(dropdownmenu1.selectedItem == "tablespoon" && dropdownmenu2.selectedItem == "cup"){
            conversionTo = parseInt(cFrom.text)/15.999
        }

    }

    Text {
        id: convertTitle
        x: 12
        y: 10
        width: 523
        height: 48
        color: "#ffffff"
        text: qsTr("Unit Converter")
        style: Text.Raised
        anchors.left: parent.left
        anchors.leftMargin: 12
        font.bold: true
        font.family: boldFont.name
        verticalAlignment: Text.AlignVCenter
        opacity: 1
        font.pixelSize: 60
    }

    Text {
        id: from
        x: 50
        y: 78
        color: "#ffffff"
        text: qsTr("From")
        font.family: mediumFont.name
        font.pixelSize: 50
    }

    Text {
        id: to
        x: 814
        y: 162
        color: "#ffffff"
        text: qsTr("TO")
        font.pixelSize: 100
        font.family: mediumFont.name
    }

    Rectangle {
        id: unitsFromBorder
        x: 33
        y: 648
        width: 695
        height: 198
        color: "#f5f0f0"
        visible: true
        opacity: 0.700
        border.width: 2
        border.color: "#000000"

        TextEdit {
            id: cFrom
            x: 10
            y: -8
            width: 685
            height: 200
            color: "#030202"
            text: qsTr("")
            font.pixelSize: 50
            font.family: mediumFont.name
        }
    }

    DropDownMenu {
        id: dropdownmenu1
        //variables to change:
        //items
        //chosenItem.text
        x: 40
        y: 138
        width: 688
        height: 312

    }

    DropDownMenu {
        id: dropdownmenu2
        x: 1043
        y: 136
        width: 688
        height: 312

    }

    Rectangle {
        id: unitstoBorder
        x: 1043
        y: 645
        width: 685
        height: 200
        color: "#fbf8f8"
        opacity: 0.700
        visible: true
        border.width: 2
        border.color: "#000000"

        Text {
            id: cTo
            x: 5
            y: 5
            width: 685
            height: 200
            color: "#0b0a0a"
            text: conversionTo
            font.family: mediumFont.name
            font.pixelSize: 50
        }
    }
}
