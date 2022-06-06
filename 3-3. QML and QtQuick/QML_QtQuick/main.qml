import QtQuick 2.9
import QtQuick.Window 2.10

Window{
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    MyItem{
        id: myitem
    }

    Loader{
        id: loader
    }

    MyComponent{
        id: myComponent
    }

    Text {
        id: name
        text: myitem.platform
        font.pixelSize: 20
        anchors.centerIn: parent

        MouseArea{
            anchors.fill: parent

            onClicked: {
                console.log("clicked!!", MyItem.MyEnum.First)
                loader.sourceComponent = myComponent
            }
        }
    }
}
