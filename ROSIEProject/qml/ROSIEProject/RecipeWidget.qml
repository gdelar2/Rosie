import QtQuick 2.0

Rectangle {
    id: rectangle1
    width: 600
    height: 650
    color: "#000000"
    opacity: 0.700
    border.width: 3
    signal widgetClicked
    property bool draggable: true;

    Text {
        id: foodTitle
        x: 12
        y: 99
        width: 523
        height: 48
        color: "#ffffff"
        text: qsTr("Spaghetti and Basil, Garlic Sauce")
        style: Text.Raised
        anchors.left: parent.left
        anchors.leftMargin: 12
        font.bold: true
        font.family: mediumFont.name
        verticalAlignment: Text.AlignVCenter
        opacity: 1
        font.pixelSize: 36
    }

    Image {
        id: foodImage
        x: 12
        y: 75
        width: 278
        height: 319
        fillMode: Image.PreserveAspectFit
        anchors.verticalCenter: parent.verticalCenter
        source: "Image/RecipeApp/Spaghetti.jpg"
    }

    Text {
        id: ingredients
        x: 313
        y: 165
        width: 274
        height: 319
        color: "#ffffff"
        text: "1 lb penne rigate\n3 tablespoons extra virgin olive oil\n3 cloves garlic, minced\n1 pint ripe cherry tomatoes, sliced in half (approximately 1.5 cups)\n2 tablespoons fresh basil, chopped\n1 teaspoon dried red pepper flakes\nsalt and black pepper\ngrated parmesan cheese\n"
        style: Text.Normal
        font.family: mediumFont.name
        font.pointSize: 11
        wrapMode: Text.WordWrap

        Rectangle {
            id: ingredientsBorder
            x: -2
            y: 0
            width: 276
            height: 319
            color: "#000000"
            opacity: 0.700
            z: -1
            border.width: 2
            border.color: "#000000"
        }
    }

    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height

        onClicked: {
            parent.widgetClicked()
        }

        onPressed: {
            if(!draggable)
                drag.target = null;
        }
    }

}
