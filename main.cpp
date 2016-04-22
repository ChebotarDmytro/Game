#include <QGuiApplication>

#include <qqmlengine.h>
#include <qqmlcontext.h>
#include <qqml.h>
#include <QtQuick/qquickitem.h>
#include <QtQuick/qquickview.h>

#include "tictacengine.h"

int main(int argc, char *argv[])
{
   QGuiApplication app(argc, argv);

  QQuickView view(QUrl("qrc:main.qml"));
  view.setResizeMode(QQuickView::SizeRootObjectToView);

  QQmlContext *ctxt = view.rootContext();

  TicTacEngine dataObject;
  ctxt->setContextProperty("_myClass", &dataObject);

   QObject *button = view.rootObject();

   QObject::connect(button, SIGNAL(qmlSignal(QVariant)),
                       &dataObject, SLOT(reset(QVariant)));

  view.show();

  return app.exec();
}
