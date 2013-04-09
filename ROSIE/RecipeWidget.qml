import QtQuick 2.0

Rectangle {
    id: rectangle1
    width: 600
    height: 650
    opacity: 0.700
    border.width: 3

    Text {
        id: foodTitle
        x: 12
        y: 10
        width: 523
        height: 48
        text: qsTr("Spaghetti and Basil, Garlic Sauce")
        style: Text.Raised
        anchors.left: parent.left
        anchors.leftMargin: 12
        font.bold: true
        font.family: "Exo"
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
        id: serves
        x: 12
        y: 70
        width: 117
        height: 33
        text: qsTr("Serves 4")
        font.family: "Exo"
        font.pixelSize: 24
    }

    Text {
        id: timeTaken
        x: 12
        y: 114
        text: qsTr("Prep Time: 1 hour and 30 minutes")
        font.family: "Exo"
        font.pixelSize: 24
    }

    Text {
        id: ingredients
        x: 313
        y: 165
        width: 274
        height: 319
        text: "1 lb penne rigate\n3 tablespoons extra virgin olive oil\n3 cloves garlic, minced\n1 pint ripe cherry tomatoes, sliced in half (approximately 1.5 cups)\n2 tablespoons fresh basil, chopped\n1 teaspoon dried red pepper flakes\nsalt and black pepper\ngrated parmesan cheese\n"
        style: Text.Normal
        font.family: "Exo"
        font.pointSize: 11
        wrapMode: Text.WordWrap

        Rectangle {
            id: rectangle2
            x: -2
            y: 0
            width: 276
            height: 319
            color: "#ffffff"
            z: -1
            border.width: 2
            border.color: "#000000"
        }
    }

    //These bottom rectangles are going to be replaced by a Button.qml to be built later

    Rectangle {
        id: recipePageButton
        x: 51
        y: 543
        width: 200
        height: 60
        color: "#ffffff"
        border.width: 2
        border.color: "#000000"

        Text {
            id: recipePageButtonText
            x: 34
            y: 14
            text: qsTr("Go to Recipe")
            font.bold: true
            font.family: "Exo"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 24
        }
    }

    Rectangle {
        id: recipeAppButton
        x: 350
        y: 543
        width: 200
        height: 60
        color: "#ffffff"
        border.width: 2
        border.color: "#000000"

        Text {
            id: recipeAppButtonText
            x: 9
            y: 14
            text: qsTr("Go to Recipe App")
            font.family: "Exo"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 24
        }
    }

}
