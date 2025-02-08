import unittest
import urllib.request
import json

URL_CURSOS = "http://localhost:5001/cursos"
URL_CURSO = "http://localhost:5001/curso"

TAMANHO_DA_PAGINA = 3
NOME_DO_CURSO = "multiplataforma"

class TesteCursos(unittest.TestCase):

    def acessar(self, url):
        resposta = urllib.request.urlopen(url)
        dados = resposta.read()
        return dados.decode("utf-8")
        
    def testar_01_lazy_loading(self):
        dados = self.acessar(f"{URL_CURSOS}/0/{TAMANHO_DA_PAGINA}")
        cursos = json.loads(dados)

        self.assertLessEqual(len(cursos), TAMANHO_DA_PAGINA)
        self.assertEqual(cursos[TAMANHO_DA_PAGINA - 1]['curso_id'], TAMANHO_DA_PAGINA)

        dados = self.acessar(f"{URL_CURSOS}/3/{TAMANHO_DA_PAGINA}")
        cursos = json.loads(dados)

        self.assertLessEqual(len(cursos), TAMANHO_DA_PAGINA)
        self.assertEqual(cursos[TAMANHO_DA_PAGINA - 1]['curso_id'], TAMANHO_DA_PAGINA * 2)

    def testar_02_pesquisa_curso_pelo_id(self):
        dados = self.acessar(f"{URL_CURSO}/1")
        curso = json.loads(dados)

        self.assertEqual(curso['curso_id'], 1)

    def testar_03_pesquisa_curso_pelo_nome(self):
        dados = self.acessar(f"{URL_CURSOS}/0/{TAMANHO_DA_PAGINA}/{NOME_DO_CURSO}")
        cursos = json.loads(dados)

        for curso in cursos:
            self.assertIn(NOME_DO_CURSO, curso['nome_curso'].lower())