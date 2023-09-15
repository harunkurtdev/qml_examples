import QtQuick 2.0
import QtQuick.Controls 2.15

import com.main_page.PostController 1.0

Item{

    id: mainpage
    //    width: 400
    //    height: 300
    //    color: "white"
    //    anchors.centerIn: parent.Center

    //        Component.onCompleted: {}
    PostController{
        id: postController
        onGetPostsResult:{
            postListModel.clear()
            for (var i = 0; i < posts.length; ++i) {
                print(posts[i])
                console.log(posts[i])
                postListModel.append(posts[i])
            }
        }
    }

    ListModel {
        id: postListModel
    }

    Column{
        id: mainpageColumn
        width: 320
        height: 300
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        Button {
            id:buttonJsonView
            //            background: "black"
            text: "Listeyi göster"
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function(){
                postController.getPosts()
                listModel.visible = !listModel.visible
            }
        }

        ListView {
            id: listView
            width: 200
            height: 100
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            //            width: 640
            //            height: 480
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            model: postListModel
            delegate: CardItem {
                id: cardItem1
                width: 200
                height: 100
                //            anchors.verticalCenter: parent.verticalCenter
                //            anchors.horizontalCenter: parent.horizontalCenter
                itemId: id
                bodyText: body
                titleText: title
            }
        }




    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}D{i:2}D{i:4}D{i:5}D{i:3}
}
##^##*/
