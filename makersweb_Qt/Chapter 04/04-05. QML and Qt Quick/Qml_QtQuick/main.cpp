#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "phonebook.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Phonebook pb;
    engine.rootContext()->setContextProperty("phonebook", &pb);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
