/*
Qml에서 키보드 입력 이벤트를 핸들링하는 방법이다. 아래 예제 소스코드를 보자!
main.cpp에서는 main.qml을 로드한다.

main.qml에서 키이벤트를 핸들링 하기위한 Item을 추가했으며 keys.onPressed 시그널에 대한 처리를 구현하였다.
*/
import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Text {
        id: idText
        text: qsTr("text")
        anchors.centerIn: parent
        font.pixelSize: 15
    }

    Item {
        focus: true
        Keys.onPressed: {
// 키보드의 "a" 키 또는 숫자 "0"키가 눌려지면 가운데 텍스트를 바꾼다.
            switch(event.key){
            case Qt.Key_A:
                idText.text = "input A key"
                break;
            case Qt.key_0:
                idText.text = "input num0 key"
                break;
            default:
                break;
            }
        }
    }
}
