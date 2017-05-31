#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QtCore>
#include <QtQml>
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);


    qmlRegisterType(QUrl("file:///C:/Qt/5.9/mingw53_32/qml/QtQuick/Controls.2/Material/FooterBar.qml"), "mycontrol", 2, 1, "FooterBar");
    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/main.qml"));
    return app.exec();
}
