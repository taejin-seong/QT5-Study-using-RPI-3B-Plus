/*
Qml에서 키보드 입력 이벤트를 핸들링하는 방법이다. 아래 예제 소스코드를 보자!
main.cpp에서는 main.qml을 로드한다.

main.qml에서 키이벤트를 핸들링 하기위한 Item을 추가했으며 keys.onPressed 시그널에 대한 처리를 구현하였다.
*/

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml"))); // main.cpp에서는 main.qml을 로드한다.
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
