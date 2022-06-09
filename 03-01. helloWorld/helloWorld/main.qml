import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
        font.pixelSize: 40
        color: "blue"
        font.bold: true

        MouseArea{
            anchors.fill: parent
            onClicked: Qt.quit()
        }
    }
}
