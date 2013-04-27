import QtQuick 2.0

Item{
    id:user

    function addUser(username, pw, date, time, avatar, fav1, fav2, fav3){
        user.name = username
        user.password = pw
        user.datepref = date
        user.timepref = time
        user.avatarSource = avatar
        user.app1 = fav1
        user.app2 = fav2
        user.app3 = fav3
    }

    property string name: "Starburns"
    property string password: "alex"
    property string datepref: "MM/dd/yy"
    property string timepref: "hh:mm ap"
    property string avatarSource: "Image/User/chess.png"
    property string app1: "WeatherWidget.qml"
    property string app2: "RecipeWidget.qml"
    property string app3: "VideoWidget.qml"

}
