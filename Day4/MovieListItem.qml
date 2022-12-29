import QtQuick 2.0

Rectangle {

    property string name: ""
    property  int movieIndex: 0

    id: root
    color: "white"
    border{
    width:0.5
    color:"#E0E0E0"
    }

    Text {
        id: lbTitle
        anchors{
        left:parent.left
        verticalCenter: parent.verticalCenter
        leftMargin: 10
        }
        text: root.movieIndex +". "+ root.name
        font.pixelSize: parent.height*0.4
    }

    Text {
        id: lbTitle1
        text:root.name.toUpperCase()
        font.pixelSize: parent.height*0.4
        anchors{
        right:parent.right
        rightMargin: 10
        verticalCenter: parent.verticalCenter
        leftMargin: 10
        }
    }

}
