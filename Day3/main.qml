import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
ApplicationWindow {
    width: 320
    height: 480
    visible: true
    title: qsTr("Day 3 Slider System Text Editing")

    TextField{
        id : tfMoney
        width: parent.width
        height:70
        anchors{
        top:parent.top
        left:parent.left

        }
        font.pixelSize: 25
        placeholderText: "$0.00"
        onTextChanged: {
            _calculateTip();
            console.log(tfMoney.text.toString())
        }
    }
    Text {
        id: lbTipMoney
        text: "$0.00"
        anchors{
        top: tfMoney.bottom
        topMargin: 30
        right:slider.right
        }
        font.pixelSize: tfMoney.font.pixelSize*0.5
    }
    Text {
            id: lbTipLabel
            anchors {
                top: lbTipMoney.top
                right: lbTipMoney.left
                rightMargin: 80
            }
            text: "Tip (0%)"
            font.pixelSize: lbTipMoney.font.pixelSize
        }

    Text {
        id: lbTotalMoney
        text: "$0.00"
        font.pixelSize: lbTipMoney.font.pixelSize
        anchors{
        top:lbTipMoney.bottom
        topMargin: 10
        right:lbTipMoney.right
        }
    }
    Text {
            id: lbTotalLabel
            anchors {
                top: lbTotalMoney.top
                right: lbTipLabel.right
            }
            text: "Total:"
            font.pixelSize: lbTipMoney.font.pixelSize
        }

    Slider{
        id:slider
        width: parent.width*0.8
        anchors{
        top:lbTotalLabel.bottom
        topMargin: 10
        horizontalCenter: parent.horizontalCenter
        }
        onPositionChanged: {
        _calculateTip();
        }
    }

    function _getTipValue(){
    var money= parseFloat(tfMoney.text);
    var tip = (money*slider.position).toFixed(2);

        return isNaN(tip)? "0.00": tip;
    }

    function _calculateTip(){
        lbTipLabel.text = "Tip (" + (slider.position * 100).toFixed(0) + "%)";
        lbTipMoney.text = "$" + _getTipValue();
        var total = parseFloat(_getTipValue()) + parseFloat(tfMoney.text);
        total = isNaN(total) ? 0.00 : total;
        lbTotalMoney.text = "$" + total.toFixed(2);
    }

}
