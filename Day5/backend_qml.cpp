#include "backend_qml.h"
#include <QDebug>

backend_qml::backend_qml() { }

QString backend_qml::backend_method()
{
    emit Qml2cpp("selamlar harun");


    return "<font color='yellow'>new <b>yello</b>  button</font>";
}

void backend_qml::getText(QString str)
{
    QString s = "Text has "
            +QString::number(str.count())+" characters.";

    setStrToSend(s);
}

QString backend_qml::getStrToSend() const
{
    return strToSend;
}


void backend_qml::setStrToSend(QString str)
{
    strToSend = str;
    qDebug()<<"str is set "<<strToSend;
    emit strToSendChanged();
}
