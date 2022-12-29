#ifndef BACKEND_QML_H
#define BACKEND_QML_H

#include <QObject>

class backend_qml : public QObject
{
    Q_OBJECT
public:
     backend_qml();
signals:
    void Qml2cpp(QByteArray qml_value);

public slots:
    QString backend_method();
};

#endif // BACKEND_QML_H
