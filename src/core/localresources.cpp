#include <QStandardPaths>
#include <QDir>
#include "localresources.h"

LocalResources::LocalResources(QObject *parent) : QObject(parent), m_BasePath("")
{
    m_BasePath = QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation);
    m_BasePath += "/game";
    QDir().mkpath(m_BasePath);

    //find local game archive or game folder and copy/unpack data to
}

QString LocalResources::basePath()
{
    return m_BasePath;
}
