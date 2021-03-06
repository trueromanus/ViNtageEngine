#include <QApplication>
#include <FelgoApplication>
#include <QQmlApplicationEngine>
#include <FelgoLiveClient>
#include <QQmlContext>
#include "globaloptions.h"
#include "gameoptions.h"
#include "localresources.h"
#include <QDebug>

QString engineVersion = "0.0.1";

int main(int argc, char *argv[])
{
#ifndef QT_DEBUG
    if (argc == 1) {
        qInfo() << "ViN engine version " + engineVersion;
        qInfo() << "Command format:";
        qInfo() << "\tvin.exe <app identifier> [options]";
        qInfo() << "\nOptions:";
        qInfo() << "\t--debug - enable debug environment";
        return 0;
    }
#endif

    QApplication app(argc, argv);

    FelgoApplication felgo;
    QQmlApplicationEngine engine;
    felgo.initialize(&engine);

    qmlRegisterType<GlobalOptions>("Vintage", 1, 0, "GlobalOptions");
    qmlRegisterType<GameOptions>("Vintage", 1, 0, "GameOptions");
    qmlRegisterType<LocalResources>("Vintage", 1, 0, "LocalResources");

#ifdef QT_DEBUG
    QString appIdentifier = "quietandpiecelife";
#else
    QString appIdentifier = argv[1];
#endif

    LocalResources::AppIdentifier = appIdentifier;

    engine.rootContext()->setContextProperty("ViNversion", engineVersion);
    engine.rootContext()->setContextProperty("AppVersion", "0.0.1");
    engine.rootContext()->setContextProperty("AppIdentifier", appIdentifier);

#ifndef QT_DEBUG
    felgo.setMainQmlFileName(QStringLiteral("qml/Main.qml"));
    engine.load(QUrl(felgo.mainQmlFileName()));
    felgo.setLicenseKey(PRODUCT_LICENSE_KEY);
#endif


#ifdef QT_DEBUG
    FelgoLiveClient client (&engine);
#endif

    // use this instead of the above call to avoid deployment of the qml files and compile them into the binary with qt's resource system qrc
    // this is the preferred deployment option for publishing games to the app stores, because then your qml files and js files are protected
    // to avoid deployment of your qml files and images, also comment the DEPLOYMENTFOLDERS command in the .pro file
    // also see the .pro file for more details
    // felgo.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));

    return app.exec();
}
