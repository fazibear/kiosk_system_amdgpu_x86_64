#include "mainwindow.h"

MainWindow::MainWindow() : QWindow(){
    view = new QWebEngineView;
    view->setUrl(QUrl(QStringLiteral("https://www.wp.pl")));
//    setCentralWidget(view);
}

MainWindow::~MainWindow(){
}
