#include "logincontroller.h"

#include <QtNetwork>
#include <QJsonObject>
#include <QJsonDocument>

LoginController::LoginController(QObject *parent) : QObject(parent)
{
    networkManager = new QNetworkAccessManager(this);
    apiUrl = "http://example.com/api/";
    getPostsapiUrl = "https://jsonplaceholder.typicode.com/";
}

QString LoginController::username() const
{
    return m_username;
}

void LoginController::setUsername(const QString &username)
{
    if (m_username == username)
        return;

    m_username = username;
    emit usernameChanged();
}

QString LoginController::password() const
{
    return m_password;
}

void LoginController::setPassword(const QString &password)
{
    if (m_password == password)
        return;

    m_password = password;
    emit passwordChanged();
}

void LoginController::login(QString username,QString password)
{
    QJsonObject postData;
    postData["username"] = username;
    postData["password"] = password;

    QJsonDocument postDataDoc(postData);
    QByteArray postDataBytes = postDataDoc.toJson();

    QNetworkRequest request(QUrl(apiUrl + "login"));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkReply *reply = networkManager->post(request, postDataBytes);
    qDebug()<<"Recieved username and password"<<postData;
    connect(reply, &QNetworkReply::finished, [=]() {
        handleLoginResponse(reply);
    });
}

void LoginController::handleLoginResponse(QNetworkReply *reply)
{
    bool success = false;

    if (reply->error() == QNetworkReply::NoError) {
        QByteArray responseData = reply->readAll();
        QJsonObject responseJson = QJsonDocument::fromJson(responseData).object();

        success = responseJson.value("success").toBool();
    }

    //emit loginResult(success);
    getPosts();
     emit loginResult(true);

    reply->deleteLater();
}


void LoginController::getPosts()
{
    QNetworkRequest request(QUrl(getPostsapiUrl + "posts"));
    QNetworkReply *reply = networkManager->get(request);

//    connect(reply, &QNetworkReply::finished, [=]() {
//        QList<QMap<QString, QVariant>> posts;
//        QJsonDocument response = QJsonDocument::fromJson(reply->readAll());

//        if (response.isArray()) {
//            QJsonArray postsArray = response.array();
//            foreach (const QJsonValue &post, postsArray) {
//                QJsonObject postObject = post.toObject();
//                QMap<QString, QVariant> postMap;
//                postMap.insert("id", postObject.value("id").toInt());
//                postMap.insert("title", postObject.value("title").toString());
//                postMap.insert("body", postObject.value("body").toString());
//                posts.append(postMap);
//            }
//        }

//        emit postsReady(posts);
//    });



    connect(reply, &QNetworkReply::finished, this, [this, reply]() {
          if (reply->error() == QNetworkReply::NoError) {
              QList<QMap<QString, QVariant>> posts;
              QByteArray response = reply->readAll();
              QJsonDocument document = QJsonDocument::fromJson(response);
              QJsonArray postArray = document.array();
              for (int i = 0; i < postArray.size(); ++i) {
                  QJsonObject postObject = postArray.at(i).toObject();
                  QMap<QString, QVariant> postMap;
//                  postMap["userId"] = postObject.value("userId").toInt();
                  postMap["id"] = postObject.value("id").toInt();
                  postMap["title"] = postObject.value("title").toString();
                  postMap["body"] = postObject.value("body").toString();
                  posts.append(postMap);
              }
              emit postsReady(posts);
          } else {
              qDebug() << "Error: " << reply->errorString();
          }
          reply->deleteLater();
      });
}
