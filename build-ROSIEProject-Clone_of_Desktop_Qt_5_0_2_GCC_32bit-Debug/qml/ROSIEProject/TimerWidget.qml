import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    width: 600
    //height: 650
    height:450
    color: "#000000"
    opacity: 0.7
    radius: 13
    //minutes are seconds and hours are minutes
    //property int seconds:0
    property int minutes:0
    property int hours: 0
    property bool start:false
    property bool draggable: true;

    function timeHandler(){
        if(start){
           minutes=((minutes)%60)-1;
           if(minutes==-1){
               minutes=59;
               hours--;
               if(hours==-1)hours=23;
           }
           if(hours==0&&minutes==0){
               timerStatusText.text="DONE!!!"
               alarm.play()
               start=false;
           }
        }
    }

    //drag code
    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: application.width - parent.width
        drag.minimumY: 100
        drag.maximumY: application.height - parent.height

        onPressed: {
            if(!draggable)
                drag.target = null;
        }
    }

    Audio{
        id: alarm
        source: "music/alarm.mp3"
    }

    Timer{
        interval:60000//milliseconds
        running: true
        repeat: true

        onTriggered: {
            timeHandler()
        }
    }


    Text {
        id: convertTitle
        x: 12
        y: 10
        width: 523
        height: 48
        color: "#ffffff"
        text: qsTr("Timer")
        style: Text.Raised
        anchors.left: parent.left
        anchors.leftMargin: 12
        font.bold: true
        font.family: mediumFont.name
        verticalAlignment: Text.AlignVCenter
        opacity: 1
        font.pixelSize: 36
    }

    Rectangle {
        id: leftRectangle
        x: 12
        y: 94
        width: 200
        height: 200
        color: "#000000"

        Text {
            id: hourTitle
            x: 76
            y: 157
            color: "#ffffff"
            text: qsTr("Hours")
            font.bold: true
            font.family: mediumFont.name
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 22
        }

        Text {
            id: hour
            x: 25
            y: 3
            color: "#ffffff"
            text: qsTr(""+hours)
            font.family: mediumFont.name
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 137
        }
    }

    Rectangle {
        id: rightRectangle
        x: 306
        y: 94
        width: 200
        height: 200
        color: "#000000"

        Text {
            id: minuteTitle
            x: 67
            y: 160
            color: "#ffffff"
            text: qsTr("Minutes")
            font.bold: true
            font.family: mediumFont.name
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: minute
            x: 27
            y: 6
            color: "#ffffff"
            text: qsTr(""+(minutes))
            verticalAlignment: Text.AlignVCenter
            font.family: mediumFont.name
            font.pixelSize: 137
            horizontalAlignment: Text.AlignHCenter
        }
    }





        Rectangle {
            id: rectangle4
            x: 220
            y: 108
            width: 75
            height: 75
            color: "#000000"
            opacity: 0.800

            Text {
                id: uparrow1
                x: 23
                y: 55
                width: 30
                height: 0
                color: "#ffffff"
                text: qsTr("^")
                style: Text.Raised
                font.bold: true
                font.family: mediumFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 125
            }
            MouseArea {
                id: hoursUpButton
               anchors.fill: parent

             onClicked  :{
                 hours=((hours+1)%24);

                }

            }
}






        Rectangle {
            id: rectangle7
            x: 517
            y: 108
            width: 75
            height: 75
            color: "#000000"
            opacity: 0.800

            Text {
                id: uparrow2
                x: 23
                y: 55
                width: 30
                height: 0
                color: "#ffffff"
                text: qsTr("^")
                style: Text.Raised
                font.pixelSize: 125
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: mediumFont.name
                font.bold: true
            }
            MouseArea {
                id: upButton2
                 anchors.fill: parent

                 onClicked:{
                     minutes=((minutes+1)%60);
                 }

            }
        }




        Rectangle {
            id: rectangle5
            x: 220
            y: 195
            width: 75
            height: 75
            color: "#000000"
            opacity: 0.800

            Text {
                id: downarrow1
                x: 20
                y: 20
                width: 30
                height: 0
                color: "#ffffff"
                text: qsTr("^")
                rotation: 180
                style: Text.Raised
                font.pixelSize: 125
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: mediumFont.name
                font.bold: true
            }

            MouseArea {
                id: downButton1
                anchors.fill: parent
               onClicked:{
                   hours--;
                   if(hours==-1) hours=23
               }
            }
        }




        Rectangle {
            id: rectangle6
            x: 517
            y: 195
            width: 75
            height: 75
            color: "#000000"
            opacity: 0.800

            Text {
                id: downarrow2
                x: 20
                y: 20
                width: 30
                height: 0
                color: "#ffffff"
                text: qsTr("^")
                rotation: 180
                style: Text.Raised
                font.pixelSize: 125
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: mediumFont.name
                font.bold: true
            }
            MouseArea {
                id: downButton2
                anchors.fill: parent

                onClicked:{
                   minutes--;
                    if(minutes==-1)minutes=59;
                }
            }
        }



    MouseArea {
        id: startButton
        //x: 12
        anchors.horizontalCenter: parent.horizontalCenter
        y: 329
        width: 241
        height: 70

        Rectangle {
            id: startRectangle
            x: 0
            y: 0
           anchors.fill: startButton
            color: "#000000"
            opacity: 0.800
            radius:13
            Text {
                id: startText
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter:  parent.verticalCenter
               // x: 84
                //y: 14
                color: "#ffffff"
                text: qsTr("Start/Stop")
                font.family: mediumFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 32
            }
        }

        onClicked: {
            start=!start
            if(start){
             timerStatusText.text=qsTr("Running")
                //rectangle4.visible=false;
            }
            else{
                timerStatusText.text=qsTr("Not Running")}

        }
    }




    //status

    Text{
        id: timerStatusText
        text:qsTr("Not Running")
       // x:250
        anchors.horizontalCenter: parent.horizontalCenter
        y:convertTitle.y
        font.pixelSize: 32
        font.family: mediumFont.name
        color: "#ffffff"

    }



}
