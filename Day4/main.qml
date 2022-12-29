import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 320
    height: 480
    visible: true
    title: qsTr("Hello World")

    MovieListView{
    id:movieList
    anchors.fill: parent
    }
}
