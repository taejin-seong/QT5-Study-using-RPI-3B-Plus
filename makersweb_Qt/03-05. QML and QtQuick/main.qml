/*
Qt Quick Controls 2는 QtCreator Design으로 GUI만들기를 하면서 사용한 적이 있다.
GUI응용프로그램을 개발할 때 기본적으로 필요한 요소들의 모음이라고 생각하면된다.

Qt Quick Controls 2는 Qt Quick Controls 1을 기반으로하지 않으며 성능 향상을 위해 처음부터 다시 디자인되었다. (Qt5.7부터 사용가능하다.)
Qt Quick Controls 2는 제한된 리소스가있는 환경에서도 제대로 작동하는 응용 프로그램을 개발할 수 있도록
가벼운 사용자 인터페이스 컨트롤 세트를 제공한다.

Qt Quick Controls 2에는 Default, Fusion, Material, Universal 등 다양한 스타일이 제공되며 또한 응용 프로그램에서
단일 컨트롤을 커스텀 스타일링하여 기본 스타일에서 제공하는 것과 다른 모양을 지정할 수 있다.
*/


//스타일을 설정하는 방법은 몇가지가 있다.
//다음과 같이 C++ API 를 사용하는 방법이 있고
QQuickStyle::setStyle("Material");



//아니면 프로젝트내에 qtquickcontrols2.conf 설정파일을 추가하고 다음과 같이 Controls섹션에 Style을 정의할 수 도 있다.
//qtquickcontrols2.conf

[Controls]
Style=Material

[Universal]
;Theme=Dark
Accent=Steel

[Material]
Theme=Light
Accent=BlueGrey
Primary=darkblue



//다른 방법으로는 환경변수에 설정하거나 Qt응용프로그램을 실행할때 -style 아규먼트를 넘겨 주는방법이있다.

QT_QUICK_CONTROLS_STYLE=universal


//스타일을 설정하지 않으면 기본으로 선택되겠지만 어쨋든 Qt Quick Controls 2의 기본 사용 조건은 qml 파일의 상단에 다음 라인을 추가하는 것이다.
import QtQuick.Controls 2.12



