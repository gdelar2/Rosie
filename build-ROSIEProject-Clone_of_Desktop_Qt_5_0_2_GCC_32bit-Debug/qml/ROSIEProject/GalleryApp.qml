import QtQuick 2.0

Rectangle {


    width: 1920
    height: 980
    //color: "#000000"
    color:mainColor
    opacity: 0.700
    border.width: 3
    property variant picArray:[]
    property int picIndex:0

property int size: picArray.length


    Timer{
        id:timer
        interval:10//milliseconds
        running: false
        repeat: true

        onTriggered: {
            timer.interval=4000
            imageToDisplay.source=picArray[picIndex];
            pictureClicked.visible=true;
            grid.visible=false
           picIndex++;


        }
    }





    function picSelected(pathOfClickedPic)
{
        imageToDisplay.source=pathOfClickedPic;
        pictureClicked.visible=true;



    }





        //this rectangle is for the grid of pictures to be displayed
    Rectangle {
           id: grid
        x: 0
        y: 100
        width: 1920
        height: 750
        color: "#000000"
       // opacity: 0.800

/*
        //MouseArea created to prevent ability to click items behind this app
        MouseArea{
            anchors.fill: parent
        }
*/
//8X3 Grid

Row{
    id:row
    spacing:30
    x:3
    Repeater{
        id:rowRepeater
         model:8
        delegate:

       Column{
           id:column
            spacing: 28
            y:28

            Repeater{
                id:columnRepeater
                property int rowIndex:index;
                model:3
                delegate:
                    Image{

                    height:213 //216.66
                    width:213  //213.33
                  //  source:picArray[pictureToShow(row.index, column.index)]; //
                    source:picArray[columnRepeater.rowIndex*3+index]
                    MouseArea{

                        anchors.fill: parent

                        onClicked:{

                            if(parent.status==Image.Null){
                                //no image is loaded so do nothing
                            }else{

                            grid.visible=false

                            picSelected(parent.source);//display clicked image
                            }
                        }
                    }

                }
            }


        }



    }

}



    }//end grid rectangle

    MouseArea {
        id: playSlideButton
        x: 830
        y: 874
        width: 253
        height: 70
      //  horizontalCenter: parent.horizontalCenter
        Rectangle {
            id: rectangle1
            x: 0
            y: 0
            width: 253
            height: 70
            color: "#000000"
            radius: 13
            opacity: 0.700
            border.color: "#000000"

            Text {
                id: text1
                x: 52
                y: 21
                color: "#ffffff"
                text: qsTr("Play Slideshow")
                font.family: "Exo"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 22
            }
        }

        onClicked: {
            picIndex=0;//reset for slideshow
            timer.running=!(timer.running)
        }
    }




    //this rectangle will show the picture selected. it will take up the whole screen and will close when the user touches it
    Rectangle{

        id: pictureClicked
        width: 1920
        height:parent.height
        visible:false
        opacity: 1
        color:"black"

        Image{
            id:imageToDisplay
            width: 1920
            height:parent.height
            fillMode: Image.PreserveAspectFit
            //source:
        }

        MouseArea{
            anchors.fill: parent

            onClicked: {
                parent.visible=false;
                  grid.visible=true
                timer.running=false
            }
        }



    }
}
