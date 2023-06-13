import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuickControls2 import QQuickStyle

from wordle.controller.backend import WordleController
from wordle.modelo.wordle import Wordle

if __name__ == "__main__":
    # Add argument to set app style
    sys.argv += ['--style', 'material']
    QQuickStyle.setStyle("Material")

    # Create QML app
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Create controller and model
    model = Wordle()
    controller = WordleController(model)

    # Set controller to QML root context so it can be called from QML
    engine.rootContext().setContextProperty("controller", controller)

    # Load QML file for main window
    qml_file = Path(__file__).resolve().parent / "qml/ventana.qml"
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
