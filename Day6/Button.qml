import QtQuick 2.7

Rectangle{
    property alias text: lbTitle.text

    signal clicked()
    signal held()

    id:root

    Text{
    id : lbTitle
    anchors.centerIn: parent
    font.pointSize:12
    color: "#2196F3"
    }

    MouseArea{
    id:mouseArea
    anchors.fill: parent
    onClicked:root.clicked()
    onPressed: {
        lbTitle.color = "#BBDEFB";
        }
    onReleased: {
    lbTitle.color="#2196F3";
       timer.stop();
    }
    onPressAndHold:{
    timer.start();
    root.held();}
    }

    Timer{
    id:timer
    onTriggered:{
        if(mouseArea.containsPress){
        root.held()}
    }
    interval:100
    repeat:true
    }
}
