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

           Rectangle {
               id: rect_1
               x: 21
               y: 30
               width: 30
               height: 35
               color: "#ffffff"
               border.width: 1
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
               y: 30
               width: 30
               height: 35
               color: "#ffffff"
               border.width: 1
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
               y: 30
               width: 30
               height: 35
               color: "#ffffff"
               border.width: 1
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
               y: 30
               width: 30
               height: 35
               color: "#ffffff"
               border.width: 1
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
               y: 30
               width: 30
               height: 35
               color: "#ffffff"
               border.width: 1
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
