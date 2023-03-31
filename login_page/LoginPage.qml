import QtQuick 2.0
import QtQuick.Controls 2.15

import com.login_page.LoginController 1.0

Item {
    id: loginPage
    //    width: 400
    //    height: 300
    //    color: "white"

    property string username: ""
    property string password: ""
    property bool change: false
    property variant postsJson: {"":""}
    LoginController {
        id: loginController
        onLoginResult: {
            print(success)
            if (success) {
                // Navigate to the main page
                //                        stackView.push(Qt.resolvedUrl("qrc:/qml/MainPage.qml"))
            } else {
                //                        errorMessage.text = "Invalid username or password"
                //                        errorMessage.visible = true
            }
        }
        onPostsReady:{
            postListModel.clear()
//            listView.model.clear()
            for (var i = 0; i < posts.length; ++i) {
                print(posts[i])
//                listView.model.append(posts[i])
                console.log(posts[i])
                postListModel.append(posts[i])
            }
        }
    }

    ListView {
        id: listView
        x: 220
        y: 339
        width: 200
        height: 100
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

    ListModel {
        id: postListModel
    }


    Column {
        id: loginColumn
        anchors.centerIn: parent
        spacing: 10
        TextField {
            id: usernameField
            placeholderText: "Username"
            text: loginPage.username
            onTextChanged: loginPage.username = text
        }



        TextField {
            id: passwordField
            placeholderText: "Password"
            text: loginPage.password
            onTextChanged: loginPage.password = text
            echoMode: TextInput.Password
        }

        Button {
            id: loginButton
            text: "Login"
            onClicked: {
                print("hello")
                //                print(loginController.loginResult())
                loginController.login(usernameField.text, passwordField.text)
            }
        }


    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}D{i:2}D{i:4}D{i:6}D{i:7}D{i:8}D{i:5}
}
##^##*/
