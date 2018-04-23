#include <QGuiApplication>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QScreen>
#include <QDebug>
#include <QWebEngineView>
#include <QApplication>

#include "mainwindow.h"

// static QWebEngineView *addView(QScreen *screen, int screenIdx, QUrl url)
// {
//	QWebEngineView *view = new QWebEngineView();
//
//	view->setUrl(url);
//
//	qDebug() << "x:" << screen->geometry().x();
//	qDebug() << "y:" << screen->geometry().y();
//	qDebug() << "h:" << screen->geometry().width();
//	qDebug() << "w:" << screen->geometry().height();
//
//	view->show();
//	view->windowHandle()->setScreen(screen);
//
//	view->setGeometry(
//			screen->geometry().x(),
//			screen->geometry().y(),
//			screen->geometry().width(),
//			screen->geometry().height()
//			);
//
//	view->show();
//
//	qDebug() << "VIE:" << view;
//	return view;
// }
//

int main(int argc, char **argv)
{
 qputenv("QT_LOGGING_RULES", "qt.qpa.*=true");
 qputenv("QSG_INFO", "1");

 QApplication app(argc, argv);

 QList<QScreen *> screens = app.screens();
 qDebug("Application sees %d screens", screens.count());
 qDebug() << screens;

//  QVector<QUrl> urls;
// urls.append(QUrl(QStringLiteral("https://www.wp.pl")));
// urls.append(QUrl(QStringLiteral("https://www.onet.pl")));

//  QVector<QWebEngineView *> views;
//  for (int i = 0; i < screens.count(); ++i) {
//	 QWebEngineView *v = addView(screens[i], i, urls[i]);
//	 views.append(v);
//	 qDebug() << "XXX:" << v << v->geometry().x();
//  }
//

	QWebEngineView *view1 = new QWebEngineView();
	view1->setUrl(QUrl(QStringLiteral("https://www.wp.pl")));
	view1->setGeometry(0, 0, 1920, 1080);
	view1->show();

	QWebEngineView *view2 = new QWebEngineView();
	view2->setUrl(QUrl(QStringLiteral("https://www.onet.pl")));
	view2->setGeometry(1920, 0, 1920, 1080);
	view2->show();



int r = app.exec();

 //qDeleteAll(views);
 return r;
}
