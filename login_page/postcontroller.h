#ifndef POSTCONTROLLER_H
#define POSTCONTROLLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>

class PostController : public QObject
{
    Q_OBJECT
public:
    explicit PostController(QObject *parent = nullptr);
    void getPosts();

signals:
    void getPostsResult(const QVariantList& posts);

private slots:
    void handleNetworkData(QNetworkReply* reply);

private:
    QNetworkAccessManager m_networkAccessManager;
};

#endif // POSTCONTROLLER_H
