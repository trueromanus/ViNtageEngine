#ifndef LOCALRESOURCES_H
#define LOCALRESOURCES_H

#include <QObject>

class LocalResources : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString basePath READ basePath NOTIFY basePathChanged)
private:
    QString m_BasePath;

public:
    static QString AppIdentifier;

    explicit LocalResources(QObject *parent = nullptr);

    QString basePath() const { return m_BasePath; };

signals:   
    void basePathChanged();

};

#endif // LOCALRESOURCES_H
