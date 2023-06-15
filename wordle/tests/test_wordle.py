import pytest as pytest

from wordle.modelo.wordle import Wordle



@pytest.fixture
def wordle():
    wordle = Wordle()
    wordle.obtener_palabra_secreta()
    return wordle

@pytest.mark.parametrize("palabra_secreta, palabra, resultado", [
    ("LARGA", "AVENA", [2, 0, 0, 0, 1]),
    ("LARGA", "FALLA", [0, 1, 2, 0, 1]),
    ("LARGA", "LEGAL", [1, 0, 2, 2, 0]),
    ("LARGA", "ATACA", [2, 0, 0, 0, 1]),
    ("LARGA", "RADIO", [2, 1, 0, 0, 0]),
    ("RADIO", "AVENA", [2, 0, 0, 0, 0]),
    ("PAJAR", "FALLA", [0, 1, 0, 0, 2]),
    ("ERMAR", "MIMAR", [0, 0, 1, 1, 1]),
])
def test_wordle_marca_casilla_bien(palabra_secreta, palabra, resultado, wordle):
    wordle.iniciar_nuevo_juego(palabra_secreta=palabra_secreta)

    resultado_wordle = wordle.intentar_palabra(palabra)

    assert resultado_wordle == resultado


@pytest.mark.parametrize("palabra_secreta, palabra, esperado", [
    ("LARGA", "AVENA", False),
    ("LARGA", "LARGO", False),
    ("LARGA", "LARGA", True)
])
def test_descubrio_palabra(palabra_secreta, palabra, esperado, wordle):
    wordle.iniciar_nuevo_juego(palabra_secreta=palabra_secreta)

    resultado = wordle.intentar_palabra(palabra)

    assert wordle.descubrio_palabra(resultado) == esperado
