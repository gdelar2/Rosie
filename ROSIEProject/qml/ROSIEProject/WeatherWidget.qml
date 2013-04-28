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

    Component.onCompleted: getData()

    property var jsonObject // weather data stored hear no need to recall api
    property var city: "Chicago"//default city


    function loadData(jsonObject){
         currentWeatherImage.source=convertWeatherIcon(jsonObject.data.current_condition[0].weatherCode, true)
        currentTemp.text=qsTr(jsonObject.data.current_condition[0].temp_F+"°F")

        //not sure if these max and min are the temps for tomorrow or today
        maxTemp.text=qsTr(jsonObject.data.weather[0].tempMaxF+"°F")

        minTemp.text=qsTr(jsonObject.data.weather[0].tempMinF+"°F")
        currentDesc.text=qsTr( jsonObject.data.current_condition[0].weatherDesc[0].value)

    }

    function getData(){
        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function() {
           if (doc.readyState == XMLHttpRequest.DONE) {
                jsonObject = eval('(' + doc.responseText + ')');
               loadData(jsonObject);
            }
        }
        // Replace YOURPRIVATEKEY by your key from free.worldweatheronline.com
        doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + city + "&format=json&num_of_days=5&extra=localObsTime&key=6d31e73ed0202130133001");
        doc.send();
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
            loadApp("WeatherApp.qml", {});
        }
        onPressed: {
            if(!draggable)
                drag.target = null;
        }
    }

    Image {
        id: currentWeatherImage
        x: 72
        y: 5
        width: 156
        height: 156
       // source: "qrc:/qtquickplugin/images/template_image.png"
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
