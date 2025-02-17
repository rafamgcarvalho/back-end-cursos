// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cursos/usuario.dart';

const URL_CURSOS = "http://10.0.2.2:5001/cursos";
const URL_CURSO = "http://10.0.2.2:5001/curso";

const URL_COMENTARIOS = "http://10.0.2.2:5002/comentarios";
const URL_ADICIONAR_COMENTARIO = "http://10.0.2.2:5002/adicionar";
const URL_REMOVER_COMENTARIO = "http://10.0.2.2:5002/remover";

const URL_CURTIU = "http://10.0.2.2:5003/curtiu";
const URL_CURTIR = "http://10.0.2.2:5003/curtir";
const URL_DESCURTIR = "http://10.0.2.2:5003/descurtir";

const URL_ARQUIVOS = "http://10.0.2.2:5005/";

class ServicoCursos {
  Future<List<dynamic>> getCursos(int ultimoId, int tamanhoPagina) async {
    final resposta =
        await http.get(Uri.parse('$URL_CURSOS/$ultimoId/$tamanhoPagina'));
    if (resposta.statusCode != 200) {
      throw Exception('Erro ao buscar cursos');
    }

    return jsonDecode(resposta.body);
  }

  Future<List<dynamic>> findCursos(
      int ultimoCurso, int tamanhoPagina, String nome) async {
    final resposta = await http
        .get(Uri.parse("$URL_CURSOS/$ultimoCurso/$tamanhoPagina/$nome"));
    final cursos = jsonDecode(resposta.body);

    return cursos;
  }

  Future<Map<String, dynamic>> findCurso(int idCurso) async {
    final resposta = await http.get(Uri.parse("$URL_CURSO/$idCurso"));
    final cursos = jsonDecode(resposta.body);

    return cursos;
  }
}

class ServicoComentarios {
  Future<List<dynamic>> getComentarios(
      int idCurso, int ultimoId, int tamanhoPagina) async {
    final resposta = await http
        .get(Uri.parse('$URL_COMENTARIOS/$idCurso/$ultimoId/$tamanhoPagina'));
    if (resposta.statusCode != 200) {
      throw Exception("Erro ao buscar comentários");
    }

    return jsonDecode(resposta.body);
  }

  Future<dynamic> adicionar(
      int idCurso, Usuario usuario, String comentario) async {
    final resposta = await http.post(Uri.parse(
        "$URL_ADICIONAR_COMENTARIO/$idCurso/${usuario.nome}/${usuario.email}/$comentario"));

    return jsonDecode(resposta.body);
  }

  Future<dynamic> remover(int idComentario) async {
    final resposta =
        await http.delete(Uri.parse("$URL_REMOVER_COMENTARIO/$idComentario"));

    return jsonDecode(resposta.body);
  }
}

class ServicoCurtidas {
  Future<bool> curtiu(Usuario usuario, int idCurso) async {
    final resposta =
        await http.get(Uri.parse("$URL_CURTIU/${usuario.email}/$idCurso"));
    final resultado = jsonDecode(resposta.body);

    return resultado["curtiu"] as bool;
  }

  Future<dynamic> curtir(Usuario usuario, int idCurso) async {
    final resposta =
        await http.post(Uri.parse("$URL_CURTIR/${usuario.email}/$idCurso"));

    return jsonDecode(resposta.body);
  }

  Future<dynamic> descurtir(Usuario usuario, int idCurso) async {
    final resposta = await http
        .post(Uri.parse("$URL_DESCURTIR/${usuario.email}/$idCurso"));

    return jsonDecode(resposta.body);
  }
}

String formatarCaminhoArquivo(String arquivo) {
  return '$URL_ARQUIVOS/$arquivo';
}
