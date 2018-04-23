#include "mainwindow.h"

MainWindow::MainWindow() : QMainWindow(){
    view = new QWebEngineView;
    view->setUrl(QUrl(QStringLiteral("https://www.wp.pl")));

//     QBoxLayout *layout = new QBoxLayout(this);

    //    setCentralWidget(view);
}

MainWindow::~MainWindow(){
}
