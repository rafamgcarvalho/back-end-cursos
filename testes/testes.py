import unittest
from testes.teste_cursos import *
from teste_comentarios import *

if __name__ == "__main__":
    carregador = unittest.TestLoader()
    testes = unittest.TestSuite()

    testes.addTest(carregador.loadTestsFromTestCase(TesteCursos))
    testes.addTest(carregador.loadTestsFromTestCase(TesteComentarios))

    executor = unittest.TextTestRunner()
    executor.run(testes)