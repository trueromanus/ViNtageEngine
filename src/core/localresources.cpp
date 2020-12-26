#include <QStandardPaths>
#include <QDir>
#include <QFile>
#include <QApplication>
#include <QDebug>
#include "localresources.h"

QString LocalResources::AppIdentifier = "";

LocalResources::LocalResources(QObject *parent) : QObject(parent), m_BasePath("")
{
    QString filePrefix = "file://";

#ifdef Q_OS_WINDOWS
    filePrefix.append("/");
#endif

    auto gameDirectory = QDir(QDir::currentPath() + "/apps/" + LocalResources::AppIdentifier);
    if (gameDirectory.exists()) {
        m_BasePath = filePrefix + gameDirectory.path();
    } else {
        qInfo() << "Directory " << gameDirectory.path() << " don't exists!";
        QApplication::exit(1);
    }
}
