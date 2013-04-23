import QtQuick 2.0

Rectangle {
    width: 1920
    height: 980
    color: mainColor
    opacity: 1
    border.width: 3
    property int stateCode: 0

    Rectangle {
        id: rectangle5
        x: 639
        y: 116
        width: 1200
        height: 806
        color: "#000000"
        radius: 0
        opacity: 0.700



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
                opacity: 0.700

                Image {
                    id: item1image
                    x: 16
                    y: 12
                    width: 190
                    height: 145
                    source: ""
                }

                Text {
                    id: item1text
                    x: 226
                    y: 12
                    width: 807
                    height: 145
                    color: "#ffffff"
                    text: ""
                    font.family: mediumFont.name
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 70
                }
            }

            onClicked:{
                rectangle5.visible = false
                if(stateCode === 1)
                    recipeview1.setRecipe(breakfast1.recipeTitle, breakfast1.ingredients, breakfast1.directions, breakfast1.imageSource)
                if(stateCode === 2)
                    recipeview1.setRecipe(lunch1.recipeTitle, lunch1.ingredients, lunch1.directions, lunch1.imageSource)
                if(stateCode === 3)
                    recipeview1.setRecipe(dinner1.recipeTitle, dinner1.ingredients, dinner1.directions, dinner1.imageSource)
                if(stateCode === 4)
                    recipeview1.setRecipe(snacks1.recipeTitle, snacks1.ingredients, snacks1.directions, snacks1.imageSource)

                recipeview1.visible = true
                recipeview1.z = 10
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
                opacity: 0.700

                Image {
                    id: item2image
                    x: 16
                    y: 12
                    width: 190
                    height: 145
                    source: ""
                }

                Text {
                    id: item2text
                    x: 226
                    y: 13
                    width: 807
                    height: 145
                    color: "#ffffff"
                    text: ""
                    horizontalAlignment: Text.AlignLeft
                    font.family: mediumFont.name
                    font.pixelSize: 70
                    verticalAlignment: Text.AlignVCenter
                }
            }

            onClicked:{
                rectangle5.visible = false
                if(stateCode === 1)
                    recipeview1.setRecipe(breakfast2.recipeTitle, breakfast2.ingredients, breakfast2.directions, breakfast2.imageSource)
                if(stateCode === 2)
                    recipeview1.setRecipe(lunch2.recipeTitle, lunch2.ingredients, lunch2.directions, lunch2.imageSource)
                if(stateCode === 3)
                    recipeview1.setRecipe(dinner2.recipeTitle, dinner2.ingredients, dinner2.directions, dinner2.imageSource)
                if(stateCode === 4)
                    recipeview1.setRecipe(snacks2.recipeTitle, snacks2.ingredients, snacks2.directions, snacks2.imageSource)

                recipeview1.visible = true
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
                opacity: 0.700

                Image {
                    id: item3image
                    x: 16
                    y: 12
                    width: 190
                    height: 145
                    source: ""
                }

                Text {
                    id: item3text
                    x: 224
                    y: 12
                    width: 807
                    height: 145
                    color: "#ffffff"
                    text: ""
                    horizontalAlignment: Text.AlignLeft
                    font.family: mediumFont.name
                    font.pixelSize: 70
                    verticalAlignment: Text.AlignVCenter
                }
            }

            onClicked:{
                rectangle5.visible = false
                if(stateCode === 1)
                    recipeview1.setRecipe(breakfast3.recipeTitle, breakfast3.ingredients, breakfast3.directions, breakfast3.imageSource)
                if(stateCode === 2)
                    recipeview1.setRecipe(lunch3.recipeTitle, lunch3.ingredients, lunch3.directions, lunch3.imageSource)
                if(stateCode === 3)
                    recipeview1.setRecipe(dinner3.recipeTitle, dinner3.ingredients, dinner3.directions, dinner3.imageSource)
                if(stateCode === 4)
                    recipeview1.setRecipe(snacks3.recipeTitle, snacks3.ingredients, snacks3.directions, snacks3.imageSource)

                recipeview1.visible = true
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
                opacity: 0.700

                Image {
                    id: item4image
                    x: 16
                    y: 11
                    width: 190
                    height: 145
                    source: ""
                }

                Text {
                    id: item4text
                    x: 226
                    y: 11
                    width: 807
                    height: 145
                    color: "#ffffff"
                    text: ""
                    horizontalAlignment: Text.AlignLeft
                    font.family: mediumFont.name
                    font.pixelSize: 70
                    verticalAlignment: Text.AlignVCenter
                }
            }

            onClicked:{
                rectangle5.visible = false
                if(stateCode === 1)
                    recipeview1.setRecipe(breakfast4.recipeTitle, breakfast4.ingredients, breakfast4.directions, breakfast4.imageSource)
                if(stateCode === 2)
                    recipeview1.setRecipe(lunch4.recipeTitle, lunch4.ingredients, lunch4.directions, lunch4.imageSource)
                if(stateCode === 3)
                    recipeview1.setRecipe(dinner4.recipeTitle, dinner4.ingredients, dinner4.directions, dinner4.imageSource)

                recipeview1.visible = true
            }
        }
    }

    Item{
        id: breakfast1
        property string recipeTitle: "Cereal and Milk"
        property string ingredients: "1 bowl (the bigger the better)\n
1 spoon (try it with a large serving spoon - it will change your life)\n
Box of cereal (I prefer anything with the word oats or nuts in it)\n
Milk (soy milk actually tastes great but sometimes give you gas\n"
        property string directions: "1.Carefully open the box of cereal - take care not to tear open the bag inside with too much force as this can often lead to a mess on the floor, an unpleasant sweeping task, and wasted goodness.\n2.Pour the cereal into the bowl to approximately 3/4 of the bowl's height - ensure you pour using the open end of the bag.\n3.Pour milk into the bowl (again, carefully!) until the cereal begins to float.\n4.Put the spoon in the bowl."
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
        property string directions: "1.Break eggs into a wide, shallow bowl or pie plate; beat lightly with a fork. Stir in sugar, salt, and milk.
Over medium-low heat, heat griddle or skillet coated with a thin layer of butter or margarine.\n
2.Place the bread slices, one at a time, into the bowl or plate, letting slices soak up egg mixture for a few seconds, then carefully turn to coat the other side. Soak/coat only as many slices as you will be cooking at one time.\n
3.Transfer bread slices to griddle or skillet, heating slowly until bottom is golden brown. Turn and brown the other side. Serve French toast hot with butter and syrup.\n"
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
        property string directions: "1.In a large bowl, sift together the flour, baking powder, salt and sugar. Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.\n
2.Heat a lightly oiled griddle or frying pan over medium high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.\n"
        property string imageSource: "Image/RecipeApp/Pancakes.jpg"
    }

    Item{
        id: breakfast4
        property string recipeTitle: "Soft Boiled Egg"
        property string ingredients: "Eggs\n Salt\n Pepper \n"
        property string directions: "1.Add 1/2 inch of water to your pan and bring it to a rapid boil over medium-high heat.\n2. Once it’s boiling, add in your eggs in a single layer in the pan.\n
3.Cover the lid and set a timer for exactly 6 minutes 30 seconds. 390 seconds. No more. No less.\n4. When the timer goes off, remove the lid and immediately run the eggs under cold water for thirty seconds.\n
4.Peel Eggs\n5. Serve with Toast strips"
        property string imageSource: "Image/RecipeApp/SoftBoiledEgg.jpg"
    }

    Item{
        id: lunch1
        property string recipeTitle: "Mac and Cheese"
        property string ingredients: "1 1/2 cups uncooked elbow macaroni\n 1/4 cup butter\n 2 tablespoons all-purpose flour\n 1 teaspoon mustard powder\n 1 teaspoon ground black pepper\n 2 cups milk\n 8 ounces American cheese, cubed\n 8 ounces processed cheese food (eg.Velveeta), cubed\n 1/4 cup seasoned dry bread crumbs\n"
        property string directions: "1.Preheat oven to 400 degrees F (205 degrees C). Butter a 1 1/2 quart casserole dish. Bring a saucepan of lightly salted water to a boil. Add macaroni, and cook until not quite done, about 6 minutes. Drain.\n
2.In a separate saucepan, melt the butter over medium heat. Blend in the flour, mustard powder, and pepper until smooth. Slowly stir in the milk, beating out any lumps. Add the American and processed cheeses, and stir constantly until the sauce is thick and smooth.\n
3.Drain noodles, and stir them into the cheese sauce. Transfer the mixture to the prepared casserole dish. Sprinkle bread crumbs over the top.\n
4.Cover the dish, and bake for 20 to 25 minutes, or until sauce is thick and bubbly.\n"
        property string imageSource: "Image/RecipeApp/MacAndCheese.jpg"
    }

    Item{
        id: lunch2
        property string recipeTitle: "Peanut Butter and Jelly"
        property string ingredients: "2 slices whole wheat bread\n
1 teaspoon butter, the secret ingredient\n
1 tablespoon peanut butter\n
2 teaspoons strawberry jam\n"
        property string directions: "1.Spread a half teaspoon of butter on each slice of bread.\n
2.Spread one slice with peanut butter.\n
3.Swirl jam into peanut butter.\n
4.Cover with other slice of bread.\n
5.Devour with a glass of milk!\n"
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
        property string directions: "1.Spread mayonnaise on one slice of toast, then spread mustard on the other.\n2.Arrange the sliced turkey on one side. Spread guacamole over the turkey.\n3.Pile on the salad greens, bean sprouts, avocado and cheese.\n4. Finish with tomato slices, then place the remaining slice of toast on top.\n"
        property string imageSource: "Image/RecipeApp/TurkeySandwich.jpg"
    }

    Item{
        id: lunch4
        property string recipeTitle: "Chicken Noodle Soup"
        property string ingredients: "4 cups chopped, cooked chicken meat\n1 cup chopped celery\n1/4 cup chopped carrots\n1/4 cup chopped onion\n1/4 cup butter\n8 ounces egg noodles\n12 cups water\n9 cubes chicken bouillon\n1/2 teaspoon dried marjoram\n1/2 teaspoon ground black pepper\n1 bay leaf\n1 tablespoon dried parsley\n"
        property string directions: "1.In a large stock pot, saute celery and onion in butter or margarine.\n
2.Add chicken, carrots, water, bouillon cubes, marjoram, black pepper, bay leaf, and parsley. Simmer for 30 minutes.\n
3.Add noodles, and simmer for 10 more minutes.\n"
        property string imageSource: "Image/RecipeApp/ChickenNoodleSoup.jpg"
    }

    Item{
        id: dinner1
        property string recipeTitle: "Spaghetti and Sauce"
        property string ingredients: "1 lb Spaghetti\n3 tablespoons extra virgin olive oil\n3 cloves garlic, minced\n1 pint ripe cherry tomatoes, sliced in half (approximately 1.5 cups)\n2 tablespoons fresh basil, chopped\n1 teaspoon dried red pepper flakes\nsalt and black pepper\ngrated parmesan cheese\n"
        property string directions: "1.Bring a large pot of lightly salted water to a boil. Place spaghetti in the pot, cook for 8 to 10 minutes, until al dente, and drain.\n
2.In a large bowl, toss the spaghetti with the olive oil, butter, garlic, basil, salt, and pepper until evenly coated. Serve with Parmesan cheese.\n"
        property string imageSource: "Image/RecipeApp/Spaghetti.jpg"
    }

    Item{
        id: dinner2
        property string recipeTitle: "Lemon Pepper Salmon"
        property string ingredients: "4 (4 ounce) salmon fillets\n
2 tablespoons butter, melted\n
2 tablespoons soy sauce\n
lemon pepper to taste\n"
        property string directions: "1.Preheat the oven broiler. Lightly grease a baking sheet.\n
2.Place salmon on the baking sheet. Mix the melted butter and soy sauce in a small bowl, and brush over the salmon. Sprinkle salmon with lemon pepper.\n
3.Broil salmon 6 to 8 minutes, depending on thickness, or until easily flaked with a fork.\n"
        property string imageSource: "Image/RecipeApp/Salmon.jpg"
    }

    Item{
        id: dinner3
        property string recipeTitle: "Chorizo Mac and Cheese"
        property string ingredients: "2 cups elbow macaroni\n
1 cup milk\n
1 teaspoon corn starch\n
4 ounces shredded cheddar cheese (about 1 cup)\n
4 ounces shredded pepper jack cheese (about 1 cup)\n
6 ounces Mexican chorizo\n
1/2 cup minced red onion\n
2 Tbsp flour\n
2 teaspoons lime juice\n
2 Tbsp breadcrumbs\n
1 Tbsp butter\n"
        property string directions: "1.Mix the corn starch with the 2 cheeses in a bowl and set aside. The corn starch will help prevent the cheese sauce from getting too stringy.\n
2.Put the milk into a small saucepan and heat until steamy. Keep warm while you are preparing the recipe, do not let boil.\n
3.Put 2 quarts of water, salted with 1 Tbsp salt, into a large pot and heat to a boil. Once the water is at a full boil, add the macaroni to the pot. Return to a boil, and cook, uncovered, for about 2 minutes less than the macaroni package specifies, so that it is al dente, cooked, but still firm to the bite.\n
4.While the water is heating and the macaroni cooking, prepare the chorizo cheese sauce. Remove chorizo from its casing and put into a medium thick-bottomed saucepan on medium high heat. When the chorizo begins to sizzle, reduce the heat to medium. Cook the chorizo, stirring often, for 2 minutes. Add the minced red onion and cook the mixture until the onions soften, about 3-4 minutes.\n
5.When the macaroni is cooked, but still a bit firm, drain it and set aside. Preheat oven to 375°.\n
6.Add the flour to the pot with the chorizo and mix well. Everything will clump up. Reduce the heat to medium-low and cook, stirring constantly and scraping the bottom of the pot, for 2 minutes. Add the hot milk a tablespoon at a time, stirring constantly. When all the milk has been added, heat the mixture to a gentle simmer and cook for 2 minutes.\n
7.Mix the grated cheese into the chorizo milk sauce. Mix in the cooked macaroni into the chorizo cheese sauce. Stir in the lime juice. Pour the macaroni and cheese into a small casserole dish. Make sure the top is level. Dust the top with the breadcrumbs, then dot with the butter. Bake until the breadcrumbs are golden, about 20 to 25 minutes.\n"
        property string imageSource: "Image/RecipeApp/ChorizoMacAndCheese.png"
    }

    Item{
        id: dinner4
        property string recipeTitle: "Fried Chicken"
        property string ingredients: "3 eggs\n
1/3 cup water\n
About 1 cup hot red pepper sauce\n
2 cups self-rising flour\n
1 teaspoon pepper\n
House seasoning (1 cup salt, 1/4 cup black pepper,1/4 cup garlic powder)\n
1 (1 to 2 1/2-pound) chicken, cut into pieces\n
Oil, for frying, preferably peanut oil\n"
        property string directions: "1.In a medium size bowl, beat the eggs with the water. Add enough hot sauce so the egg mixture is bright orange. In another bowl, combine the flour and pepper. Season the chicken with the house seasoning. Dip the seasoned chicken in the egg, and then coat well in the flour mixture.\n
2.Heat the oil to 350 degrees F in a deep pot. Do not fill the pot more than 1/2 full with oil.\n
3.Fry the chicken in the oil until brown and crisp. Dark meat takes longer then white meat. It should take dark meat about 13 to 14 minutes, white meat around 8 to 10 minutes.\n"
        property string imageSource: "Image/RecipeApp/FriedChicken.jpeg"
    }

    Item{
        id: snacks1
        property string recipeTitle: "Tiramisu"
        property string ingredients: "6 egg yolks\n
3/4 cup white sugar\n
2/3 cup milk\n
1 1/4 cups heavy cream\n
1/2 teaspoon vanilla extract\n
1 pound mascarpone cheese\n
1/4 cup strong brewed coffee, room temperature\n
2 tablespoons rum\n
2 (3 ounce) packages ladyfinger cookies\n
1 tablespoon unsweetened cocoa powder\n"
        property string directions: "1.In a medium saucepan, whisk together egg yolks and sugar until well blended. Whisk in milk and cook over medium heat, stirring constantly, until mixture boils. Boil gently for 1 minute, remove from heat and allow to cool slightly. Cover tightly and chill in refrigerator 1 hour.\n
2.In a medium bowl, beat cream with vanilla until stiff peaks form. Whisk mascarpone into yolk mixture until smooth.\n
3.In a small bowl, combine coffee and rum. Split ladyfingers in half lengthwise and drizzle with coffee mixture.\n
4.Arrange half of soaked ladyfingers in bottom of a 7x11 inch dish. Spread half of mascarpone mixture over ladyfingers, then half of whipped cream over that. Repeat layers and sprinkle with cocoa. Cover and refrigerate 4 to 6 hours, until set.\n"
        property string imageSource: "Image/RecipeApp/Tiramisu.jpg"
    }

    Item{
        id: snacks2
        property string recipeTitle: "S'mores"
        property string ingredients: "1 large marshmallow\n
1 graham cracker\n
1 (1.5 ounce) bar chocolate candy bar\n"
        property string directions: "1.	Heat the marshmallow over an open flame until it begins to brown and melt.\n
2.	Break the graham cracker in half. Sandwich the chocolate between the cracker and the hot marshmallow. Allow the marshmallow to cool a moment before eating.\n"
        property string imageSource: "Image/RecipeApp/Smores.jpg"
    }

    Item{
        id: snacks3
        property string recipeTitle: "Popcorn"
        property string ingredients: "1/2 cup unpopped popcorn\n
1 teaspoon vegetable oil\n
1/2 teaspoon salt, or to taste\n"
        property string directions: "1.In a cup or small bowl, mix together the unpopped popcorn and oil. Pour the coated corn into a brown paper lunch sack, and sprinkle in the salt. Fold the top of the bag over twice to seal in the ingredients.\n
2.Cook in the microwave at full power for 2 1/2 to 3 minutes, or until you hear pauses of about 2 seconds between pops. Carefully open the bag to avoid steam, and pour into a serving bowl.\n"
        property string imageSource: "Image/RecipeApp/Popcorn.jpg"
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
            opacity: 0.600
            border.width: 3
            border.color: "#ffffff"

            Text {
                id: text1
                x: 240
                y: 28
                width: 312
                height: 94
                color: "#ffffff"
                text: qsTr("Breakfast")
                font.bold: true
                font.family: mediumFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 70
            }
        }

        onClicked: {
            rectangle1.color = "#ffffff"
            text1.color = "#000000"
            rectangle2.color = "#000000"
            text2.color = "#ffffff"
            rectangle3.color = "#000000"
            text3.color = "#ffffff"
            rectangle4.color = "#000000"
            text4.color = "#ffffff"
            item1text.text = breakfast1.recipeTitle
            item1image.source = breakfast1.imageSource
            item2text.text = breakfast2.recipeTitle
            item2image.source = breakfast2.imageSource
            item3text.text = breakfast3.recipeTitle
            item3image.source = breakfast3.imageSource
            item4text.text = breakfast4.recipeTitle
            item4image.source = breakfast4.imageSource
            recipeview1.visible = false
            rectangle5.visible = true
            stateCode = 1
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
            opacity: 0.600
            border.width: 3
            border.color: "#ffffff"

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
                font.family: mediumFont.name
                horizontalAlignment: Text.AlignRight
            }
        }

        onClicked:{
            rectangle2.color = "#ffffff"
            text2.color = "#000000"
            rectangle1.color = "#000000"
            text1.color = "#ffffff"
            rectangle3.color = "#000000"
            text3.color = "#ffffff"
            rectangle4.color = "#000000"
            text4.color = "#ffffff"
            item1text.text = lunch1.recipeTitle
            item1image.source = lunch1.imageSource
            item2text.text = lunch2.recipeTitle
            item2image.source = lunch2.imageSource
            item3text.text = lunch3.recipeTitle
            item3image.source = lunch3.imageSource
            item4text.text = lunch4.recipeTitle
            item4image.source = lunch4.imageSource
            recipeview1.visible = false
            rectangle5.visible = true
            stateCode = 2
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
            opacity: 0.600
            border.width: 3
            border.color: "#ffffff"

            Text {
                id: text3
                x: 240
                y: 33
                width: 312
                height: 94
                color: "#ffffff"
                text: qsTr("Dinner")
                font.bold: true
                font.family: mediumFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 70
            }
        }

        onClicked: {
            rectangle3.color = "#ffffff"
            text3.color = "#000000"
            rectangle1.color = "#000000"
            text1.color = "#ffffff"
            rectangle2.color = "#000000"
            text2.color = "#ffffff"
            rectangle4.color = "#000000"
            text4.color = "#ffffff"
            item1text.text = dinner1.recipeTitle
            item1image.source = dinner1.imageSource
            item2text.text = dinner2.recipeTitle
            item2image.source = dinner2.imageSource
            item3text.text = dinner3.recipeTitle
            item3image.source = dinner3.imageSource
            item4text.text = dinner4.recipeTitle
            item4image.source = dinner4.imageSource
            recipeview1.visible = false
            rectangle5.visible = true
            stateCode = 3
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
            opacity: 0.600
            border.width: 3
            border.color: "#ffffff"

            Text {
                id: text4
                x: 240
                y: 33
                width: 312
                height: 94
                color: "#ffffff"
                text: qsTr("Snacks")
                font.family: mediumFont.name
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 70
            }
        }

        onClicked:{
            rectangle4.color = "#ffffff"
            text4.color = "#000000"
            rectangle1.color = "#000000"
            text1.color = "#ffffff"
            rectangle3.color = "#000000"
            text3.color = "#ffffff"
            rectangle2.color = "#000000"
            text2.color = "#ffffff"
            item1text.text = snacks1.recipeTitle
            item1image.source = snacks1.imageSource
            item2text.text = snacks2.recipeTitle
            item2image.source = snacks2.imageSource
            item3text.text = snacks3.recipeTitle
            item3image.source = snacks3.imageSource
            item4text.text = ""
            item4image.source = ""
            recipeview1.visible = false
            rectangle5.visible = true
            stateCode = 4
        }
    }

    RecipeView {
        id: recipeview1
        x: 639
        y: 20
        visible: false
    }


}
