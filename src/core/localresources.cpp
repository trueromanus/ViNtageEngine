#include <QStandardPaths>
#include <QDir>
#include <QFile>
#include "localresources.h"

QString LocalResources::CustomProjectPath = "";

LocalResources::LocalResources(QObject *parent) : QObject(parent), m_BasePath("")
{
    QString filePrefix = "file://";

#ifdef Q_OS_WINDOWS
    filePrefix.append("/");
#endif

    //take local folder from command line
    if (!LocalResources::CustomProjectPath.isEmpty()) m_BasePath = filePrefix + LocalResources::CustomProjectPath;

    //check if game folder in executable folder with name "game"
    if (m_BasePath.isEmpty()) {
        auto gameDirectory = QDir(QDir::currentPath() + "/game");
        if (gameDirectory.exists()) m_BasePath = filePrefix + gameDirectory.path();
    }

    //check if game archive in executable folder with name game.archive
    if (m_BasePath.isEmpty()) {
        QFile gameArchive(QDir::currentPath() + "/game.archive");
        if (gameArchive.exists()) {
            //TODO: Extract file to local folder

            //create local folder for upack data
            m_BasePath = filePrefix + QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation);
            m_BasePath += "/game";
            QDir().mkpath(m_BasePath);

        }
    }
}
