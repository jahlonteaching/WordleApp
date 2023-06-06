import QtQuick 2.15

Item {
    id: row
    width: 230
    height: 50
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
            text: qsTr("X")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
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
            text: qsTr("X")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
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
            text: qsTr("X")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
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
            text: qsTr("X")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
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
            text: qsTr("X")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            maximumLength: 1
            antialiasing: true
            font.weight: Font.Bold
        }
    }
}
