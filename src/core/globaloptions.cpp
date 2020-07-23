#include <QStandardPaths>
#include <QDir>
#include <QFile>
#include <QDebug>
#include "globaloptions.h"

GlobalOptions::GlobalOptions(QObject *parent) : QObject(parent), m_Options(""), m_FullPath(""), m_FileName("global.options")
{
    QDir appDirectory(QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation));
    QDir().mkpath(QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation));
    m_FullPath = appDirectory.path();
}

void GlobalOptions::setOptions(const QString &options) noexcept
{
    if (m_Options == options) return;

    m_Options = options;
    emit optionsChanged();
}

void GlobalOptions::setOptionsFileName(const QString &filename) noexcept
{
    if (m_FileName == filename) return;

    m_FileName = filename;
    emit optionsFileNameChanged();
}

void GlobalOptions::loadOptions() noexcept
{
    auto path = m_FullPath + "/" + m_FileName;
    if (!QFile::exists(path)) return;

    QFile file(path);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) return;

    setOptions(file.readAll());

    file.close();
}

void GlobalOptions::saveOptions() noexcept
{
    auto path = m_FullPath + "/" + m_FileName;

    QFile file(path);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) return;

    file.write(m_Options.toUtf8());

    file.close();
}
