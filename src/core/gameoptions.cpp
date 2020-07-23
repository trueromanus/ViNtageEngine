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
        qDebug() << "Save Game Options: Slot number have to be positive or zero";
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

    QByteArray byteArray = qCompress(saveData.toUtf8());
    slotFile.write(byteArray);
    slotFile.close();

    auto pathToSlots = m_FullPath + "/";
    emit gameOptionsSaved(slot, pathToSlots);
}

QString GameOptions::loadGameOptions(int slot)
{
    if (slot < 0) {
        qDebug() << "Save Game Options: Slot number have to be positive or zero";
        return "";
    }

    auto path = m_FullPath + "/" + m_PrefixFile + QString::number(slot) + ".gs";
    if (!QFile::exists(path)) {
        qDebug() << "Save Game Options: Save slot " << slot << " don't exists";
        return "";
    }

    QFile slotFile(path);
    if (!slotFile.open(QIODevice::ReadOnly)) {
        qDebug() << "Save Game Options: Error opening file for write " + path;
        return "";
    }

    auto fileContent = slotFile.readAll();
    auto content = qUncompress(fileContent);
    slotFile.close();

    return content;
}
