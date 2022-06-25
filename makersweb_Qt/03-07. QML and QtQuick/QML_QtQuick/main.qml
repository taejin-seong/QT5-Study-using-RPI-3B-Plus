/*
1강에서는 시각적인 Qml 컴포넌트를 주로 설명했다면 2강에서는 입력과 사용자 정의 컴포넌트를 만드는 방법등을 설명한다.
*/

/*
import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: idWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle{
        width: 200
        height: 100
        anchors.centerIn: parent
        color: isOn? "green" : "yellow"
        border.width: 2
        border.color: "black"

        property bool isOn: false // state flag로 사용될 사용자정의 프로퍼티

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

// MouseArea
// 화면에 보이진 않지만 일반 컴포넌트들에 대한 마우스 처리를 제공한다.
// 마우스 입력에 대한 다양한 이벤트 시그널들이있다.
// 아래의 예제외에도 entered, exited, positionChanged, doubleClicked, wheel 등이 있다.

        MouseArea{

//            width: 100
//            height: 100

//            onPressed: {
//                console.log("Pressed")
                // Do Something...
//            }

//            onReleased: {
//                console.log("Released")
                // Do Something...
//            }

//            onClicked: {
//                console.log("clicked")
                // Do Something...
//            }

//            onPressedChanged: {
//                console.log("Changed")
                // Do Something...
//            }

            anchors.fill: parent                // Rectangle의 영역을 채움
            onPressed: parent.isOn = true       // on설정
            onReleased: parent.isOn = false     // off설정
            onClicked: console.log("clicked")
            onPressedChanged: console.log("state: " + parent.isOn)
        }
    }

}
*/

/* 사용자 정의 컴포넌트 */

// 위에서 간단히 만든 버튼을 다른 여러곳에서 재사용 할 수 있도록 컴포넌트로 만들어보자.
// Button.qml이라는 새로운 qml파일을 만들고 위에 구현한 내용을 채운다. 파일이름은 영문, 대문자로 시작해야한다.
// Button.qml 참고

import QtQuick 2.9
import QtQuick.Window 2.2

Window{
    id: idWindow
    visible: true
    width: 320
    height: 240
    title: qsTr("Hello Makersweb")

    property bool flag: false // 사용자정의 프로퍼티

// 새롭게 정의한 버튼
    Button{
        id :newButton

/*
        onIsOnChanged: {
            //Javascript Syntax
            if(isOn){
                //Do Something..
            }
            else{

            }
*/

        // 버튼이 클릭됬을 때 어떤일을 수행할 함수
        function buttonClickProcess(){
            var state = flag

            flag = !flag

            // 성공적으로 수행 했는지 판단
            if (flag !== state){
                return true
            }

            else{
                return false
            }
        }

        // 버튼 클릭 이벤트 핸들러
        onButtonClicked: {
            if(buttonClickProcess()) {
                isOn = flags
            }

            else{
                return
            }
        }

    }
}
