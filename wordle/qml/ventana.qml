import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 240
    height: 350
    visible: true
    title: qsTr("Wordle App")
    flags: Qt.WindowTitleHint | Qt.CustomizeWindowHint
           | Qt.WindowMinimizeButtonHint | Qt.WindowCloseButtonHint
           | Qt.MSWindowsFixedSizeDialogHint
    property Item active_row;
    property int active_row_index: 1;
    property bool finished: false;

    Component.onCompleted: {
        var component = Qt.createComponent("fila.qml");
        for (var i=0; i<6; i++) {
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
                active_row_index = 1
            }
        }
        active_row.focus = true;
        controller.iniciar_juego();
    }

    function findChild(objectName) {
        for(var i=0; i < window.contentItem.children.length; i++) {
            var item = window.contentItem.children[i];
            if(item.objectName === objectName) {
                return item;
            }
        }
        return null;
    }

    function set_message(msg) {
        text_msg.text = msg
    }

    function show_popup(msg) {
        popup.contentItem.text = msg
        popup.open()
    }

    Text {
        id: text_msg
        y: 265
        width: 217
        height: 25
        text: qsTr("")
        anchors.bottom: parent.bottom
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
        font.weight: Font.Bold
    }

    Popup {
        id: popup
        anchors.centerIn: Overlay.overlay
        width: 200
        height: 50
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

        contentItem: Text {
            id: message
            text: ""
            horizontalAlignment: Text.AlignHCenter
        }

        onClosed: {
            window.active_row.focus = true;
        }
    }

}
