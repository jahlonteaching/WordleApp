import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 240
    height: 280
    visible: true
    title: qsTr("Wordle App")
    flags: Qt.WindowTitleHint | Qt.CustomizeWindowHint
           | Qt.WindowMinimizeButtonHint | Qt.WindowCloseButtonHint
           | Qt.MSWindowsFixedSizeDialogHint

    Component.onCompleted: {
        var component = Qt.createComponent("fila.qml");
        for (var i=0; i<5; i++) {
            var newY = (50 * i) + 5;
            var row = component.createObject(window, {
                                                 id: "row_" + i,
                                                 y: newY,
                                                 "anchors.horizontalCenter": "parent.horizontalCenter"
                                             });
        }
    }

}
