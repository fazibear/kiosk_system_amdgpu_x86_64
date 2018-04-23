#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtWidgets/QWidget>
#include <QDebug>
#include <QtWidgets/QApplication>
#include <QtWidgets/QVBoxLayout>
#include <QWindow>
#include<QProcess>
#include <QWebEngineView>
#include <QMainWindow>

class MainWindow :public QMainWindow
{
    Q_OBJECT

    public:
        MainWindow();
        ~MainWindow();
    private:
	QWebEngineView* view;


};

#endif // MAINWINDOW_H
