#include <QGuiApplication>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QScreen>
#include <QDebug>
#include <QWebEngineView>
#include <QApplication>

#include "mainwindow.h"

static QWebEngineView *addView(QScreen *screen, int screenIdx, QUrl url)
{
	QWebEngineView *view = new QWebEngineView();

	view->setUrl(url);

	qDebug() << "x:" << screen->geometry().x();
	qDebug() << "y:" << screen->geometry().y();
	qDebug() << "h:" << screen->geometry().width();
	qDebug() << "w:" << screen->geometry().height();

	view->setGeometry(
			screen->geometry().x(),
			screen->geometry().y(),
			screen->geometry().width(),
			screen->geometry().height()
			);

	qDebug() << "VIE:" << view;
	return view;
}


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

 QVector<QWebEngineView *> views;
 for (int i = 0; i < screens.count(); ++i) {
	 QWebEngineView *v = addView(screens[i], i, urls[i]);
	 views.append(v);
	 v->show();
	 v->windowHandle()->setScreen(screens[i]);
	 qDebug() << "XXX:" << v << v->geometry().x();
 }

 int r = app.exec();

 qDeleteAll(views);
 return r;
}
