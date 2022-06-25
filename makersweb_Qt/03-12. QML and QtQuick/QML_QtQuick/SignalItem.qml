import QtQuick 2.0

// [ 사용자정의 시그널 ]
// 새로운 시그널을 정의해서 다음과 같이 사용할 수도 있다.
QtObject{
    // 사용자정의 시그널
    signal signalItemCreated(string name)

    Component.onCompleted: {
        signalItemCreated("SignalItem")
    }
}
