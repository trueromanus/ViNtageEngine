#ifndef LOCALRESOURCES_H
#define LOCALRESOURCES_H

#include <QObject>

class LocalResources : public QObject
{
    Q_OBJECT

private:
    QString m_BasePath;

public:
    explicit LocalResources(QObject *parent = nullptr);

    Q_INVOKABLE QString basePath();

signals:

};

#endif // LOCALRESOURCES_H
