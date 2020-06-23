#ifndef GLOBALOPTIONS_H
#define GLOBALOPTIONS_H

#include <QObject>

class GlobalOptions : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString options READ options WRITE setOptions NOTIFY optionsChanged)
    Q_PROPERTY(QString optionsFileName READ optionsFileName WRITE setOptionsFileName NOTIFY optionsFileNameChanged)

private:
    QString m_Options;
    QString m_FullPath;
    QString m_FileName;

public:
    explicit GlobalOptions(QObject *parent = nullptr);

    QString options() const { return m_Options; }
    void setOptions(const QString& options) noexcept;

    QString optionsFileName() const { return m_FileName; }
    void setOptionsFileName(const QString& filename) noexcept;

    Q_INVOKABLE void loadOptions() noexcept;
    Q_INVOKABLE void saveOptions() noexcept;

signals:
    void optionsChanged();
    void optionsFileNameChanged();

};

#endif // GLOBALOPTIONS_H
