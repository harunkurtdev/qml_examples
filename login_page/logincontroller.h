#ifndef LOGINCONTROLLER_H
#define LOGINCONTROLLER_H

#include <QObject>
#include <QtNetwork>
#include <QJsonObject>
#include <QJsonDocument>

class LoginController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
//    Q_PROPERTY(QString (username,password) READ (username,password) WRITE login_logincpp NOTIFY login_loginqml)

public:
    explicit LoginController(QObject *parent = nullptr);

    QString username() const;
    void setUsername(const QString &username);

    QString password() const;
    void setPassword(const QString &password);

//    void login(QString username,QString password);
//    void login_logincpp(const QString &username,const QString &password);


signals:
    void usernameChanged();
    void passwordChanged();
    void loginResult(bool success);
    void postsReady(QList<QObject*> posts);




public slots:
    void login(QString username,QString password);
    void getPosts();

private:
    QString m_username;
    QString m_password;
    QNetworkAccessManager *networkManager;
    QString apiUrl;
    QString getPostsapiUrl;

    void handleLoginResponse(QNetworkReply *reply);
};

#endif // LOGINCONTROLLER_H
