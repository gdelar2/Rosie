#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QDir>
#include <QFileDialog>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //Load the QML project
    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/ROSIEProject/ROSIE.qml"));
    viewer.showExpanded();

    return app.exec();
}
