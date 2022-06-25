/*
 C/C++로 작성된 응용프로그램의 main함수는 두개의 인수(관습적으로 argc와 argv)를 전달받을 수 있다.
프로그래머는 응용프로그램에 명령줄옵셔들을 전달하여 프로그램을 상황에 따라 제어하는데 많이 사용된다. (사실 main함수에는 세번째 인수로 환경변수를 전달 받을 수 있다.)

Qt응용프로그램도 C++ 응용프로그램이므로 main함수에 옵션을 전달 할 수 있다. 이 글에서는 Qt응용프로그램에서 옵션을 해석할 때 편리하게 사용할 수 있는 클래스를 소개하고 간단하게 사용하는 방법을 설명한다.

명령줄 옵션은 보통 짧은 이름 옵션과 긴 이름 옵션으로 분류하는데 짧은 이름 옵션은 -(하이픈)과 영문자, 숫자 또는 기호의 단일 문자로 나타내는 옵션 형식이고 긴 이름 옵션은 --(하이픈 두개)에 영단어로 표현하는 형식이다.
*/




/*
  [ CoreApplication 객체에 인수 전달 ]
  Qt 기반의 응용프로그램의 main함수는 대부분 QCoreApplication 객체를 생성하고 이때 main함수의 인수를 전달한다. 다음은 기본적인 Qt 응용프로그램 main함수를 보여준다.
*/
/*
#include <QApplication>
#include "mainwindow.h"

int main(int argc, char *argv[])
{
    // QApplication 객체를 생성할 때 argc와 argv를 전달한다.
    QApplication app(argc, argv);

    // MainWindow를 생성한다.
    MainWindow w;
    w.resize(1280, 720);
    w.show();

    return app.exec();
}
*/




/*
 [ QCommandLineParser 클래스로 옵션 해석 ]

QCommandLineParser 클래스는 편리하게 명령 줄 옵션을 처리하는 방법을 제공한다. 옵션 집합을 정의하고, 명령 줄 인수를 구문 분석하고, 실제로 사용 된 옵션과 옵션 값을 저장하는 기능을 제공한다.
이 클래스를 사용하려면 다음과 같이 헤더파일을 포함해줘야 한다.
*/


#include <QApplication>
#include <QCommandLineParser>
#include "mainwindow.h"

int main(int argc, char *argv[])
{
    // QApplication 객체를 생성할 때 argc와 argv를 전달한다.
    QApplication app(argc, argv);

    MainWindow w;
    w.resize(1280, 720);

    QCommandLineParser parser;

    // -h (help)옵션을 추가해준다.
    parser.addHelpOption();

    // 짧은 이름(-s)을 가진 bool 옵션 추가.
    QCommandLineOption showWindowOption("s", QCoreApplication::translate("main", "Show Window"));
    parser.addOption(showWindowOption);

    // 여러 이름을(-f, --force)가진 bool 옵션 추가.
    QCommandLineOption forceOption(QStringList() << "f" << "force",
            QCoreApplication::translate("main", "Overwrite existing files."));
    parser.addOption(forceOption);

    // 실제 명령 줄 인수 처리
    parser.process(app);

    bool show = parser.isSet(showWindowOption);

    if(show){
        /* 옵션(-s)이 포함되면 윈도우를 보여준다. */
        w.show();
    }

    return app.exec();
}
*/
