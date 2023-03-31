import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

//import NavigationStack.qml


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    NavigationStack {
            id: stackView
            anchors.fill: parent
            initialItem: LoginPage {}
        }
}

