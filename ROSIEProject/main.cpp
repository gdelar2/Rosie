#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QDir>
#include <QFileDialog>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/ROSIEProject/ROSIE.qml"));
    viewer.showExpanded();


    QStringList picturePaths;
    picturePaths.append("Image/GalleryPictures");

    /*
    QFileDialog dialog;



   QDir dir;
   dir.setPath("Image/GalleryPictures");

   picturePaths=dir.entryList( );
*/

    return app.exec();
}
