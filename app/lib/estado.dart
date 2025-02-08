import 'package:flutter/material.dart';
import 'package:cursos/usuario.dart';

enum Situacao { mostrandoCursos, mostrandoDetalhes }

class Estado extends ChangeNotifier {
  Situacao _situacao = Situacao.mostrandoCursos;

  double _altura = 0, _largura = 0;
  double get altura => _altura;
  double get largura => _largura;

  late int _idCurso;
  int get idCurso => _idCurso;

  Usuario? _usuario;
  Usuario? get usuario => _usuario;

  void setDimensoes(double altura, double largura) {
    _altura = altura;
    _largura = largura;
  }

  void mostrarCursos() {
    _situacao = Situacao.mostrandoCursos;

    notifyListeners();
  }

  bool mostrandoCursos() {
    return _situacao == Situacao.mostrandoCursos;
  }

  void mostrarDetalhes(int idCurso) {
    _situacao = Situacao.mostrandoDetalhes;
    _idCurso = idCurso;

    notifyListeners();
  }

  void login(Usuario? usuario) {
    _usuario = usuario;

    notifyListeners();
  }

  void logout() {
    _usuario = null;

    notifyListeners();
  }

  bool mostrandoDetalhes() {
    return _situacao == Situacao.mostrandoDetalhes;
  }
}

late Estado estadoApp;
