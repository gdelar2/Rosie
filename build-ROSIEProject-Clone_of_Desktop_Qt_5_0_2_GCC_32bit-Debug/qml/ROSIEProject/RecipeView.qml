import QtQuick 2.0


Rectangle {
    width: 1200
    height: 906
    color: "#000000"
    opacity: 0.900

    function setRecipe(title, ingredients, directions, image){
        recipeTitleText.text = title
        ingredientsText.text = ingredients
        directionText.text = directions
        recipeImage.source = image
    }

    Rectangle {
        id: rectangle1
        x: 22
        y: 19
        width: 629
        height: 71
        color: "#000000"
        opacity: 0.900

        Text {
            id: recipeTitleText
            x: 25
            y: 0
            width: 1106
            height: 71
            color: "#ffffff"
            text: qsTr("Text")
            style: Text.Sunken
            font.family: boldFont.name
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 45
        }
    }

    Image {
        id: recipeImage
        x: 22
        y: 132
        width: 629
        height: 434
        source: "qrc:/qtquickplugin/images/template_image.png"
    }

    Rectangle {
        id: rectangle2
        x: 695
        y: 19
        width: 482
        height: 547
        color: "#000000"
        opacity: 0.900

        Text {
            id: ingredientsText
            x: 15
            y: 6
            width: 452
            height: 535
            color: "#ffffff"
            text: qsTr("text")
            wrapMode: Text.WordWrap
            font.family: mediumFont.name
            font.pixelSize: 18
        }
    }

    Rectangle {
        id: rectangle3
        x: 22
        y: 589
        width: 1155
        height: 305
        color: "#000000"
        opacity: 0.900

        Text {
            id: directionText
            x: 15
            y: 5
            width: 1125
            height: 290
            color: "#ffffff"
            text: qsTr("text")
            font.family: regularFont.name
            wrapMode: Text.WordWrap
            font.pixelSize: 16
        }
    }
}
