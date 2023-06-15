import random
import requests

from enum import Enum
from typing import Optional

from wordle.modelo.errores import LongitudDePalabraIncorrectaError, PalabraNoExistenteError


url = "https://lexicala1.p.rapidapi.com/search-entries"
headers = {
	"X-RapidAPI-Key": "bd189fe007msh7b7d1559c09a2e5p1d7ab2jsn6c1815d8c49e",
	"X-RapidAPI-Host": "lexicala1.p.rapidapi.com"
}


class Resultado(Enum):
    POSICION_CORRECTA = 1
    POSICION_INCORRECTA = 2
    NO_PERTENECE = 0


class Palabra:

    def __init__(self, palabra_secreta: str):
        if len(palabra_secreta) != 5:
            raise LongitudDePalabraIncorrectaError(f"{palabra_secreta} no es una palabra de 5 letras")
        
        self.palabra_secreta: str = palabra_secreta
        self.__definicion: Optional[str] = None
        self._frecuencias: dict[str, int] = {}
        self._init_frecuencias(palabra_secreta)

    def _init_frecuencias(self, palabra):
        self._frecuencias.clear()
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
                if not self._contiene_letra_en(i, letra):
                    self._frecuencias[letra] -= 1
                    resultado[i] = Resultado.POSICION_INCORRECTA.value

        self._init_frecuencias(self.palabra_secreta)

        return resultado
    
    @property
    def definicion(self):
        if self.__definicion is None:
            querystring = {"text": self.palabra_secreta.lower(), "language": "es"}
            response = requests.get(url, headers=headers, params=querystring)
            data = response.json()
            if data['n_results'] > 0:
                self.__definicion = data['results'][0]['senses'][0]['definition']
            else:
                self.__definicion = "No se encontró una definición"
        return self.__definicion
        


class Wordle:

    MAX_INTENTOS: int = 6

    def __init__(self):
        self.palabras: list[str] = []
        self.intentos: int = 0
        self.palabra: Optional[Palabra] = None

    def iniciar_nuevo_juego(self, palabra_secreta=None):
        self.intentos = 0
        if palabra_secreta is None:
            self.palabra = Palabra(self.obtener_palabra_secreta())
        else:
            self.palabra = Palabra(palabra_secreta)

    def obtener_palabra_secreta(self) -> str:
        if len(self.palabras) == 0:
            with open("assets/5_letter_words.txt", mode='r', encoding='utf8') as file:
                self.palabras = file.readlines()
            
            self.palabras = [word.strip().upper() for word in self.palabras]
        
        return random.choice(self.palabras)

    def intentar_palabra(self, palabra: str):
        if self.palabra_en_base_de_datos(palabra):
            self.intentos += 1
            return self.palabra.verificar_palabra(palabra)
        else:
            raise PalabraNoExistenteError(f"{palabra} \n no es existe en la base de datos")

    def palabra_en_base_de_datos(self, palabra):
        return palabra in self.palabras

    def descubrio_palabra(self, resultado):
        return all([item == Resultado.POSICION_CORRECTA.value for item in resultado])

    def tiene_intentos(self):
        return self.intentos < Wordle.MAX_INTENTOS



