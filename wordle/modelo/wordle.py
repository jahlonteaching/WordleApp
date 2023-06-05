from enum import Enum
from typing import Optional

from wordle.modelo.errores import LongitudDePalabraIncorrectaError


class Resultado(Enum):
    POSICION_CORRECTA = 1
    POSICION_INCORRECTA = 2
    NO_PERTENECE = 0


class Palabra:

    def __init__(self, palabra_secreta: str):
        if len(palabra_secreta) != 5:
            raise LongitudDePalabraIncorrectaError(f"{palabra_secreta} no es una palabra de 5 letras")

        self.palabra_secreta: str = palabra_secreta
        self._frecuencias: dict[str, int] = {}
        self._init_frecuencias(palabra_secreta)

    def _init_frecuencias(self, palabra):
        for letra in palabra:
            if letra not in self._frecuencias.keys():
                self._frecuencias[letra] = 1
            else:
                self._frecuencias[letra] += 1

    def _contiene_letra_en(self, posicion: int, letra: str) -> bool:
        return self.palabra_secreta[posicion] == letra

    def _verificar_correctas(self, palabra: str) -> list[int]:
        resultado = [Resultado.NO_PERTENECE.value for _ in range(len(palabra))]

        for i, letra in enumerate(palabra):
            if letra in self._frecuencias.keys() and self._contiene_letra_en(i, letra):
                self._frecuencias[letra] -= 1
                resultado[i] = Resultado.POSICION_CORRECTA.value

        return resultado

    def verificar_palabra(self, palabra: str) -> list[int]:
        if len(palabra) != 5:
            raise LongitudDePalabraIncorrectaError(f"{palabra} no es una palabra de 5 letras")

        resultado = self._verificar_correctas(palabra)

        for i, letra in enumerate(palabra):
            if letra in self._frecuencias.keys() and self._frecuencias[letra] > 0:
                self._frecuencias[letra] -= 1
                if not self._contiene_letra_en(i, letra):
                    resultado[i] = Resultado.POSICION_INCORRECTA.value

        return resultado


class Wordle:

    MAX_INTENTOS: int = 6

    def __init__(self):
        self.intentos: int = 0
        self.palabra: Optional[Palabra] = None

    def iniciar_nuevo_juego(self, palabra_secreta=None):
        self.intentos = 0
        if palabra_secreta is None:
            self.palabra = Palabra(self.obtener_palabra_secreta())
        else:
            self.palabra = Palabra(palabra_secreta)

    def obtener_palabra_secreta(self) -> str:
        return "LARGA"

    def intentar_palabra(self, palabra: str):
        self.intentos += 1
        return self.palabra.verificar_palabra(palabra)

    def descubrio_palabra(self, resultado):
        return all([item == Resultado.POSICION_CORRECTA for item in resultado])

    def tiene_intentos(self):
        return self.intentos < Wordle.MAX_INTENTOS



