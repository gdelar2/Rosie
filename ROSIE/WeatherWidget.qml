import QtQuick 2.0

Rectangle {
    width: 300
    height: 400
    color: "#000000"
    border.width: 2
    border.color: "#000000"
    opacity: 0.700
    Component.onCompleted: getData()

    property var jsonObject // weather data stored hear no need to recall api
    property var city: "Chicago"


    function loadData(jsonObject){
         currentWeatherImage.source=jsonObject.data.current_condition[0].weatherIconUrl[0].value
        currentTemp.text=qsTr(jsonObject.data.current_condition[0].temp_F+"°F")

        //not sure if these max and min are the temps for tomorrow or today
        maxTemp.text=qsTr(jsonObject.data.weather[0].tempMaxF+"°F")

        minTemp.text=qsTr(jsonObject.data.weather[0].tempMinF+"°F")
        currentDesc.text=qsTr( jsonObject.data.current_condition[0].weatherDesc[0].value+"  ")

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
        doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + "Chicago" + "&format=json&num_of_days=5&extra=localObsTime&key=6d31e73ed0202130133001");
        doc.send();
    }


    Image {
        id: currentWeatherImage
        x: 72
        y: 5
        width: 156
        height: 149
       // source: "qrc:/qtquickplugin/images/template_image.png"
    }

    Text {
        id: currentTemp
        x: 112
        y: 162
        text: qsTr("text")
        font.bold: true
        font.family: mediumFont
        color: "#FFFFFF"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 40
    }

    Text {
        id: maxTemp
        x: 199
        y: 214
        text: qsTr("text")
        font.bold: true
        font.family: mediumFont
        color: "#FFFFFF"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 40
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: minTemp
        x: 35
        y: 214
        text: qsTr("text")
        font.bold: true
        font.family: mediumFont
        color: "#FFFFFF"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 40
        verticalAlignment: Text.AlignVCenter
    }

     Text{
         id: currentDesc
         //x:15
          anchors.horizontalCenter: parent.horizontalCenter
         y:300
         text: qsTr("text")
         font.bold: true
         font.family: mediumFont
         color: "#FFFFFF"
         verticalAlignment: Text.AlignVCenter
         horizontalAlignment: Text.AlignHCenter
         font.pixelSize: 40
     }
}
