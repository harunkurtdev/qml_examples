import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    property int count: 0
    id: mainWindow
    width: 320
    height: 480
    visible: true
    title: qsTr("Hello World")

    Text {
        id: lbText
        anchors.centerIn: parent
        text: mainWindow.count
        font.pointSize: 100
    }

    Button{
        id:btnTap
        width: 100
        height: 35
        anchors {
                top: lbText.bottom
                topMargin: 10
                horizontalCenter: parent.horizontalCenter
                }
        text: "T aaap"
        onClicked: {
            mainWindow.count++;
        }
    }

    Button {
            id: btnReset
            width: 100
            height: 35
            anchors {
                top: parent.top
                topMargin: 10
                right: parent.right
            }
            text: "Reset"
            onClicked: {
                mainWindow.count = 0;
            }
        }
}
