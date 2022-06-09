
/* QML 프로그래밍을 하는 사람들에게 권장하는 QML 코딩 규칙 몇 가지를 소개. */



//[QML 객체 선언]
//문서와 예제 전체에서 QML 객체 속성은 항상 다음 순서로 구성된다.

id
property declarations
signal declarations
JavaScript functions
object properties
child objects

//예를 들어 가상의 사진 QML 객체는 다음과 같다.

Rectangle {
    id: photo                                               // 첫 번째 줄에서 id를 사용하면 개체를 쉽게 식별할 수 있다.

    property bool thumbnail: false                          // 사용자 정의 프로퍼티(속성) 선언.
    property alias image: photoImage.source

    signal clicked                                          // 사용자 정의 시그널 선언

    function doSomething(x){                                // 자바스크립트 함수
        return x + photoImage.width
    }

    color: "gray"                                           // 객체 자체 프로퍼티(속성)
    x: 20                                                   // 관련 속성을 함께 그룹화
    y: 20
    height: 150
    width: {                                                // 바인딩
        if (photoImage.width > 200) {
            photoImage.width;
        } else {
            200;
        }
    }

    states: [
        State {
            name: "selected"
            PropertyChanges { target: border; color: "red" }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "selected"
            ColorAnimation { target: border; duration: 200 }
        }
    ]

    Rectangle {                                             // child 객체들 배치
        id: border
        anchors.centerIn: parent; color: "white"

        Image {
            id: photoImage
            anchors.centerIn: parent
        }
    }
}





//[그룹화]
//속성 그룹에서 여러 속성을 사용하는 경우 점 표기법 대신 그룹 표기법을 사용하는 것이 가독성 향상에 더 도움이 된다.
//예를 들어 다음과 같이 점 표기법을 사용 했던 것을

Rectangle {
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.leftMargin: 20
}

//다음과 같이 표현 할 수 있다.

Rectangle {
    anchors {
        left: parent.left
        top: parent.top
        right: parent.right
        leftMargin: 20
    }
}




//[명시적 액세스]
//가독성과 성능을 향상시키기 위해 상위 구성 요소의 속성을 ID로 명시적으로 참조한다.

Item {
    id: root

    property int rectangleWidth: 50

    Rectangle {
        width: root.rectangleWidth
    }
}




//[필수 속성]
//구성 요소 외부에 정의된 데이터가 필요한 경우 필수 속성을 사용하여 이를 명시적으로 지정한다.
//이름에서 알 수 있듯이 객체의 인스턴스가 생성될 때 필수 속성을 설정해야 한다.
//이 규칙을 위반하면 정적으로 감지될 수 있는 경우 QML 응용 프로그램이 시작되지 않는다.

Rectangle {
    required color
}




//[Signal handlers]
//신호 처리기에서 매개변수를 처리할 때 명시적으로 이름을 지정하는 함수를 사용한다.

MouseArea {
    onClicked: (event) => { console.log(`${event.x},${event.y}`); }
}




//[JavaScript Code]
//스크립트가 단일 표현식인 경우 인라인으로 작성하는 것이 좋다.

Rectangle { color: "blue"; width: parent.width / 3 }

//스크립트의 길이가 몇 줄이면 일반적으로 블록을 사용한다.

Rectangle {
    color: "blue"
    width: {
        var w = parent.width / 3
        console.debug(w)
        return w
    }
}

//스크립트가 몇 줄보다 길거나 다른 개체에서 사용할 수 있는 경우 함수를 만들고 다음과 같이 호출하는 것이 좋다.

function calculateWidth(object)
{
    var w = object.width / 3
    // ...
    // more javascript code
    // ...
    console.debug(w)
    return w
}
Rectangle { color: "blue"; width: calculateWidth(parent) }
Item { width: calculateWidth(parent); height: width }

//긴 스크립트의 경우 함수를 별도의 JavaScript 파일에 넣고 다음과 같이 가져온다.

import "myscript.js" as Script

Rectangle { color: "blue"; width: Script.calculateWidth(parent) }

//스크립트에 세미콜론을 사용하여 각 명령문의 끝을 나타낼 수 있다.

MouseArea {
    anchors.fill: parent
    onClicked: {
        var scenePos = mapToItem(null, mouseX, mouseY);
        console.log("MouseArea was clicked at scene pos " + scenePos);
    }
}

