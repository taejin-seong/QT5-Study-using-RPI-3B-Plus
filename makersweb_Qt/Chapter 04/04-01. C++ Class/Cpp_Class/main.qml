/*

[ QCoreApplication, QGuiApplication, QApplication 클래스 ]

QCoreApplication 클래스는 UI가 없는 Qt 애플리케이션을 위한 기본 이벤트 루프와 애플리케이션의 설정, 실행 경로등의 정보들이 포함되어 있다.
프로세스내에서 오직 하나의 QCoreApplication 객체만 생성되어야한다. QCoreApplication 의 이벤트 루프에서는 내부 이벤트 및 운영 체제의 이벤트 (예 : 타이머 및 소켓 이벤트등) 를 처리하는데 exec() 호출로 시작된다. 이벤트 루프가 종료(quit()) 될 때까지 exec() 함수는 반환되지 않으며 일반적으로 exec()함수는 main()함수의 return 으로 호출한다.
만약 메인 스레드에서 오래걸리는 작업을 실행하면 이벤트를 처리할 수 없으므로 애플리케이션의 응답성을 잃을 수 있다. 따라서 오래걸리는 작업은 별도의 스레드에서 처리하거나 processEvents()를 호출하여 응용프로그램의 응답성을 유지해야 한다.
QGuiApplication 은 QCoreApplication 의 파생클래스로써 윈도우 시스템과 관련된 이벤트(입력장치 이벤트등) 처리가 포함되어 있다. 또한 폰트(QFont)를 설정하거나 QClipboard, QInputMethod, QWindowList 등을 제공한다. GUI가 없는 Qt 애플리케이션의 경우 Qt GUI 모듈에 의존하지 않으므로 QCoreApplication 을 대신 사용한다.
QApplication 은 QWidget 기반 애플리케이션에 필요한 기능을 갖춘 QGuiApplication 의 파생클래스이다. 위젯의 초기화, 마무리등 QWidget과 밀접하게 관련된 일을 수행하기 때문에 QWidget을 사용하는 응응프로그램에서 QApplication 을 생성하지 않으면 다음과 같은 메세지만 출력할 뿐 실행되지 않는다.

QWidget: Cannot create a QWidget without QApplication



QApplication 을 사용하려면 프로젝트파일(*.pro)에 다음줄을 추가한다.

QT += widgets
*/


/*
  main.cpp과 Cpp_Class.pro파일 확인할 것.
*/
import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
}
