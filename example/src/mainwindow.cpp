#include "mainwindow.h"

MainWindow::MainWindow() : QMainWindow(){
    view = new QWebEngineView;
    view->setUrl(QUrl(QStringLiteral("https://www.wp.pl")));
    setCentralWidget(view);
	qDebug() << "Handle:" << this->windowHandle();
}

MainWindow::~MainWindow(){
}
