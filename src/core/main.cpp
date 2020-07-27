#include <QApplication>
#include <FelgoApplication>
#include <QQmlApplicationEngine>
#include <FelgoLiveClient>
#include "globaloptions.h"
#include "gameoptions.h"
#include "localresources.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    FelgoApplication felgo;
    QQmlApplicationEngine engine;
    felgo.initialize(&engine);

    qmlRegisterType<GlobalOptions>("Vintage", 1, 0, "GlobalOptions");
    qmlRegisterType<GameOptions>("Vintage", 1, 0, "GameOptions");
    qmlRegisterType<LocalResources>("Vintage", 1, 0, "LocalResources");

    if (argc > 1) LocalResources::CustomProjectPath = argv[1];

    // use this during development
    // for PUBLISHING, use the entry point below
    /*
    felgo.setMainQmlFileName(QStringLiteral("qml/Main.qml"));
    engine.load(QUrl(felgo.mainQmlFileName()));
    felgo.setLicenseKey(PRODUCT_LICENSE_KEY);
    */

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
