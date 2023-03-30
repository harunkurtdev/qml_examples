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

    connect(reply, &QNetworkReply::finished, [this, reply]() {
        if (reply->error() != QNetworkReply::NoError) {
            qDebug() << "Error fetching posts:" << reply->errorString();
            reply->deleteLater();
            return;
        }

        QVariantList posts;

        QByteArray data = reply->readAll();
        QJsonDocument jsonDoc = QJsonDocument::fromJson(data);
        QJsonArray jsonArray = jsonDoc.array();

        for (int i = 0; i < jsonArray.size(); i++) {
            QJsonObject postObject = jsonArray.at(i).toObject();
            QVariantMap postMap;
            postMap.insert("userId", postObject.value("userId").toInt());
            postMap.insert("id", postObject.value("id").toInt());
            postMap.insert("title", postObject.value("title").toString());
            postMap.insert("body", postObject.value("body").toString());
            posts.append(postMap);
        }

        emit getPostsResult(posts);

        reply->deleteLater();
    });
}
