import QtQuick 2.15

Item {
    id: row
    width: 230
    height: 50
    // color: "#2015ff"
    property int actual_rect: 1
    focus: true

    Keys.onPressed: (event) => {
        if (event.key >= Qt.Key_A && event.key <= Qt.Key_Z) {
            if(actual_rect < 6) {
                set_letter_text(actual_rect, event.text);
                event.accepted = true;
                actual_rect++;
            }
        } else if(event.key === Qt.Key_Backspace){
            if(actual_rect > 1) {
                actual_rect--;
                set_letter_text(actual_rect, "");
                event.accepted = true;
            }
        }
    }

    Keys.onReturnPressed: (event) => {
        if(actual_rect > 5){
            window.active_row_index++;
            if(window.active_row_index < 6) {
                var row_name = "row_" + window.active_row_index;
                var row = findChild(row_name);
                if(row !== null) {
                    window.active_row = row;
                    window.active_row.focus = true;
                }
            }
        }
    }

    function set_letter_text(pos, text) {
        if(pos === 1){
            text_letter_1.text = text.toUpperCase()
        }
        if(pos === 2){
            text_letter_2.text = text.toUpperCase()
        }
        if(pos === 3){
            text_letter_3.text = text.toUpperCase()
        }
        if(pos === 4){
            text_letter_4.text = text.toUpperCase()
        }
        if(pos === 5){
            text_letter_5.text = text.toUpperCase()
        }
    }

    Rectangle {
        id: rect_1
        x: 21
        width: 30
        height: 35
        color: "#ffffff"
        border.width: 1
        anchors.verticalCenter: parent.verticalCenter
        antialiasing: true


        TextInput {
            id: text_letter_1
            y: 30
            text: qsTr("")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            autoScroll: false
            activeFocusOnPress: false
            readOnly: true
            antialiasing: true
            maximumLength: 1
            font.weight: Font.Bold
        }

    }

    Rectangle {
        id: rect_2
        x: 61
        width: 30
        height: 35
        color: "#ffffff"
        border.width: 1
        anchors.verticalCenter: parent.verticalCenter
        antialiasing: true
        TextInput {
            id: text_letter_2
            y: 30
            text: qsTr("")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            autoScroll: false
            activeFocusOnPress: false
            readOnly: true
            maximumLength: 1
            antialiasing: true
            font.weight: Font.Bold
        }
    }

    Rectangle {
        id: rect_3
        x: 101
        width: 30
        height: 35
        color: "#ffffff"
        border.width: 1
        anchors.verticalCenter: parent.verticalCenter
        antialiasing: true
        TextInput {
            id: text_letter_3
            y: 30
            text: qsTr("")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            autoScroll: false
            activeFocusOnPress: false
            readOnly: true
            maximumLength: 1
            antialiasing: true
            font.weight: Font.Bold
        }
    }

    Rectangle {
        id: rect_4
        x: 141
        width: 30
        height: 35
        color: "#ffffff"
        border.width: 1
        anchors.verticalCenter: parent.verticalCenter
        antialiasing: true
        TextInput {
            id: text_letter_4
            y: 30
            text: qsTr("")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            autoScroll: false
            activeFocusOnPress: false
            readOnly: true
            anchors.rightMargin: -1
            anchors.bottomMargin: 0
            anchors.leftMargin: 1
            anchors.topMargin: 0
            maximumLength: 1
            antialiasing: true
            font.weight: Font.Bold
        }
    }

    Rectangle {
        id: rect_5
        x: 181
        width: 30
        height: 35
        color: "#ffffff"
        border.width: 1
        anchors.verticalCenter: parent.verticalCenter
        antialiasing: true
        TextInput {
            id: text_letter_5
            y: 30
            text: qsTr("")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            autoScroll: false
            activeFocusOnPress: false
            readOnly: true
            maximumLength: 1
            antialiasing: true
            font.weight: Font.Bold
        }
    }
}
