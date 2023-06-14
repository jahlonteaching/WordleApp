import json
from PySide6.QtCore import QObject, Slot
from wordle.modelo.errores import PalabraNoExistenteError

from wordle.modelo.wordle import Wordle


class WordleController(QObject):

    def __init__(self, model: Wordle):
        super().__init__()
        self.wordle: Wordle = model

    @Slot()
    def iniciar_juego(self):
        self.wordle.iniciar_nuevo_juego()

    @Slot(str, result=str)
    def verificar_palabra(self, palabra: str) -> str:
        respuesta = {}
        try:
            resultado: list[int] = self.wordle.intentar_palabra(palabra)
        except PalabraNoExistenteError as err:
            respuesta["estado"] = "ERROR"
            respuesta["mensaje_error"] = err.message
        else:
            respuesta["estado"] = "OK"
            respuesta["resultado"] = resultado
            respuesta["tiene_intentos"] = self.wordle.tiene_intentos()
            respuesta["descubrio_palabra"] = self.wordle.descubrio_palabra(resultado)

        return json.dumps(respuesta)
