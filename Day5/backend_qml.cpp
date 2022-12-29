#include "backend_qml.h"


backend_qml::backend_qml() { }

QString backend_qml::backend_method()
{
    emit Qml2cpp("selamlar harun");


    return "<font color='yellow'>new <b>yello</b>  button</font>";
}
