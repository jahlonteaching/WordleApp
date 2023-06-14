import QtQuick 2.15

Item {
    id: row
    width: 230
    height: 50
    property int actual_rect: 1
    focus: true

    Keys.onPressed: (event) => {
        if(!window.finished) {
            if ( (event.key >= Qt.Key_A && event.key <= Qt.Key_Z) || event.key === 209) {
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
    }

    Keys.onReturnPressed: (event) => {
        if(!window.finished && actual_rect > 5 && window.active_row_index < 7){
            // Verify result and paint letters
            var word = get_word();
            var response = JSON.parse(controller.verificar_palabra(get_word()));
            if(response["estado"] === "OK") {
                paint_letters(response["resultado"]);

                print(JSON.stringify(response));

                // Go to the next row
                if(!response["descubrio_palabra"]) {
                    if(response["tiene_intentos"]) {
                        window.active_row_index++;
                        var row_name = "row_" + window.active_row_index;
                        var row = findChild(row_name);
                        if(row !== null) {
                            window.active_row = row;
                            window.active_row.focus = true;
                        }
                    } else {
                        window.finished = true;
                        set_message("¡Lo siento, has perdido!");
                    }
                } else {
                    window.finished = true;
                    set_message("¡Felicitaciones!");
                }
            } else {
                show_popup(response["mensaje_error"]);
            }
        }
    }

    function paint_letters(result) {
        for(var i=0; i < result.length; i++) {
            paint_text_letter(i+1, result[i]);
        }
    }

    function paint_text_letter(pos, result) {

        var color = "#ADA9A9";
        if(result === 2) {
            color = "#FFFC3C";
        } else if(result === 1) {
            color = "#20FF1B";
        }

        if(pos === 1){
            rect_1.color = color
        }
        if(pos === 2){
            rect_2.color = color
        }
        if(pos === 3){
            rect_3.color = color
        }
        if(pos === 4){
            rect_4.color = color
        }
        if(pos === 5){
            rect_5.color = color
        }
    }

    function get_word() {
        var word = "";
        word += text_letter_1.text;
        word += text_letter_2.text;
        word += text_letter_3.text;
        word += text_letter_4.text;
        word += text_letter_5.text;
        return word;
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
