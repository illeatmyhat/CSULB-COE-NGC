import sys

from PyQt5.QtCore import QUrl
from PyQt5.QtQuick import QQuickView
from PyQt5.QtQml import qmlRegisterType, QQmlComponent, QQmlApplicationEngine
from PyQt5.QtWidgets import QApplication


sys_argv = sys.argv
sys_argv += ['--style', 'material']
app = QApplication(sys.argv)


# Create a QML engine.
engine = QQmlApplicationEngine()
engine.load(QUrl('main.qml'))
win = engine.rootObjects()[0]
win.show()
sys.exit(app.exec_())
