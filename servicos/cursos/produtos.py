from flask import Flask, jsonify
from urllib.request import urlopen
import mysql.connector as mysql
import json

servico = Flask("cursos")

DESCRICAO = "serviço de listagem e cadastro de cursos"
VERSAO = "1.0"

SERVIDOR_BANCO = "banco"
USUARIO_BANCO = "root"
SENHA_BANCO = "admin"
NOME_BANCO = "cursos"

def get_conexao_com_bd():
    conexao = mysql.connect(
        host = SERVIDOR_BANCO,
        user = USUARIO_BANCO,
        password = SENHA_BANCO,
        database = NOME_BANCO
    )

    return conexao

URL_LIKES = "http://likes:5000/likes_por_curso/"
def get_quantidade_de_likes(curso_id):
    url = f"{URL_LIKES}{curso_id}"
    resposta = urlopen(url)
    resposta = resposta.read()
    resposta = json.loads(resposta)
    
    return resposta["curtidas"]

@servico.get("/")
def get_info():
    return jsonify(descricao = DESCRICAO, versao = VERSAO)

@servico.get("/cursos/<int:ultimo_curso>/<int:tamanho_da_pagina>")
def get_cursos(ultimo_curso, tamanho_da_pagina):
    cursos = []

    conexao = get_conexao_com_bd()
    cursor = conexao.cursor(dictionary=True)
    cursor.execute(
        "SELECT feeds.id as curso_id, DATE_FORMAT(feeds.data, '%Y-%m-%d %H:%i') as data, " +
        "empresas.id as empresa_id, empresas.nome as nome_empresa, empresas.avatar, cursos.nome as nome_curso, cursos.descricao, FORMAT(cursos.preco, 2) as preco, " +
        "cursos.url, cursos.imagem1, IFNULL(cursos.imagem2, '') as imagem2, IFNULL(cursos.imagem3, '') as imagem3 " +
        "FROM feeds, cursos, empresas " +
        "WHERE cursos.id = feeds.curso " +
        "AND empresas.id = cursos.empresa " +
        "AND feeds.id > " + str(ultimo_curso) + " ORDER BY curso_id ASC, data DESC " +
        "LIMIT " + str(tamanho_da_pagina)
    )
    cursos = cursor.fetchall()
    if cursos:
        for curso in cursos:
            curso["likes"] = get_quantidade_de_likes(curso["curso_id"])

    conexao.close()

    return jsonify(cursos)

@servico.get("/cursos/<int:ultimo_feed>/<int:tamanho_da_pagina>/<string:nome_do_curso>")
def find_cursos(ultimo_feed, tamanho_da_pagina, nome_do_curso):
    cursos = []

    conexao = get_conexao_com_bd()
    cursor = conexao.cursor(dictionary=True)
    cursor.execute(
        "select feeds.id as curso_id, DATE_FORMAT(feeds.data, '%Y-%m-%d %H:%i') as data, " +
        "empresas.id as empresa_id, empresas.nome as nome_empresa, empresas.avatar, cursos.nome as nome_curso, cursos.descricao, FORMAT(cursos.preco, 2) as preco, " +
        "cursos.url, cursos.imagem1, IFNULL(cursos.imagem2, '') as imagem2, IFNULL(cursos.imagem3, '') as imagem3 " +
        "FROM feeds, cursos, empresas " +
        "WHERE cursos.id = feeds.curso " +
        "AND empresas.id = cursos.empresa " +
        "AND cursos.nome LIKE '%" + nome_do_curso + "%' "  +
        "AND feeds.id > " + str(ultimo_feed) + " ORDER BY curso_id ASC, data DESC " +
        "LIMIT " + str(tamanho_da_pagina)
    )
    cursos = cursor.fetchall()
    if cursos:
        for curso in cursos:
            curso["curtidas"] = get_quantidade_de_likes(curso['curso_id'])

    conexao.close()

    return jsonify(cursos)

@servico.get("/curso/<int:id>")
def find_curso(id):
    curso = {}

    conexao = get_conexao_com_bd()
    cursor = conexao.cursor(dictionary=True)
    cursor.execute(
        "select feeds.id as curso_id, DATE_FORMAT(feeds.data, '%Y-%m-%d %H:%i') as data, " +
        "empresas.id as empresa_id, empresas.nome as nome_empresa, empresas.avatar, cursos.nome as nome_curso, cursos.descricao, FORMAT(cursos.preco, 2) as preco, " +
        "cursos.url, cursos.imagem1, IFNULL(cursos.imagem2, '') as imagem2, IFNULL(cursos.imagem3, '') as imagem3 " +
        "FROM feeds, cursos, empresas " +
        "WHERE cursos.id = feeds.curso " +
        "AND empresas.id = cursos.empresa " +
        "AND feeds.id = " + str(id)
    )
    curso = cursor.fetchone()
    if curso:
        curso["curtidas"] = get_quantidade_de_likes(id)

    conexao.close()

    return jsonify(curso)


if __name__ == "__main__":
    servico.run(host="0.0.0.0", debug=True)