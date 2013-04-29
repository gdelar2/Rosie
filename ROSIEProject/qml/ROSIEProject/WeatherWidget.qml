import QtQuick 2.0

Rectangle {
    width: 300
    height: 400
    color: "#000000"
    border.width: 2
    border.color: "#000000"
    opacity: 0.700
    radius: 13
    property bool draggable: true;
    property bool clickable: true;

    //Load data on load
    Component.onCompleted: getData()

    property var jsonObject
    property var city: getSetting("city");


    function loadData(jsonObject){
        //Parse the various data from the json object and display it
         currentWeatherImage.source=convertWeatherIcon(jsonObject.data.current_condition[0].weatherCode, true)
        //Respect users choice of units
        if(getSetting("units") === "F")
            currentTemp.text=qsTr(jsonObject.data.current_condition[0].temp_F+"°F")
        else
            currentTemp.text=qsTr(jsonObject.data.current_condition[0].temp_C+"°C")

        if(getSetting("units") === "F")
            maxTemp.text=qsTr(jsonObject.data.weather[0].tempMaxF+"°F")
        else
            maxTemp.text=qsTr(jsonObject.data.weather[0].tempMaxC+"°C")

        if(getSetting("units") === "F")
            minTemp.text=qsTr(jsonObject.data.weather[0].tempMinF+"°F")
        else
            minTemp.text=qsTr(jsonObject.data.weather[0].tempMinC+"°C")
        var desc = jsonObject.data.current_condition[0].weatherDesc[0].value;
        //Trim the description string if too long
        if (desc.length > 10)
            desc = desc.substring(0, 10) + "...";
        currentDesc.text=qsTr(desc)

    }

    function getData(){
        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function() {
           if (doc.readyState === XMLHttpRequest.DONE) {
               //Parse the json result
                jsonObject = JSON.parse(doc.responseText);
               loadData(jsonObject);
            }
        }
        //Fetch the weather information
        doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + city + "&format=json&num_of_days=1&extra=localObsTime&key=6d31e73ed0202130133001");
        doc.send();
    }

    //Make the widget draggable and load the weather app on click
    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height

        onClicked: {
            if(clickable)
                loadApp("WeatherApp.qml", {});
        }
        onPressed: {
            if(!draggable)
                drag.target = null;
        }
    }

    //GUI display for the weather widget
    Image {
        id: currentWeatherImage
        x: 72
        y: 5
        width: 156
        height: 156
    }

    Text {
        id: currentTemp
        //x: 112
        anchors.horizontalCenter: parent.horizontalCenter
        y: 162
        text: qsTr("text")
        font.bold: true
        font.family: boldFont.name
        color: "#FFFFFF"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 52
    }

    Text {
        id: maxTemp
        x: 189
        y: 230
        text: qsTr("text")
        font.bold: true
        font.family: mediumFont.name
        color: "#FFFFFF"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 40
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        x: 193
        y: 265
        text: qsTr("MAX")
        font.family: lightFont.name
        color: "#FFFFFF"
        opacity: .6
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 34
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: minTemp
        x: 25
        y: 230
        text: qsTr("text")
        font.bold: true
        font.family: mediumFont.name
        color: "#FFFFFF"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 40
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        x: 35
        y: 265
        text: qsTr("MIN")
        font.family: lightFont.name
        color: "#FFFFFF"
        opacity: .6
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 34
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: currentDesc
        anchors.horizontalCenter: parent.horizontalCenter
        y:320
        text: qsTr("text")
        font.bold: true
        font.family: mediumFont.name
        color: "#FFFFFF"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 40
    }
}
