
#include <viewstate.h>

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	QQmlApplicationEngine engine;
	qmlRegisterType<ViewState>("CCCMedia", 1, 0, "ViewState");
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

	return app.exec();
}
