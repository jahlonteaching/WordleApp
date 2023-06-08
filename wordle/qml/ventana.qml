import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 240
    height: 300
    visible: true
    title: qsTr("Wordle App")
    flags: Qt.WindowTitleHint | Qt.CustomizeWindowHint
           | Qt.WindowMinimizeButtonHint | Qt.WindowCloseButtonHint
           | Qt.MSWindowsFixedSizeDialogHint
    property Item active_row;

    Component.onCompleted: {
        var component = Qt.createComponent("fila.qml");
        for (var i=0; i<5; i++) {
            var newY = (50 * i) + 5;
            var row = component.createObject(window, {
                                                y: newY,
                                                x: 5,
                                                "anchors.horizontalCenter": window.horizontalCenter,
                                                "anchors.horizontalCenterOffset": 0
                                             });
            row.objectName = "row_" + (i+1);
            if(i == 0) {
                active_row = row;
            }
        }
        window.activeFocusItem = active_row;
    }

    Text {
        id: text_msg
        y: 265
        width: 217
        height: 25
        text: qsTr("Felicitaciones!")
        anchors.bottom: parent.bottom
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
        font.weight: Font.Bold
    }

}
