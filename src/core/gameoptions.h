#ifndef GAMEOPTIONS_H
#define GAMEOPTIONS_H

#include <QObject>

class GameOptions : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString prefixFile READ prefixFile WRITE setPrefixFile NOTIFY prefixFileChanged)
    Q_PROPERTY(QString savedPath READ savedPath)
private:
    QString m_PrefixFile;
    QString m_FullPath;

public:
    explicit GameOptions(QObject *parent = nullptr);

    QString prefixFile() const { return m_PrefixFile; }
    void setPrefixFile(const QString& prefixFile) noexcept;

    QString savedPath() const { return m_FullPath + "/"; }

    Q_INVOKABLE void saveGameOptions(QString saveData, int slot);
    Q_INVOKABLE QString loadGameOptions(int slot);

signals:
    void prefixFileChanged();
    void gameOptionsSaved(int slot, const QString& path);
};

#endif // GAMEOPTIONS_H
