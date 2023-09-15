#include "postcontroller.h"
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>

PostController::PostController(QObject *parent) : QObject(parent)
{

}

void PostController::getPosts()
{
    QNetworkRequest request(QUrl("https://jsonplaceholder.typicode.com/posts"));
    QNetworkReply* reply = m_networkAccessManager.get(request);

//    connect(reply, &QNetworkReply::finished, [this, reply]() {
//        if (reply->error() != QNetworkReply::NoError) {
//            qDebug() << "Error fetching posts:" << reply->errorString();
//            reply->deleteLater();
//            return;
//        }

//        QList<QObject*> posts;
//        QJsonDocument response = QJsonDocument::fromJson(reply->readAll());

//        if (response.isArray()) {
//            QJsonArray postsArray = response.array();
//            foreach (const QJsonValue &post, postsArray) {
//                QJsonObject postObject = post.toObject();
//                QObject *postItem = new QObject();
////                qDebug()<<postObject.value("id").toInt();
//                postItem->setProperty("id", postObject.value("id").toInt());
//                postItem->setProperty("title", postObject.value("title").toString());
//                postItem->setProperty("body", postObject.value("body").toString());
//                posts.append(postItem);
//            }
//        }

//        emit getPostsResult(posts);

//        reply->deleteLater();
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
              emit getPostsResult(posts);
          } else {
              qDebug() << "Error: " << reply->errorString();
          }

          reply->deleteLater();
      });
}
