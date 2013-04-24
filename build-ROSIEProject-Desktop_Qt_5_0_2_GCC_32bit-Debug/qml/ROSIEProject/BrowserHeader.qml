import QtQuick 2.0

 Image {
     id: header

     property alias editUrl: urlInput.url
     property bool urlChanged: false

     //source: "pics/titlebar-bg.png";
     fillMode: Image.TileHorizontally

     x: webView.contentX < 0 ? -webView.contentX : webView.contentX > webView.contentWidth-webView.width
        ? -webView.contentX+webView.contentWidth-webView.width : 0
     y: {
         if (webView.progress < 1.0)
             return 0;
         else {
             webView.contentY < 0 ? -webView.contentY : webView.contentY > height ? -height : -webView.contentY
         }
     }
     Column {
         width: parent.width

         Item {
             width: parent.width; height: 20
             Text {
                 anchors.centerIn: parent
                 text: webView.title; font.pixelSize: 14; font.bold: true
                 color: "white"; styleColor: "black"; style: Text.Sunken
             }
         }

         Item {
             width: parent.width; height: 40

             Button {
                 id: backButton
                 x: -169
                 y: 0
                 anchors.bottomMargin: 0
                 anchors.leftMargin: -169
                 action: webView.back; image: "Image/browser/back.png"
                 anchors { left: parent.left; bottom: parent.bottom }
             }

             Button {
                 id: nextButton
                 x: 50
                 y: 0
                 width: 10
                 height: 40
                 anchors.leftMargin: 10
                 anchors.left: backButton.right
                 action: webView.forward; image: "Image/browser/forward.png"
             }

             UrlInput {
                 id: urlInput
                 anchors { left: nextButton.right; right: reloadButton.left }
                 //image: "pics/display.png"
                 onUrlEntered: {
                     webBrowser.urlString = url
                     webBrowser.focus = true
                     header.urlChanged = false
                 }
                 onUrlChanged: header.urlChanged = true
             }

             Button {
                 id: reloadButton
                 x: 489
                 y: -10
                 //anchors { right: quitButton.left; rightMargin: 69 }
                 action: webView.reload; image: "Image/browser/refresh.png"
                 visible: webView.progress == 1.0 && !header.urlChanged
             }


             Button {
                 id: stopButton
                 x: 489
                 y: -10
                 //anchors { right: quitButton.left; rightMargin: 69 }
                 action: webView.stop; image: "Image/browser/cancel.png"
                 visible: webView.progress < 1.0 && !header.urlChanged
             }

             Button {
                 id: goButton
                 x: 420
                 y: -10
                 visible: true
                 anchors { left: reloadButton.left; leftMargin: -69 }
                 onClicked: {
                     webBrowser.urlString = urlInput.url
                     webBrowser.focus = true
                     header.urlChanged = false
                 }
                 image: "Image/browser/go.png";             }
         }
     }
 }
