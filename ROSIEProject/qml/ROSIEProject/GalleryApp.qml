import QtQuick 2.0

Rectangle {


    width: 1920
    height: 980
    //color: "#000000"
    color:mainColor
    opacity: 0.700
    border.width: 3
    property variant picArray:picPaths//array with the paths of all the pictures in the GalleryPhotos folder.
    property int picIndex:0

    property int size: picArray.length


    Timer{//timer for the slide show
        id:timer
        interval:10//initialy 10 so that when the playSlide button is clicked, the first slide appears instantly
        running: false
        repeat: true

        onTriggered: {
            timer.interval=4000//4 seconds is the length that every picture will appear during the slide show

            imageToDisplay.source=picArray[picIndex];
            pictureClicked.visible=true;
            grid.visible=false
                playSlideButton.visible=false

           picIndex++;

             if(picIndex==size){//return to the begining of the array when the last picture is shown
                 picIndex=0;
             }


        }
    }





    function picSelected(pathOfClickedPic)//this function helps determine which picture was clicked to be enlarged
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
         model:8//repeate the column 8 times
        delegate:

       Column{
           id:column
            spacing: 28
            y:28

            Repeater{
                id:columnRepeater
                property int rowIndex:index;
                model:3//3 pictures per column
                delegate:
                    Image{

                    height:213
                    width:213

                    source:picArray[columnRepeater.rowIndex*3+index]//
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
    Rectangle{//rectangle that takes up



        id: pictureClicked
        width: 1920
        height:parent.height
        visible:false
        opacity: 1
       // color:"black"
        color:mainColor

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
                playSlideButton.visible=true
            }
        }



    }
}
