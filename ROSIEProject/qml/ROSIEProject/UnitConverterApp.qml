import QtQuick 2.0

Rectangle {
    width: 1360
    height: 760
    color: "#000000"
    opacity: 0.7

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
        x: 598
        y: 190
        color: "#ffffff"
        text: qsTr("TO")
        font.pixelSize: 70
        font.family: mediumFont.name
    }

    Rectangle {
        id: unitsFromBorder
        x: 45
        y: 450
        width: 467
        height: 84
        color: "#000000"
        visible: true
        opacity: 0.700
        border.width: 2
        border.color: "#000000"

        TextEdit {
            id: cFrom
            x: 9
            y: 10
            width: 249
            height: 74
            color: "#ffffff"
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
        x: 45
        y: 148
        width: 467
        height: 168
    }

    DropDownMenu {
        id: dropdownmenu2
        x: 763
        y: 148
        width: 467
        height: 168

    }

    Rectangle {
        id: unitstoBorder
        x: 763
        y: 450
        width: 467
        height: 84
        color: "#000000"
        opacity: 0.700
        visible: true
        border.width: 2
        border.color: "#000000"

        Text {
            id: cTo
            x: 10
            y: 10
            width: 264
            height: 64
            color: "#ffffff"
            text: conversionTo
            font.family: mediumFont.name
            font.pixelSize: 50
        }
    }
}
