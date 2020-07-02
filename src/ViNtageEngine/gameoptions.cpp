#include <QDir>
#include <QStandardPaths>
#include <QFile>
#include <QDebug>
#include <QByteArray>
#include "gameoptions.h"

GameOptions::GameOptions(QObject *parent) : QObject(parent), m_PrefixFile("saveslot")
{
    QDir appDirectory(QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation));
    QDir().mkpath(QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation));
    m_FullPath = appDirectory.path();
}

void GameOptions::setPrefixFile(const QString &prefixFile) noexcept
{
    if (prefixFile == m_PrefixFile) return;

    m_PrefixFile = prefixFile;
    emit prefixFileChanged();
}

void GameOptions::saveGameOptions(QString saveData, int slot)
{
    if (slot < 0) {
        qDebug() << "Slot number have to be positive or zero";
        return;
    }
    auto path = m_FullPath + "/" + m_PrefixFile + QString::number(slot) + ".gs";
    if (QFile::exists(path)) {
        QFile oldFile(path);
        oldFile.remove();
    }

    QFile slotFile(path);
    if (!slotFile.open(QIODevice::WriteOnly)) {
        qDebug() << "Save Game Options: Error opening file for write " + path;
        return;
    }

    int compressLevel = 5;
    slotFile.write(qCompress(saveData.toUtf8()), compressLevel);
    slotFile.close();
}
