/*
Qt는 기본적으로 QObject를 기반으로 시그널, 슬롯 시스템으로 동작된다.
이 것은 QML에서도 마찬가지이며 간단한 예제들을 통해 QML내에서 어떻게 사용되는지 알아보자.

[ 기본 시그널 ]
모든 qml 아이템은 다음과 같은 기본 시그널들이 있다.

- completed() : 객체가 생성될 때 발생

- destruction() : 객체가 파괴될 때 발생

*/

import QtQuick 2.9
import QtQuick.Window 2.2


// 간단한 예제를 보자.
// SignalItem.qml과 main.qml 참고

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    // Completed 시그널은 qml객체가 인스턴스화 되면 가장 먼저 발생하며 모든 qml에서 사용할 수 있다.
    Component.onCompleted: {
        console.log("Window created.")

        // SignalItem의 시그널을 Window에 정의한 슬롯에 연결
        mySignalItem.signalItemCreated.connect(signalItemCreatedHandler)
    }

    /*
    SignalItem{
        id: mySignalItem

       // Component.onCompleted: {
         //   console.log("SignalItem created.")
       // }

    // [사용자정의 시그널]
    // 새로운 시그널을 정의해서 다음과 같이 사용할 수도 있다.
        onSignalItemCreated: {
            console.log(name + " created.")
        }
    }
    */

/*
    [ 서로 다른 객체간 시그널과 슬롯을 연결 ]
    위의 예제에서는 시그널을 해당객체내에서 처리하였다.
    이번에는 QML내에서 객체간 시그널 및 슬롯을 연결하는 방법을 소개한다.
    QML내에서 객체간 시그널 슬롯을 연결하는 일반적인 방법은 Connections 요소를 사용하는 것이다.
    대상(객체id)을 설정후 다음과 같이 시그널이 발생할 때 시그널을 처리하는 "on<Signal이름>"핸들러를 작성한다.

    다만 Connections 의 사용에는 몇가지 제약이 있는데 예를들어 하나의 Connections에 같은 시그널 처리 함수를 여러개 만들 수 없고
    대상(target) 객체가 사용되는 범위내에서만 사용할 수 있다. (물론 전역 객체의 시그널에 연결하는 건 가능하다.)
*/
 /*
    Connections{
        target: mySignalItem

        onSignalItemCreated:{
            console.log("SignalItem created.")
        }
    }

    SignalItem{
        id: mySignalItem
    }
*/

    /*
    이번엔 조금더 C++ 스러운 방법을 알아보자.
    C++에서 QObject의 connect, disconnect 메서드를 QML에서도 그대로 사용하여 서로 다른 객체간 시그널과 슬롯을 연결 할 수 있다.
    */
    function signalItemCreatedHandler(){
        console.log("SignalItem created.")
    }

    SignalItem{
        id: mySignalItem
    }
}
