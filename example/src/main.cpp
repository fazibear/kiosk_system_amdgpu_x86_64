#include <QGuiApplication>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QScreen>
#include <QDebug>

static QQuickView *addView(QScreen *screen, int screenIdx)
{

 QVector<QUrl> urls;
 urls.append(QUrl(QStringLiteral("https://www.onet.pl")));
 urls.append(QUrl(QStringLiteral("https://www.wp.pl")));

    qDebug("Creating new QQuickView for screen %p", screen);
    QQuickView *v = new QQuickView;

    v->setScreen(screen);
    v->setResizeMode(QQuickView::SizeRootObjectToView);
    v->rootContext()->setContextProperty("location", urls[screenIdx]);
    v->setSource(QUrl("qrc:/screen.qml"));

    QObject::connect(v->engine(), &QQmlEngine::quit, qGuiApp, &QCoreApplication::quit);

    return v;
}

int main(int argc, char **argv)
{
    qputenv("QT_LOGGING_RULES", "qt.qpa.*=true");
    qputenv("QSG_INFO", "1");

    QGuiApplication app(argc, argv);

    QList<QScreen *> screens = app.screens();
    qDebug("Application sees %d screens", screens.count());
    qDebug() << screens;

    QVector<QQuickView *> views;
    for (int i = 0; i < screens.count(); ++i) {
        QQuickView *v = addView(screens[i], i);
        views.append(v);
        // v->showFullScreen();
	v->setGeometry(0,0, 200,200);
	v->showNormal();
    }

    int r = app.exec();

    qDeleteAll(views);
    return r;
}
