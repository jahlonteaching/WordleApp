class WordleError(Exception):
    def __init__(self, message: str) -> None:
        super().__init__(message)
        self.message = message


class LongitudDePalabraIncorrectaError(WordleError):
    def __init__(self, message: str) -> None:
        super().__init__(message)


class PalabraNoExistenteError(WordleError):
    def __init__(self, message: str) -> None:
        super().__init__(message)
