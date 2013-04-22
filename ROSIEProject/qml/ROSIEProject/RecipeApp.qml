import QtQuick 2.0

Rectangle {
    width: 1920
    height: 980
    color: "#000000"
    opacity: 0.700
    border.width: 3

    Item{
        id: breakfast1
        property string recipeTitle: "Cereal and Milk"
        property string ingredients: "1 bowl (the bigger the better)\n
1 spoon (try it with a large serving spoon - it will change your life)\n
Box of cereal (I prefer anything with the word oats or nuts in it)\n
Milk (soy milk actually tastes great but sometimes give you gas\n"
        property string directions: "1. Carefully open the box of cereal - take care not to tear open the bag inside with too much force as this can often lead to a mess on the floor, an unpleasant sweeping task, and wasted goodness.\n2. Pour the cereal into the bowl to approximately 3/4 of the bowl's height - ensure you pour using the open end of the bag.\n3. Pour milk into the bowl (again, carefully!) until the cereal begins to float.\n4. Put the spoon in the bowl."
        property string imageSource: "Image/RecipeApp/Cereal.jpg"
    }

    Item{
        id: breakfast2
        property string recipeTitle: "French Toast"
        property string ingredients: "4 eggs\n
1 teaspoon sugar, optional\n
dash salt\n
1 cup milk\n
10 to 12 slices white bread\n
butter\n
maple syrup or other syrup\n"
        property string directions: "1. Break eggs into a wide, shallow bowl or pie plate; beat lightly with a fork. Stir in sugar, salt, and milk.
Over medium-low heat, heat griddle or skillet coated with a thin layer of butter or margarine.\n
2. Place the bread slices, one at a time, into the bowl or plate, letting slices soak up egg mixture for a few seconds, then carefully turn to coat the other side. Soak/coat only as many slices as you will be cooking at one time.\n
3. Transfer bread slices to griddle or skillet, heating slowly until bottom is golden brown. Turn and brown the other side. Serve French toast hot with butter and syrup.\n"
        property string imageSource: "Image/RecipeApp/FrenchToast.jpg"
    }

    Item{
        id: breakfast3
        property string recipeTitle: "Pancakes"
        property string ingredients: "1 1/2 cups all-purpose flour\n
3 1/2 teaspoons baking powder\n
1 teaspoon salt\n
1 tablespoon white sugar\n
1 1/4 cups milk\n
1 egg\n
3 tablespoons butter, melted\n"
        property string directions: "1.	In a large bowl, sift together the flour, baking powder, salt and sugar. Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.\n
2.	Heat a lightly oiled griddle or frying pan over medium high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.\n"
        property string imageSource: "Image/RecipeApp/Pancakes.jpg"
    }

    Item{
        id: breakfast4
        property string recipeTitle: "Soft Boiled Egg"
        property string ingredients: "Eggs\n Salt\n Pepper \n"
        property string directions: "1.	Add 1/2 inch of water to your pan and bring it to a rapid boil over medium-high heat.\n2. Once it’s boiling, add in your eggs in a single layer in the pan.\n
3. Cover the lid and set a timer for exactly 6 minutes 30 seconds. 390 seconds. No more. No less.\n4. When the timer goes off, remove the lid and immediately run the eggs under cold water for thirty seconds.\n
4. Peel Eggs\n5. Serve with Toast strips"
        property string imageSource: "Image/RecipeApp/SoftBoiledEgg.jpg"
    }

    Item{
        id: lunch1
        property string recipeTitle: "Mac and Cheese"
        property string ingredients: "1 1/2 cups uncooked elbow macaroni\n 1/4 cup butter\n 2 tablespoons all-purpose flour\n 1 teaspoon mustard powder\n 1 teaspoon ground black pepper\n 2 cups milk\n 8 ounces American cheese, cubed\n 8 ounces processed cheese food (eg.Velveeta), cubed\n 1/4 cup seasoned dry bread crumbs\n"
        property string directions: "1.	Preheat oven to 400 degrees F (205 degrees C). Butter a 1 1/2 quart casserole dish. Bring a saucepan of lightly salted water to a boil. Add macaroni, and cook until not quite done, about 6 minutes. Drain.\n
2.	In a separate saucepan, melt the butter over medium heat. Blend in the flour, mustard powder, and pepper until smooth. Slowly stir in the milk, beating out any lumps. Add the American and processed cheeses, and stir constantly until the sauce is thick and smooth.\n
3.	Drain noodles, and stir them into the cheese sauce. Transfer the mixture to the prepared casserole dish. Sprinkle bread crumbs over the top.\n
4.	Cover the dish, and bake for 20 to 25 minutes, or until sauce is thick and bubbly.\n"
        property string imageSource: "Image/RecipeApp/MacAndCheese.jpg"
    }

    Item{
        id: lunch2
        property string recipeTitle: "Peanut Butter and Jelly"
        property string ingredients: "2 slices whole wheat bread\n
1 teaspoon butter, the secret ingredient\n
1 tablespoon peanut butter\n
2 teaspoons strawberry jam\n"
        property string directions: "1. Spread a half teaspoon of butter on each slice of bread.\n
2. Spread one slice with peanut butter.\n
3. Swirl jam into peanut butter.\n
4. Cover with other slice of bread.\n
5. Devour with a glass of milk!\n"
        property string imageSource: "Image/RecipeApp/PBJ.jpg"
    }

    Item{
        id: lunch3
        property string recipeTitle: "Turkey Sandwich"
        property string ingredients: "2 slices whole wheat bread, toasted\n
1 tablespoon mayonnaise\n
2 teaspoons Dijon-style prepared mustard\n
3 slices smoked turkey breast\n
2 tablespoons guacamole\n
1/2 cup mixed salad greens\n
1/4 cup bean sprouts\n
1/4 avocado - peeled, pitted and sliced\n
3 ounces Colby-Monterey Jack cheese, sliced\n
2 slices tomato\n"
        property string directions: "1.	Spread mayonnaise on one slice of toast, then spread mustard on the other.\n2. Arrange the sliced turkey on one side. Spread guacamole over the turkey.\n3. Pile on the salad greens, bean sprouts, avocado and cheese.\n4. Finish with tomato slices, then place the remaining slice of toast on top.\n"
        property string imageSource: "Image/RecipeApp/TurkeySandwich.jpg"
    }

    Item{
        id: lunch4
        property string recipeTitle: "Chicken Noodle Soup"
        property string ingredients: "4 cups chopped, cooked chicken meat\n1 cup chopped celery\n1/4 cup chopped carrots\n1/4 cup chopped onion\n1/4 cup butter\n8 ounces egg noodles\n12 cups water\n9 cubes chicken bouillon\n1/2 teaspoon dried marjoram\n1/2 teaspoon ground black pepper\n1 bay leaf\n1 tablespoon dried parsley\n"
        property string directions: "1.	In a large stock pot, saute celery and onion in butter or margarine.\n
2.	Add chicken, carrots, water, bouillon cubes, marjoram, black pepper, bay leaf, and parsley. Simmer for 30 minutes.\n
3.	Add noodles, and simmer for 10 more minutes.\n"
        property string imageSource: "Image/RecipeApp/ChickenNoodleSoup.jpg"
    }

    Item{
        id: dinner1
        property string recipeTitle: "Spaghetti and Basil Garlic Sauce"
        property string ingredients: "1 lb penne rigate\n3 tablespoons extra virgin olive oil\n3 cloves garlic, minced\n1 pint ripe cherry tomatoes, sliced in half (approximately 1.5 cups)\n2 tablespoons fresh basil, chopped\n1 teaspoon dried red pepper flakes\nsalt and black pepper\ngrated parmesan cheese\n"
        property string directions: "1. Bring a large pot of lightly salted water to a boil. Place spaghetti in the pot, cook for 8 to 10 minutes, until al dente, and drain.\n
2. In a large bowl, toss the spaghetti with the olive oil, butter, garlic, basil, salt, and pepper until evenly coated. Serve with Parmesan cheese.\n"
        property string imageSource: "Image/RecipeApp/Spaghetti.jpg"
    }

    Item{
        id: dinner2
        property string recipeTitle: "Lemon Pepper Salmon"
        property string ingredients: "v"
        property string directions: "n"
        property string imageSource: "Image/RecipeApp/Salmon.jpg"
    }

    Item{
        id: dinner3
        property string recipeTitle: "Chorizo Mac and Cheese"
        property string ingredients: "v"
        property string directions: "n"
        property string imageSource: "Image/RecipeApp/ChorizoMacAndCheese.jpg"
    }

    Item{
        id: dinner4
        property string recipeTitle: "Fried Chicken"
        property string ingredients: "v"
        property string directions: "n"
        property string imageSource: "Image/RecipeApp/FriedChicken.jpg"
    }

    Item{
        id: snacks1
        property string recipeTitle: "Mac and Cheese"
        property string ingredients: "1 1/2 cups uncooked elbow macaroni\n 1/4 cup butter\n 2 tablespoons all-purpose flour\n 1 teaspoon mustard powder\n 1 teaspoon ground black pepper\n 2 cups milk\n 8 ounces American cheese, cubed\n 8 ounces processed cheese food (eg.Velveeta), cubed\n 1/4 cup seasoned dry bread crumbs"
        property string directions: "1.	Preheat oven to 400 degrees F (205 degrees C). Butter a 1 1/2 quart casserole dish. Bring a saucepan of lightly salted water to a boil. Add macaroni, and cook until not quite done, about 6 minutes. Drain.\n
2.	In a separate saucepan, melt the butter over medium heat. Blend in the flour, mustard powder, and pepper until smooth. Slowly stir in the milk, beating out any lumps. Add the American and processed cheeses, and stir constantly until the sauce is thick and smooth.\n
3.	Drain noodles, and stir them into the cheese sauce. Transfer the mixture to the prepared casserole dish. Sprinkle bread crumbs over the top.\n
4.	Cover the dish, and bake for 20 to 25 minutes, or until sauce is thick and bubbly.\n"
        property string imageSource: "Image/RecipeApp/MacAndCheese.jpg"
    }

    Item{
        id: snacks2
        property string recipeTitle: "Mac and Cheese"
        property string ingredients: "1 1/2 cups uncooked elbow macaroni\n 1/4 cup butter\n 2 tablespoons all-purpose flour\n 1 teaspoon mustard powder\n 1 teaspoon ground black pepper\n 2 cups milk\n 8 ounces American cheese, cubed\n 8 ounces processed cheese food (eg.Velveeta), cubed\n 1/4 cup seasoned dry bread crumbs"
        property string directions: "1.	Preheat oven to 400 degrees F (205 degrees C). Butter a 1 1/2 quart casserole dish. Bring a saucepan of lightly salted water to a boil. Add macaroni, and cook until not quite done, about 6 minutes. Drain.\n
2.	In a separate saucepan, melt the butter over medium heat. Blend in the flour, mustard powder, and pepper until smooth. Slowly stir in the milk, beating out any lumps. Add the American and processed cheeses, and stir constantly until the sauce is thick and smooth.\n
3.	Drain noodles, and stir them into the cheese sauce. Transfer the mixture to the prepared casserole dish. Sprinkle bread crumbs over the top.\n
4.	Cover the dish, and bake for 20 to 25 minutes, or until sauce is thick and bubbly.\n"
        property string imageSource: "Image/RecipeApp/MacAndCheese.jpg"
    }

    Item{
        id: snacks3
        property string recipeTitle: "Mac and Cheese"
        property string ingredients: "1 1/2 cups uncooked elbow macaroni\n 1/4 cup butter\n 2 tablespoons all-purpose flour\n 1 teaspoon mustard powder\n 1 teaspoon ground black pepper\n 2 cups milk\n 8 ounces American cheese, cubed\n 8 ounces processed cheese food (eg.Velveeta), cubed\n 1/4 cup seasoned dry bread crumbs"
        property string directions: "1.	Preheat oven to 400 degrees F (205 degrees C). Butter a 1 1/2 quart casserole dish. Bring a saucepan of lightly salted water to a boil. Add macaroni, and cook until not quite done, about 6 minutes. Drain.\n
2.	In a separate saucepan, melt the butter over medium heat. Blend in the flour, mustard powder, and pepper until smooth. Slowly stir in the milk, beating out any lumps. Add the American and processed cheeses, and stir constantly until the sauce is thick and smooth.\n
3.	Drain noodles, and stir them into the cheese sauce. Transfer the mixture to the prepared casserole dish. Sprinkle bread crumbs over the top.\n
4.	Cover the dish, and bake for 20 to 25 minutes, or until sauce is thick and bubbly.\n"
        property string imageSource: "Image/RecipeApp/MacAndCheese.jpg"
    }

    Item{
        id: snacks4
        property string recipeTitle: "Mac and Cheese"
        property string ingredients: "1 1/2 cups uncooked elbow macaroni\n 1/4 cup butter\n 2 tablespoons all-purpose flour\n 1 teaspoon mustard powder\n 1 teaspoon ground black pepper\n 2 cups milk\n 8 ounces American cheese, cubed\n 8 ounces processed cheese food (eg.Velveeta), cubed\n 1/4 cup seasoned dry bread crumbs"
        property string directions: "1.	Preheat oven to 400 degrees F (205 degrees C). Butter a 1 1/2 quart casserole dish. Bring a saucepan of lightly salted water to a boil. Add macaroni, and cook until not quite done, about 6 minutes. Drain.\n
2.	In a separate saucepan, melt the butter over medium heat. Blend in the flour, mustard powder, and pepper until smooth. Slowly stir in the milk, beating out any lumps. Add the American and processed cheeses, and stir constantly until the sauce is thick and smooth.\n
3.	Drain noodles, and stir them into the cheese sauce. Transfer the mixture to the prepared casserole dish. Sprinkle bread crumbs over the top.\n
4.	Cover the dish, and bake for 20 to 25 minutes, or until sauce is thick and bubbly.\n"
        property string imageSource: "Image/RecipeApp/MacAndCheese.jpg"
    }


    MouseArea {
        id: breakfastButton
        x: 0
        y: 128
        width: 495
        height: 150

        Rectangle {
            id: rectangle1
            x: -105
            y: 0
            width: 600
            height: 150
            color: "#000000"
            radius: 13
            border.width: 3
            border.color: "#000000"

            Text {
                id: text1
                x: 240
                y: 28
                width: 312
                height: 94
                color: "#ffffff"
                text: qsTr("Breakfast")
                font.bold: true
                font.family: mediumFont.bold
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 70
            }
        }
    }

    MouseArea {
        id: lunchButton
        x: 0
        y: 321
        width: 495
        height: 150

        Rectangle {
            id: rectangle2
            x: -105
            y: 0
            width: 600
            height: 150
            color: "#000000"
            radius: 13
            border.width: 3
            border.color: "#000000"

            Text {
                id: text2
                x: 240
                y: 28
                width: 312
                height: 94
                color: "#ffffff"
                text: qsTr("Lunch")
                font.pixelSize: 70
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                font.family: mediumFont.bold
                horizontalAlignment: Text.AlignRight
            }
        }
    }


    MouseArea {
        id: dinnerButton
        x: 0
        y: 514
        width: 497
        height: 153

        Rectangle {
            id: rectangle3
            x: -105
            y: 2
            width: 600
            height: 150
            color: "#000000"
            radius: 13
            border.width: 3
            border.color: "#000000"

            Text {
                id: text3
                x: 240
                y: 33
                width: 312
                height: 94
                color: "#ffffff"
                text: qsTr("Dinner")
                font.bold: true
                font.family: mediumFont.bold
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 70
            }
        }
    }

    MouseArea {
        id: snacksButton
        x: 0
        y: 711
        width: 495
        height: 150

        Rectangle {
            id: rectangle4
            x: -105
            y: 0
            width: 600
            height: 150
            color: "#000000"
            radius: 13
            border.width: 3
            border.color: "#000000"

            Text {
                id: text4
                x: 240
                y: 33
                width: 312
                height: 94
                color: "#ffffff"
                text: qsTr("Snacks")
                font.family: mediumFont.bold
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 70
            }
        }
    }

    Rectangle {
        id: rectangle5
        x: 639
        y: 116
        width: 1200
        height: 806
        color: "#000000"
        radius: 0
        border.width: 3
        opacity: 0.500
        border.color: "#000000"

        MouseArea {
            id: item1Button
            x: 65
            y: 30
            width: 1070
            height: 170

            Rectangle {
                id: rectangle6
                x: 0
                y: 0
                width: 1070
                height: 170
                color: "#000000"
                radius: 13
                border.color: "#000000"

                Image {
                    id: image1
                    x: 16
                    y: 12
                    width: 190
                    height: 145
                    source: lunch1.imageSource
                }

                Text {
                    id: text5
                    x: 226
                    y: 12
                    width: 807
                    height: 145
                    color: "#ffffff"
                    text: lunch1.recipeTitle
                    font.family: mediumFont
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 70
                }
            }
        }

        MouseArea {
            id: item2Button
            x: 65
            y: 218
            width: 1070
            height: 170

            Rectangle {
                id: rectangle7
                x: 0
                y: 0
                width: 1070
                height: 170
                color: "#000000"
                radius: 13
                border.color: "#000000"

                Image {
                    id: image2
                    x: 16
                    y: 12
                    width: 190
                    height: 145
                    source: "qrc:/qtquickplugin/images/template_image.png"
                }

                Text {
                    id: text6
                    x: 226
                    y: 13
                    width: 807
                    height: 145
                    color: "#ffffff"
                    text: qsTr("text")
                    horizontalAlignment: Text.AlignLeft
                    font.family: mediumFont
                    font.pixelSize: 70
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        MouseArea {
            id: item3Button
            x: 65
            y: 408
            width: 1070
            height: 170

            Rectangle {
                id: rectangle8
                x: 0
                y: 0
                width: 1070
                height: 170
                color: "#000000"
                radius: 13

                Image {
                    id: image3
                    x: 16
                    y: 12
                    width: 190
                    height: 145
                    source: "qrc:/qtquickplugin/images/template_image.png"
                }

                Text {
                    id: text7
                    x: 224
                    y: 12
                    width: 807
                    height: 145
                    color: "#ffffff"
                    text: qsTr("text")
                    horizontalAlignment: Text.AlignLeft
                    font.family: mediumFont
                    font.pixelSize: 70
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        MouseArea {
            id: item4Button
            x: 65
            y: 597
            width: 1070
            height: 170

            Rectangle {
                id: rectangle9
                x: 0
                y: 0
                width: 1070
                height: 170
                color: "#000000"
                radius: 13
                border.color: "#000000"

                Image {
                    id: image4
                    x: 16
                    y: 11
                    width: 190
                    height: 145
                    source: "qrc:/qtquickplugin/images/template_image.png"
                }

                Text {
                    id: text8
                    x: 226
                    y: 11
                    width: 807
                    height: 145
                    color: "#ffffff"
                    text: qsTr("text")
                    horizontalAlignment: Text.AlignLeft
                    font.family: mediumFont
                    font.pixelSize: 70
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

    }

}
