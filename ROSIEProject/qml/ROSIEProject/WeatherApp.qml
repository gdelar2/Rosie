import QtQuick 2.0

Rectangle {
    width: 1920
    height: 980
    color: mainColor

    //Load weather data when loaded
    Component.onCompleted: getData()

    property var jsonObject
    property string city: getSetting("city");


    function loadData(jsonObject){
        //Load all the info in the json result into the various
        // gui objects
         currentWeatherIcon.source=convertWeatherIcon(jsonObject.data.current_condition[0].weatherCode, true)

        //Make sure we respect users choices
        if (getSetting("units") === "F")
            currentTemp.text=qsTr(jsonObject.data.current_condition[0].temp_F+"°F")
        else
            currentTemp.text=qsTr(jsonObject.data.current_condition[0].temp_C+"°C")

        if (getSetting("units") === "F")
            currentHigh.text=qsTr(jsonObject.data.weather[0].tempMaxF+"°F")
        else
            currentHigh.text=qsTr(jsonObject.data.weather[0].tempMaxC+"°C")

        if (getSetting("units") === "F")
            currentLow.text=qsTr(jsonObject.data.weather[0].tempMinF+"°F")
        else
            currentLow.text=qsTr(jsonObject.data.weather[0].tempMinC+"°C")
        //Trim the string if it's too long
        var desc = jsonObject.data.current_condition[0].weatherDesc[0].value;
        if (desc.length > 14)
            desc = desc.substring(0, 14) + "...";
        currentDescription.text=qsTr(desc)

        /**
          * repeat above process for each of the five days
          *
          */

        icon1.source = convertWeatherIcon(jsonObject.data.weather[0].weatherCode, false)
        desc = jsonObject.data.weather[0].weatherDesc[0].value;
        if (desc.length > 14)
            desc = desc.substring(0, 14) + "...";
        description1.text = qsTr(desc)
        if (getSetting("units") === "F")
            low1.text = qsTr(jsonObject.data.weather[0].tempMinF+"°F")
        else
            low1.text = qsTr(jsonObject.data.weather[0].tempMinC+"°C")
        if (getSetting("units") === "F")
            high1.text = qsTr(jsonObject.data.weather[0].tempMaxF+"°F")
        else
            high1.text = qsTr(jsonObject.data.weather[0].tempMaxC+"°C")
        dayText1.text = qsTr(Qt.formatDate(jsonObject.data.weather[0].date, "dddd"))

        icon2.source = convertWeatherIcon(jsonObject.data.weather[1].weatherCode, false)
        desc = jsonObject.data.weather[1].weatherDesc[0].value;
        if (desc.length > 14)
            desc = desc.substring(0, 14) + "...";
        description2.text = qsTr(desc)
        if (getSetting("units") === "F")
            low2.text = qsTr(jsonObject.data.weather[1].tempMinF+"°F")
        else
            low2.text = qsTr(jsonObject.data.weather[1].tempMinC+"°C")
        if (getSetting("units") === "F")
            high2.text = qsTr(jsonObject.data.weather[1].tempMaxF+"°F")
        else
            high2.text = qsTr(jsonObject.data.weather[1].tempMaxC+"°C")
        dayText2.text = qsTr(Qt.formatDate(jsonObject.data.weather[1].date, "dddd"))

        icon3.source = convertWeatherIcon(jsonObject.data.weather[2].weatherCode, false)
        desc = jsonObject.data.weather[2].weatherDesc[0].value;
        if (desc.length > 14)
            desc = desc.substring(0, 14) + "...";
        description3.text = qsTr(desc)
        if (getSetting("units") === "F")
            low3.text = qsTr(jsonObject.data.weather[2].tempMinF+"°F")
        else
            low3.text = qsTr(jsonObject.data.weather[2].tempMinC+"°C")
        if (getSetting("units") === "F")
            high3.text = qsTr(jsonObject.data.weather[2].tempMaxF+"°F")
        else
            high3.text = qsTr(jsonObject.data.weather[2].tempMaxC+"°C")
        dayText3.text = qsTr(Qt.formatDate(jsonObject.data.weather[2].date, "dddd"))

        icon4.source = convertWeatherIcon(jsonObject.data.weather[3].weatherCode, false)
        desc = jsonObject.data.weather[3].weatherDesc[0].value
        if (desc.length > 14)
            desc = desc.substring(0, 14) + "...";
        description4.text = qsTr(desc)
        if (getSetting("units") === "F")
            low4.text = qsTr(jsonObject.data.weather[3].tempMinF+"°F")
        else
            low4.text = qsTr(jsonObject.data.weather[3].tempMinC+"°C")
        if (getSetting("units") === "F")
            high4.text = qsTr(jsonObject.data.weather[3].tempMaxF+"°F")
        else
            high4.text = qsTr(jsonObject.data.weather[3].tempMaxC+"°C")
        dayText4.text = qsTr(Qt.formatDate(jsonObject.data.weather[3].date, "dddd"))

        icon5.source = convertWeatherIcon(jsonObject.data.weather[4].weatherCode, false)
        desc = jsonObject.data.weather[4].weatherDesc[0].value;
        if (desc.length > 14)
            desc = desc.substring(0, 14) + "...";
        description5.text = qsTr(desc)
        if (getSetting("units") === "F")
            low5.text = qsTr(jsonObject.data.weather[4].tempMinF+"°F")
        else
            low5.text = qsTr(jsonObject.data.weather[4].tempMinC+"°C")
        if (getSetting("units") === "F")
            high5.text = qsTr(jsonObject.data.weather[4].tempMaxF+"°F")
        else
            high5.text = qsTr(jsonObject.data.weather[4].tempMaxC+"°C")
        dayText5.text = qsTr(Qt.formatDate(jsonObject.data.weather[4].date, "dddd"))

        //Clear the loading text display and show the app
        all.visible = true
        loading.visible = false
    }

    function getData(){
        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function() {
           if (doc.readyState === XMLHttpRequest.DONE) {
               //Parse the result
               jsonObject = eval('(' + doc.responseText + ')');
               loadData(jsonObject);
            }
        }
        //Load the weather data
        doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + city + "&format=json&num_of_days=5&extra=localObsTime&key=6d31e73ed0202130133001");
        doc.send();
    }

    //GUI display for the weather app below
    Text {
        id: loading
        font.family: boldFont.name
        font.bold: true
        font.pointSize: 124
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Loading..."
    }

    Rectangle {
        id: all
        visible: false

        Rectangle {
            id: currentWeatherView
            width: 1920
            height: 510
            color: mainColor

            Image {
                id: currentWeatherIcon
                width: 325
                height: 325
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -40
                y: 50
                source: "Image/Weather/1.png"
            }

            Text {
                id: currentDescription
                font.family: mediumFont.name
                font.pointSize: 60
                opacity: .68
                anchors.top: currentWeatherIcon.bottom
                anchors.verticalCenterOffset: 10
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Sunny"
            }

            Text {
                id: currentTemp
                font.family: boldFont.name
                font.pointSize: 124
                font.bold: true
                opacity: .68
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -40
                x: (parent.width / 4) - (width / 2) - 50
                text: "40F"
            }

            Text {
                id: currentLow
                font.family: boldFont.name
                font.pointSize: 100
                font.bold: true
                opacity: .68
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -40
                anchors.left: currentWeatherIcon.right
                anchors.leftMargin: 80
                text: "30F"
            }

            Text {
                font.family: lightFont.name
                font.pointSize: 60
                opacity: .45
                anchors.top: currentLow.bottom
                anchors.topMargin: -20
                anchors.horizontalCenter: currentLow.horizontalCenter
                text: "MIN"
            }

            Text {
                id: currentHigh
                font.family: boldFont.name
                font.pointSize: 100
                font.bold: true
                opacity: .68
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -40
                anchors.left: currentLow.right
                anchors.leftMargin: 150
                text: "45F"
            }

            Text {
                font.family: lightFont.name
                font.pointSize: 60
                opacity: .45
                anchors.top: currentHigh.bottom
                anchors.topMargin: -20
                anchors.horizontalCenter: currentHigh.horizontalCenter
                text: "MAX"
            }
        }

        Rectangle {
            id: futureWeatherView
            width: 1920
            height: 470
            y: 510
            color: mainColor

            Rectangle {
                id: day1
                width: parent.width / 5
                height: parent.height
                color: mainColor

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "#000000"
                    border.color: "#FFFFFF"
                    border.width: 2
                    opacity: 0.3
                }

                Image {
                    id: icon1
                    width: 202
                    height: 202
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    source: "Image/Weather/1.png"
                }

                Text {
                    id: description1
                    anchors.top: icon1.bottom
                    anchors.horizontalCenter: icon1.horizontalCenter
                    font.family: mediumFont.name
                    font.pointSize: 36
                    text: "Sunny"
                }

                Text {
                    id: low1
                    anchors.top: description1.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -(parent.width / 4)
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 36
                    text: "30F"
                }

                Text {
                    anchors.top: low1.bottom
                    anchors.topMargin: -10
                    anchors.horizontalCenter: low1.horizontalCenter
                    font.family: lightFont.name
                    font.pointSize: 24
                    opacity: .68
                    text: "MIN"
                }

                Text {
                    id: high1
                    anchors.top: description1.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: (parent.width / 4)
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 36
                    text: "45F"
                }

                Text {
                    anchors.top: high1.bottom
                    anchors.topMargin: -10
                    anchors.horizontalCenter: high1.horizontalCenter
                    font.family: lightFont.name
                    font.pointSize: 24
                    opacity: .68
                    text: "MAX"
                }

                Text {
                    id: dayText1
                    anchors.top: high1.bottom
                    anchors.topMargin: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 24
                    opacity: .68
                    text: ""
                }
            }

            Rectangle {
                id: day2
                width: parent.width / 5
                height: parent.height
                x: day1.x + day1.width
                color: mainColor

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "#000000"
                    border.color: "#FFFFFF"
                    border.width: 2
                    opacity: 0.3
                }

                Image {
                    id: icon2
                    width: 202
                    height: 202
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    source: "Image/Weather/1.png"
                }

                Text {
                    id: description2
                    anchors.top: icon2.bottom
                    anchors.horizontalCenter: icon2.horizontalCenter
                    font.family: mediumFont.name
                    font.pointSize: 36
                    text: "Sunny"
                }

                Text {
                    id: low2
                    anchors.top: description2.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -(parent.width / 4)
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 36
                    text: "30F"
                }

                Text {
                    anchors.top: low2.bottom
                    anchors.topMargin: -10
                    anchors.horizontalCenter: low2.horizontalCenter
                    font.family: lightFont.name
                    font.pointSize: 24
                    opacity: .68
                    text: "MIN"
                }

                Text {
                    id: high2
                    anchors.top: description2.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: (parent.width / 4)
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 36
                    text: "45F"
                }

                Text {
                    anchors.top: high2.bottom
                    anchors.topMargin: -10
                    anchors.horizontalCenter: high2.horizontalCenter
                    font.family: lightFont.name
                    font.pointSize: 24
                    opacity: .68
                    text: "MAX"
                }

                Text {
                    id: dayText2
                    anchors.top: high2.bottom
                    anchors.topMargin: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 24
                    opacity: .68
                    text: ""
                }
            }

            Rectangle {
                id: day3
                width: parent.width / 5
                height: parent.height
                x: day2.x + day2.width
                color: mainColor

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "#000000"
                    border.color: "#FFFFFF"
                    border.width: 2
                    opacity: 0.3
                }

                Image {
                    id: icon3
                    width: 202
                    height: 202
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    source: "Image/Weather/1.png"
                }

                Text {
                    id: description3
                    anchors.top: icon3.bottom
                    anchors.horizontalCenter: icon3.horizontalCenter
                    font.family: mediumFont.name
                    font.pointSize: 36
                    text: "Sunny"
                }

                Text {
                    id: low3
                    anchors.top: description3.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -(parent.width / 4)
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 36
                    text: "30F"
                }

                Text {
                    anchors.top: low3.bottom
                    anchors.topMargin: -10
                    anchors.horizontalCenter: low3.horizontalCenter
                    font.family: lightFont.name
                    font.pointSize: 24
                    opacity: .68
                    text: "MIN"
                }

                Text {
                    id: high3
                    anchors.top: description3.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: (parent.width / 4)
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 36
                    text: "45F"
                }

                Text {
                    anchors.top: high3.bottom
                    anchors.topMargin: -10
                    anchors.horizontalCenter: high3.horizontalCenter
                    font.family: lightFont.name
                    font.pointSize: 24
                    opacity: .68
                    text: "MAX"
                }

                Text {
                    id: dayText3
                    anchors.top: high3.bottom
                    anchors.topMargin: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 24
                    opacity: .68
                    text: ""
                }
            }

            Rectangle {
                id: day4
                width: parent.width / 5
                height: parent.height
                x: day3.x + day3.width
                color: mainColor

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "#000000"
                    border.color: "#FFFFFF"
                    border.width: 2
                    opacity: 0.3
                }

                Image {
                    id: icon4
                    width: 202
                    height: 202
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    source: "Image/Weather/1.png"
                }

                Text {
                    id: description4
                    anchors.top: icon4.bottom
                    anchors.horizontalCenter: icon4.horizontalCenter
                    font.family: mediumFont.name
                    font.pointSize: 36
                    text: "Sunny"
                }

                Text {
                    id: low4
                    anchors.top: description4.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -(parent.width / 4)
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 36
                    text: "30F"
                }

                Text {
                    anchors.top: low4.bottom
                    anchors.topMargin: -10
                    anchors.horizontalCenter: low4.horizontalCenter
                    font.family: lightFont.name
                    font.pointSize: 24
                    opacity: .68
                    text: "MIN"
                }

                Text {
                    id: high4
                    anchors.top: description4.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: (parent.width / 4)
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 36
                    text: "45F"
                }

                Text {
                    anchors.top: high4.bottom
                    anchors.topMargin: -10
                    anchors.horizontalCenter: high4.horizontalCenter
                    font.family: lightFont.name
                    font.pointSize: 24
                    opacity: .68
                    text: "MAX"
                }

                Text {
                    id: dayText4
                    anchors.top: high4.bottom
                    anchors.topMargin: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 24
                    opacity: .68
                    text: ""
                }
            }

            Rectangle {
                id: day5
                width: parent.width / 5
                height: parent.height
                x: day4.x + day4.width
                color: mainColor

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "#000000"
                    border.color: "#FFFFFF"
                    border.width: 2
                    opacity: 0.3
                }

                Image {
                    id: icon5
                    width: 202
                    height: 202
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    source: "Image/Weather/1.png"
                }

                Text {
                    id: description5
                    anchors.top: icon5.bottom
                    anchors.horizontalCenter: icon5.horizontalCenter
                    font.family: mediumFont.name
                    font.pointSize: 36
                    text: "Sunny"
                }

                Text {
                    id: low5
                    anchors.top: description5.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -(parent.width / 4)
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 36
                    text: "30F"
                }

                Text {
                    anchors.top: low5.bottom
                    anchors.topMargin: -10
                    anchors.horizontalCenter: low5.horizontalCenter
                    font.family: lightFont.name
                    font.pointSize: 24
                    opacity: .68
                    text: "MIN"
                }

                Text {
                    id: high5
                    anchors.top: description5.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: (parent.width / 4)
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 36
                    text: "45F"
                }

                Text {
                    anchors.top: high5.bottom
                    anchors.topMargin: -10
                    anchors.horizontalCenter: high5.horizontalCenter
                    font.family: lightFont.name
                    font.pointSize: 24
                    opacity: .68
                    text: "MAX"
                }

                Text {
                    id: dayText5
                    anchors.top: high5.bottom
                    anchors.topMargin: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: boldFont.name
                    font.bold: true
                    font.pointSize: 24
                    opacity: .68
                    text: ""
                }
            }
        }
    }
}
