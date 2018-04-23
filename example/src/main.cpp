#include <QGuiApplication>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QScreen>
#include <QDebug>
#include <QWebEngineView>
#include <QApplication>

#include "mainwindow.h"

int main(int argc, char **argv)
{
 qputenv("QT_LOGGING_RULES", "qt.qpa.*=true");
 qputenv("QSG_INFO", "1");

 QApplication app(argc, argv);

 QList<QScreen *> screens = app.screens();
 qDebug("Application sees %d screens", screens.count());
 qDebug() << screens;

 QVector<QUrl> urls;
urls.append(QUrl(QStringLiteral("https://www.wp.pl")));
urls.append(QUrl(QStringLiteral("https://www.onet.pl")));

 QVector<QWindow *> views;
 for (int i = 0; i < screens.count(); ++i) {
	 // QWebEngineView *view = new QWebEngineView();
         //
	 // view->setUrl(urls[i]);
	 // view->windowHandle()->setScreen(screens[i]);
	 QWindow *view = new QWindow;
	 view->setScreen(screens[i]);
	 view->showFullScreen();

	 //QWebEngineView *web = new QWebEngineView();

	 views.append(view);
 }

 int r = app.exec();

 qDeleteAll(views);
 return r;
}
