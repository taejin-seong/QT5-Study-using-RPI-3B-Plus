/*
QML 응용프로그램을 작성하기 위해서는 QtQuick 모듈 및 Qml언어를 사용 방법을 알아야한다.
QtQuick 모듈은 Qml응용프로그램을 작성하기위한 표준 라이브러리이다.
QtQuick 모듈은 Qml을 사용하여 UI를 만드는 데 필요한 모든 기본 타입들을 제공한다.
*/

import QtQuick 2.9  // 이제 QtQuick이 제공하는 기본 유형과 기능을 Qml문서에서 사용할 수 있음.
import QtQuick.Window 2.2

/* Window */
// 사용자와 GUI응용프로그램간 상호작용을 하기위해 화면을 통해 뭔가를 제공하고 입력을 받아 처리하는 적절한 작업이 필요한데,
// QML로 어떤 UI요소를 작성하고 화면에 보여주기 위해선 가장 먼저 window를 생성해야 한다.
// QML의 기본 컴포넌트에 Window가 있는데 이 윈도우객체에 화면요소를 배치하고 입력을 받아 처리하는 부분을 구현해주면되는 것이다.
Window {
    id: idWindow
    visible: true
    width: 320                                  // window 폭 조정
    height: 240                                 // window 높이 조정
    title: qsTr("Hello World")

/* Item */
// 이 컴포넌트 자체만으로는 화면에 아무것도 표시하지 않지만 모든 시각적 컴포넌트들은 이 컴포넌트를 상속받는다.
// 그러므로 이 요소가 가지는 속성(프로퍼티)들은 모든 시각적 컴포넌트들이 기본으로 사용할 수 있다.
// 기본적 지오메트리(geometry) 속성인 x, y, z와 width, height 이있다. 투명도, 스케일, 회전등을 설정 할 수 있다.

/* Item 컴포넌트를 Window 안에 배치한 모습 */
    Item {
        id: basicItem
        x: 0
        y: 0
        z: 0
 //       width: 200
 //       height: 100
        width: parent.width                   // 부모(Window)의 폭을 사용
        height: parent.height                 // 부모(Window)의 높이를 사용

        visible: true                           // 시각적으로 표시할지를 설정
        opacity: 0.3                            // 불투명도를 설정 1이면 완전한 불투명, 0이면 완전한 투명이다.
        scale: 0.7

/* Rectangle */
// 시각적 속성들을 포함한 사각형 아이템이다. Item의 기본요소와 color및 radius등을 설정할 수 있다.

/* Rectangle 컴포넌트를 Item 안에 배치한 모습 */
        Rectangle{
            width: 200
            height: 100
            anchors.centerIn: parent            // 상위 컴포넌트(window)의 중앙에 배치
            color: "yellow"
            border.width: 1                     // 가장자리 선의 굵기
            border.color: "black"               // 가장자리 선의 컬러

/* Text */
// 문자열을 출력할 수 있는 컴포넌트이다. 출력할 문자열을 text프로퍼티에 설정한다.font프로퍼티를 통해서 글꼴의 모양, 사이즈, 굵기 등의
// 상세 설정을 할 수 있다.
// qsTr("")함수는 문자열 번역을 위해 사용한다.

/* Text 컴포넌트를 Rectangle 안에 배치한 모습 */
            Text {
                id: title                       // 이 객체에 id를 부여 (중복되면 안됨)
                anchors.fill: parent            // 상위 컴포넌트(Rectangle)의 영역을 채운다.
                text: qsTr("텍스트 컴포넌트")
                font.pixelSize: 20
                font.bold: true
                font.family: "나눔고딕"
                color: "green"
                horizontalAlignment: Text.AlignHCenter  // 수평에 대한 중앙 정렬
                verticalAlignment: Text.AlignVCenter    // 수직에 대한 중앙 정렬
            }

/* Image */
// 이미지 아이템을 표시할 수 있다. source 프로퍼티에 이미지 경로를 설정한다.
/*======================================================================*/
// 이미지 경로설정법
// 1).
/*
            qml.qrc를 마우스 오른쪽 버튼으로 클릭한 다음 "Open With" -> "Resource Editor"를 선택합니다.
            Resource Editor에서 "Add" ->"Add Files"를 클릭하면 이미지를 선택합니다.
            마지막으로 추가된 이미지 요소를 우클릭하고 이미지 경로를 "Copy URL: qrc:/file name"을 선택합니다.
 */

// 2).
/*
            로컬 파일 시스템에서 찾는 경우 파일 경로와 접두사 "file:"을 다음과 같이 가져옵니다.
            ex) source = "file:/root/Desktop/~~.png"
*/

/* Image 컴포넌트를 Rectangle 안에 배치한 모습 */

            Image {
                width: 153                         // width, height를 설정하지 않으면 이미지의 원본 사이즈로 표시된다.
                height: 89
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                source: "qrc:/Qt"
            }
        }
    }
}
