import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 240
    height: 370
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
        y: 315
        width: 217
        height: 25
        text: qsTr("")
        anchors.bottom: parent.bottom
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 30
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

    Button {
        id: new_game_button
        x: 154
        y: 341
        width: 75
        height: 22
        text: qsTr("Nuevo juego")
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        font.pointSize: 9
        antialiasing: true
        font.underline: true
        anchors.rightMargin: 11
        anchors.bottomMargin: 7
        smooth: true
        rightPadding: 1
        leftPadding: 1
        font.bold: false
        font.capitalization: Font.MixedCase
        display: AbstractButton.TextOnly
        flat: true
        enabled: false

        contentItem: Text {
            text: new_game_button.text
            font: new_game_button.font
            color: new_game_button.enabled ? "#0311d3" : "#8e8f9f"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        onClicked: clear_board()
    }

    Button {
        id: definition_button
        y: 341
        width: 61
        height: 22
        text: qsTr("Definición")
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 12
        font.pointSize: 9
        antialiasing: true
        font.underline: true
        anchors.bottomMargin: 7
        smooth: true
        rightPadding: 1
        leftPadding: 1
        font.bold: false
        font.capitalization: Font.MixedCase
        display: AbstractButton.TextOnly
        flat: true
        enabled: false

        contentItem: Text {
            text: definition_button.text
            font: definition_button.font
            color: definition_button.enabled ? "#0311d3" : "#8e8f9f"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        onClicked: show_definition()
    }

    function show_definition() {
        var definition = controller.consultar_definicion();
        show_popup(definition)
    }

    function clear_board() {
        active_row_index = 1;
        finished = false;
        for(var i=1; i <= 6; i++) {
            var row_name = "row_" + i;
            var row = findChild(row_name);
            row.clear();
            if(i == 1) {
                active_row = row;
            }
        }
        active_row.focus = true;
        text_msg.text = "";
        controller.iniciar_juego();
        new_game_button.enabled = false;
        definition_button.enabled = false;
    }

}
