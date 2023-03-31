import QtQuick 2.0
import QtQuick.Controls 2.15

import com.main_page.PostController 1.0
Item{

    id: mainpage
    //    width: 400
    //    height: 300
    //    color: "white"
    //    anchors.centerIn: parent.Center

    PostController{
    id: postController
    onGetPostsResult: function(posts){
        print(posts[0])
    }
    Component.onCompleted: {
           // fetch posts from API and populate myModel.posts
       }
    }

    Column{
        id: mainpageColumn
        anchors.centerIn: parent
        spacing: 10

        Button {
            id:buttonJsonView
            anchors.centerIn: parent
            //            background: "black"
            text: "Listeyi göster"
            onClicked: function(){
                postController.getPosts()
                listModel.visible = !listModel.visible
            }
        }

        ListView {
            id: listModel
            visible: false
            anchors.left: buttonJsonView.left
            anchors.top: buttonJsonView.bottom
            anchors.leftMargin: 0
            anchors.topMargin: 20
            model: ["Öğe 1", "Öğe 2", "Öğe 3"] // burada ListView modeli belirtilir
            delegate: Button {
                text: modelData // butonun metni, ListView'deki modelin verilerine göre ayarlanır
                onClicked: {
                    console.log("Seçilen öğe:", modelData)
                }
            }

        }
    }
}
