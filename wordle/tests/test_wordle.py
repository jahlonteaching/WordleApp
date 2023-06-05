import pytest as pytest

from wordle.modelo.wordle import Wordle


@pytest.mark.parametrize("palabra_secreta, palabra, resultado", [
    ("LARGA", "AVENA", [2, 0, 0, 0, 1]),
    ("LARGA", "FALLA", [0, 1, 2, 0, 1]),
    ("LARGA", "LEGAL", [1, 0, 2, 2, 0]),
    ("LARGA", "ATACA", [2, 0, 0, 0, 1])
])
def test_wordle_marca_casilla_bien(palabra_secreta, palabra, resultado):
    wordle = Wordle()
    wordle.iniciar_nuevo_juego(palabra_secreta=palabra_secreta)

    resultado_wordle = wordle.intentar_palabra(palabra)

    assert resultado_wordle == resultado
