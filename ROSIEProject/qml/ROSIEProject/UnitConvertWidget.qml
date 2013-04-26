import QtQuick 2.0

Rectangle {
    width: 600
    height: 650
    color: "#000000"
    opacity: 0.7
    signal widgetClicked

    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height
    }

    property string conversionTo: ""

    function loadApp(appQmlFile, properties) {
        var app = Qt.createComponent(appQmlFile);
        app.createObject(currentApp, properties);
        if (!currentApp.visible)
            currentApp.visible = true;
    }

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
        text: qsTr("Convert")
        style: Text.Raised
        anchors.left: parent.left
        anchors.leftMargin: 12
        font.bold: true
        font.family: mediumFont.name
        verticalAlignment: Text.AlignVCenter
        opacity: 1
        font.pixelSize: 36
    }

    Text {
        id: from
        x: 12
        y: 66
        color: "#ffffff"
        text: qsTr("From")
        font.family: mediumFont.name
        font.pixelSize: 32
    }

    Text {
        id: to
        x: 312
        y: 66
        color: "#ffffff"
        text: qsTr("To")
        font.pixelSize: 32
        font.family: mediumFont.name
    }

    Rectangle {
        id: unitsFromBorder
        x: 0
        y: 404
        width: 276
        height: 84
        color: "#fdfafa"
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
            color: "#090808"
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
        x: 0
        y: 132
        width: 276
        height: 85
    }

    DropDownMenu {
        id: dropdownmenu2
        x: 301
        y: 132
        width: 279
        height: 85

    }

    Rectangle {
        id: unitstoBorder
        x: 306
        y: 404
        width: 274
        height: 84
        color: "#fdfafa"
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
            color: "#070606"
            text: conversionTo
            font.family: mediumFont.name
            font.pixelSize: 50
        }
    }
    Text {
        id: toApp
        x: 0
        y: 614
        width: 256
        height: 36
        color: "#ffffff"
        text: qsTr("Go to App")
        font.pixelSize: 30
        font.family: mediumFont.name

        MouseArea {
            id: mouse_area1
            x: 0
            y: 0
            width: 256
            height: 36
           onClicked:{
               loadApp("UnitConverterApp.qml", {})
           }
        }
    }
}

