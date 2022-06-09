/* 사용자 정의 컴포넌트 */

// 위에서 간단히 만든 버튼을 다른 여러곳에서 재사용 할 수 있도록 컴포넌트로 만들어보자.
// Button.qml이라는 새로운 qml파일을 만들고 위에 구현한 내용을 채운다. 파일이름은 영문, 대문자로 시작해야한다.

/*
* Comment: Button.qml
*/

import QtQuick 2.9


Rectangle{
    width: 200
    height: 100
    anchors.centerIn: parent
    color: isOn? "green" : "yellow"
    border.width: 2
    border.color: "black"

    property bool isOn: false // state flag로 사용될 사용자정의 프로퍼티

/* 시그널, 함수정의 */
// 이번엔 위에서 만든 버튼을 조금 변경하여 토글로 동작하는 버튼으로 바꿔보려한다.
// 위에서 만든 버튼은 클릭했을때 isOn 플로퍼티를 바로 바꾸고 있지만
// 이번엔 버튼에 새로운 시그널을 정의하고 그 시그널이 발생했을때 어떤 동작을 수행하며 그 동작이 성공적으로 됬을 때 isOn 프로퍼티를 변경하는 것이다.

    // 시그널 정의
    signal buttonPressed(bool isPressed)
    signal buttonReleased(bool isPressed)
    signal buttonClicked()

    Text {
        id: title
        anchors.fill: parent
        text: parent.isOn? qsTr("On") : qsTr("Off") // state flag에 따라 text를 설정하는 삼항연산자
        font.pixelSize: 20
        font.bold: true
        color:parent.isOn? "yellow": "green"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

/* MouseArea */
// 화면에 보이진 않지만 일반 컴포넌트들에 대한 마우스 처리를 제공한다.
// 마우스 입력에 대한 다양한 이벤트 시그널들이있다.
// 아래의 예제외에도 entered, exited, positionChanged, doubleClicked, wheel 등이 있다.
    MouseArea{
 /*
        width: 100
        height: 100

        onPressed: {
            console.log("Pressed")
            // Do Something...
            }

        onReleased: {
            console.log("Released")
            // Do Something...
            }

         onClicked: {
             console.log("clicked")
             // Do Something...
            }

         onPressedChanged: {
             console.log("Changed")
             // Do Something...
            }
*/


 /*
        anchors.fill: parent                // Rectangle의 영역을 채움
        onPressed: parent.isOn = true       // on설정
        onReleased: parent.isOn = false     // off설정
        onClicked: console.log("clicked")
        onPressedChanged: console.log("state: " + parent.isOn)
 */

        anchors.fill: parent                 // Rectangle의 영역을 채움
        onPressed: buttonPressed(pressed)    // pressed 시그널 발생
        onReleased: buttonReleased(pressed)  // released 시그널 발생
        onClicked: buttonClicked()           // clicked 시그널 발생
   }
}
