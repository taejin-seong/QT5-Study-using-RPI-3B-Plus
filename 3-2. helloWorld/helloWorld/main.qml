import QtQuick 2.9
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.6

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id: rectangle
        color: "#8cbee6"
        anchors.fill: parent

        Column {
            id: column
            x: 220
            y: 45
            width: 200
            height: 400
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15

            Text {
                id: element
                text: qsTr("Text")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 12
            }
        }

        Button {
            id: button
            x: 320
            y: 69
            text: qsTr("Button")
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                element.text = "HelloWorld"
            }
        }
    }
}

/*##^## Designer {
    D{i:1;anchors_height:200;anchors_width:200;anchors_x:243;anchors_y:148}
}
 ##^##*/
