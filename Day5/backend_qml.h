#ifndef BACKEND_QML_H
#define BACKEND_QML_H

#include <QObject>
#include <QString>

class backend_qml : public QObject
{
    Q_OBJECT
public:
     backend_qml();     
     Q_PROPERTY(QString strToSend MEMBER m_strToSend READ getStrToSend  WRITE setStrToSend NOTIFY strToSendChanged)
     Q_INVOKABLE void getText(QString str);

signals:
    void Qml2cpp(QByteArray qml_value);
    void strToSendChanged();

    public slots:
    QString backend_method();
    QString getStrToSend() const;
    void setStrToSend(QString str);


private:
    QString strToSend;
};

#endif // BACKEND_QML_H
