CONFIG += felgo
CONFIG += warn_on qmltestcase

TEMPLATE = app

DISTFILES += \
    ../../ViNtageEngine/qml/Objects/ActionSequence.qml \
    ../../ViNtageEngine/qml/Objects/SingleSelectOptions.qml \
    ../../ViNtageEngine/qml/Objects/TextRenderer.qml \
    tst_ActionSequence.qml \
    tst_SigleSelectOptions.qml \
    tst_TextRenderer.qml

SOURCES += \
    main.cpp
