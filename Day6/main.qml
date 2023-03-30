import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Day 6")

    Button{
    id:btnAdd
    width:50
    height:35
    anchors{
        top:parent.top
        left:parent.left
        }
    text:"Add"
    onClicked:{
    }
    }
}
