/*
  비 QWidget 기반 Qt 애플리케이션의 경우(예를 들면 Qt Quick 2)는 QtWidget 라이브러리에 의존하지 않으므로 QGuiApplication 을 사용하면된다.
다음 예제는 적절한 유형의 애플리케이션 객체를 동적으로 생성하는 방법을 보여준다. 이 애플리케이션을 -no-gui 옵션과 함께 실행하면 GUI가 없는 버전이 된다.
*/

#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>

QCoreApplication* createApplication(int &argc, char *argv[])
{
    for (int i = 1; i < argc; ++i)
        if (!qstrcmp(argv[i], "-no-gui"))
            return new QCoreApplication(argc, argv);
    return new QApplication(argc, argv);
}

int main(int argc, char* argv[])
{
    QScopedPointer<QCoreApplication> app(createApplication(argc, argv));

    if (qobject_cast<QApplication *>(app.data())) {
       // start GUI version...
    } else {
       // start non-GUI version...
    }

    return app->exec();
}
