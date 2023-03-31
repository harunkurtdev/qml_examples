import QtQuick 2.0
import QtQuick.Scene2D 2.9
import QtQuick3D 1.15
import QtGamepad 1.0

Item {
    id: item1
//    id: item1
    property string titleText:"titleText"
    property int itemId : 0
    property string bodyText:"bodyText"
    property alias rowHeight: row.height

    function aaa(bodyText){
        console.log(bodyText)
    }

    MouseArea{
        width: 200
        height: 100
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: aaa(bodyText)
        Column {
            id: row
            anchors.fill: parent
//            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Text {
                id: idTextID
                text: itemId
                anchors.top: titleTextID.top
                font.pixelSize: 12
                anchors.topMargin: -20
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: titleTextID
                text: titleText
                anchors.bottom: bodyTextID.top
                font.pixelSize: 12
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: bodyTextID
                text: bodyText
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }
    }

    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:3}D{i:4}D{i:5}D{i:2}D{i:1}
}
##^##*/
