from PySide6.QtCore import QObject, Slot

from wordle.modelo.wordle import Wordle


class WordleController(QObject):

    def __init__(self, model: Wordle):
        super().__init__()
        self.wordle: Wordle = model

    @Slot()
    def iniciar_juego(self):
        self.wordle.iniciar_nuevo_juego()

    @Slot(str, result=list)
    def verificar_palabra(self, palabra: str) -> list:
        print(f"Palabra recibida: {palabra}")
        resultado: list[int] = self.wordle.intentar_palabra(palabra)
        print(f"Resultado python: {resultado}")
        return resultado

