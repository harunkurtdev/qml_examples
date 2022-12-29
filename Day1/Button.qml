import QtQuick 2.0

Item {
    property alias text: lbTitle.text

        // ----- Signals ----- //

        signal clicked()

        id: root

        Text {
            id: lbTitle
            anchors.centerIn: parent
            font.pointSize: 12
            color: "#2196F3"
        }



   MouseArea{
   anchors.fill: parent
   onClicked: root.clicked()
   onPressed: {
               lbTitle.color = "#BBDEFB";
           }
           onReleased: {
               lbTitle.color = "#2196F3";
           }
   }
}
