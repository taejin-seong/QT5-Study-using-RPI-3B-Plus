import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Dialog{
        id: inputDialog
        title: qsTr("이름을 입력하세요.")
//        anchors.centerIn: parent
        height: 200
        width: 300
        modal: Qt.ApplicationModal
        contentItem: TextField{
            width: 100
            height: 50
            font.pixelSize: 25
            horizontalAlignment: TextInput.AlignHCenter
        }
        standardButtons: Dialog.Ok | Dialog.Cancel

        onAccepted: {
            if(contentItem.text.length){
                phonebook.setName(contentItem.text)
            }
        }
    }

    Connections{
        target: phonebook
        onNameChanged:{
            name.text = phonebook.name()
        }
    }

    Row{
        height: 50
        anchors.centerIn: parent

        Text {
            id: name
            width: 150
            font.pixelSize: 20
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
            elide: Text.ElideRight
        }
        Button{
            width: 70
            height: 50
            text: qsTr("입력")
            onClicked: {
                inputDialog.open()
            }
        }
    }
}
