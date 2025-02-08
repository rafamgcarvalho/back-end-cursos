import unittest
import urllib.request
import sys
import json

URL_COMENTARIOS = "http://localhost:5002/comentarios"
URL_ADICIONAR_COMENTARIO = "http://localhost:5002/adicionar"
URL_REMOVER_COMENTARIO = "http://localhost:5002/remover"

TAMANHO_DA_PAGINA = 4
NOVO_COMENTARIO = "TESTE_DE_COMENTÁRIO_123456!@"

class TesteComentarios(unittest.TestCase):

    def acessar(self, url):
        resposta = urllib.request.urlopen(url)
        dados = resposta.read()

        return dados.decode("utf-8")

    def enviar(self, url, metodo):
        requisicao = urllib.request.Request(url, method=metodo)
        resposta = urllib.request.urlopen(requisicao)
        dados = resposta.read()

        return dados.decode("utf-8")

    def testar_01_lazy_loading(self):
        dados = self.acessar(f"{URL_COMENTARIOS}/1/{sys.maxsize}/{TAMANHO_DA_PAGINA}")
        comentarios = json.loads(dados)

        self.assertLessEqual(len(comentarios), TAMANHO_DA_PAGINA)
        for comentario in comentarios:
            self.assertEqual(comentario['curso_id'], 1)

    def testar_02_enviar_comentario(self):
        nome = urllib.parse.quote("rafael carvalho")
        comentario = urllib.parse.quote(NOVO_COMENTARIO)

        resposta = self.enviar(f"{URL_ADICIONAR_COMENTARIO}/1/{nome}/fanfones.10@gmail.com/{comentario}", "POST")
        resposta = json.loads(resposta)

        self.assertEqual(resposta['situacao'], "ok")

        dados = self.acessar(f"{URL_COMENTARIOS}/1/{sys.maxsize}/{TAMANHO_DA_PAGINA}")
        comentarios = json.loads(dados)

        self.assertEqual(comentarios[0]['comentario'], NOVO_COMENTARIO)

    def testar_03_remover_comentario(self):
        dados = self.acessar(f"{URL_COMENTARIOS}/1/{sys.maxsize}/{TAMANHO_DA_PAGINA}")
        comentarios = json.loads(dados)

        comentario_id = comentarios[0]['comentario_id']

        resposta = self.enviar(f"{URL_REMOVER_COMENTARIO}/{comentario_id}", "DELETE")
        resposta = json.loads(resposta)

        self.assertEqual(resposta['situacao'], "ok")
    