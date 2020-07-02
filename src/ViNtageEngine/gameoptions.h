#ifndef GAMEOPTIONS_H
#define GAMEOPTIONS_H

#include <QObject>

class GameOptions : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString prefixFile READ prefixFile WRITE setPrefixFile NOTIFY prefixFileChanged)
private:
    QString m_PrefixFile;
    QString m_FullPath;

public:
    explicit GameOptions(QObject *parent = nullptr);

    QString prefixFile() const { return m_PrefixFile; }
    void setPrefixFile(const QString& prefixFile) noexcept;

    Q_INVOKABLE void saveGameOptions(QString saveData, int slot);
private:


signals:
    void prefixFileChanged();
};

#endif // GAMEOPTIONS_H
