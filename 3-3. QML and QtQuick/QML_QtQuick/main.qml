/*
QT QML은 QT Quick 기반 사용자 인터페이스를 만드는데 사용되는 언어인 QML을 실행하는 엔진
QT QML모듈은 QML 언어로 응용 프로그램 및 라이브러리를 개발하기 위한 기본적인 프레임 워크 (그래픽에 의존하지 않는) QML엔진 및 JS 리소스를
제공하고, QT Quick 모듈은 QML을 사용하여 사용자 인터페이스를 만드는데 필요한 모든 기본 유형을 제공한다ｔｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｑｔｔｔ.
시각적 구성 요소(아이템) 만들기 및 애니메이션, 사용자 입력 수신, 데이터 모델 및 뷰 등을 포함한다.

QtQuick 모듈은 QML 응용 프로그램을 작성하기위한 표준 라이브러리인것이다.
*/

/*
Qt QML모듈은 응용 프로그램에 사용되는 QML 프레임 워크와 중요한 QML 타입을 포함하므로 필수로 포함되어야 한다.
Qt QML의 사용방법은 QtQml을 import를 통해 사용할 수 있다.

ex) import QtQml 2.12

일반적인 경우 QtQuick이 QML모듈을 포함하고 있기때문에 QtQuick을 import해줘도 무관하다.


다음 행도 qmake .pro 파일에 추가한다.
QT += qml
*/
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
