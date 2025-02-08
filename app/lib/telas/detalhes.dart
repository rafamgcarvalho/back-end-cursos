// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';
import 'package:cursos/apis/api.dart';
import 'package:cursos/estado.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:toast/toast.dart';

class Detalhes extends StatefulWidget {
  const Detalhes({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DetalhesState();
  }
}

enum _EstadoCursos { naoVerificado, temCurso, semCurso }

const TAMANHO_DA_PAGINA = 5;

class _DetalhesState extends State<Detalhes> {
  _EstadoCursos _temCurso = _EstadoCursos.naoVerificado;
  late dynamic _curso;
  int _ultimoComentario = 0x7FFFFFFFFFFFFFFF;

  List<dynamic> _comentarios = [];
  bool _temComentarios = false;

  final TextEditingController _controladorNovoComentario =
      TextEditingController();
  final ScrollController _controladorListaCursos = ScrollController();

  late PageController _controladorSlides;
  late int _slideSelecionado;

  late ServicoCursos _servicoCursos;
  late ServicoCurtidas _servicoCurtidas;
  late ServicoComentarios _servicoComentarios;

  bool _curtiu = false;

  @override
  void initState() {
    super.initState();

    ToastContext().init(context);

    _servicoCursos = ServicoCursos();
    _servicoCurtidas = ServicoCurtidas();
    _servicoComentarios = ServicoComentarios();

    _iniciarSlides();
    _carregarCurso();
    _carregarComentarios();
  }

  void _iniciarSlides() {
    _slideSelecionado = 0;
    _controladorSlides = PageController(initialPage: _slideSelecionado);
  }

  void _carregarCurso() {
    _servicoCursos.findCurso(estadoApp.idCurso).then((curso) {
      _curso = curso;

      if (estadoApp.usuario != null) {
        _servicoCurtidas
            .curtiu(estadoApp.usuario!, estadoApp.idCurso)
            .then((curtiu) {
          setState(() {
            _temCurso = _curso != null
                ? _EstadoCursos.temCurso
                : _EstadoCursos.semCurso;
            _curtiu = curtiu;
          });
        });
      } else {
        setState(() {
          _temCurso = _curso != null
              ? _EstadoCursos.temCurso
              : _EstadoCursos.semCurso;
          _curtiu = false;
        });
      }
    });
  }

  void _carregarComentarios() {
    _servicoComentarios
        .getComentarios(
            estadoApp.idCurso, _ultimoComentario, TAMANHO_DA_PAGINA)
        .then((comentarios) {
      _temComentarios = comentarios.isNotEmpty;

      if (_temComentarios) {
        _ultimoComentario = comentarios.last['comentario_id'];
      }

      setState(() {
        _comentarios = comentarios;
      });
    });
  }

  Widget _exibirMensagemCursoInexistente() {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(children: [
                    Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Text("Cursos Online"))
                  ]),
                  GestureDetector(
                      onTap: () {
                        estadoApp.mostrarCursos();
                      },
                      child: const Icon(Icons.arrow_back))
                ])),
        body: const SizedBox.expand(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.error, size: 32, color: Colors.red),
          Text("Curso inexistente :(",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.red)),
          Text("selecione outro curso na tela anterior",
              style: TextStyle(fontSize: 14))
        ])));
  }

  Widget _exibirMensagemComentariosInexistentes() {
    return const Expanded(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.error, size: 26, color: Colors.redAccent),
      Text("não existem comentários",
          style: TextStyle(fontSize: 16, color: Colors.redAccent))
    ])));
  }

  Widget _exibirComentarios() {
    return Expanded(
        child: ListView.builder(
            controller: _controladorListaCursos,
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _comentarios.length,
            itemBuilder: (context, index) {
              final comentario = _comentarios[index];
              String dataFormatada = DateFormat('dd/MM/yyyy HH:mm')
                  .format(DateTime.parse(comentario["data"]));
              bool usuarioLogadoComentou = estadoApp.usuario != null &&
                  estadoApp.usuario!.email == comentario["conta"];

              return SizedBox(
                  height: 90,
                  child: Dismissible(
                    key: Key(comentario["comentario_id"].toString()),
                    direction: usuarioLogadoComentou
                        ? DismissDirection.endToStart
                        : DismissDirection.none,
                    background: Container(
                        alignment: Alignment.centerRight,
                        child: const Padding(
                            padding: EdgeInsets.only(right: 12.0),
                            child: Icon(Icons.delete, color: Colors.red))),
                    child: Card(
                        color: usuarioLogadoComentou
                            ? Colors.green[100]
                            : Colors.white,
                        child: Column(children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 6, left: 6),
                              child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(comentario["comentario"],
                                      style: const TextStyle(fontSize: 12)))),
                          const Spacer(),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10.0, left: 6.0),
                                      child: Text(
                                        dataFormatada,
                                        style: const TextStyle(fontSize: 12),
                                      )),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        comentario["nome"],
                                        style: const TextStyle(fontSize: 12),
                                      )),
                                ],
                              )),
                        ])),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        setState(() {
                          _comentarios.removeAt(index);
                        });

                        showDialog(
                            context: context,
                            builder: (BuildContext contexto) {
                              return AlertDialog(
                                title: const Text("Deseja apagar o comentário?",
                                    style: TextStyle(fontSize: 14)),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _comentarios.insert(
                                              index, comentario);
                                        });

                                        Navigator.of(contexto).pop();
                                      },
                                      child: const Text("NÃO",
                                          style: TextStyle(fontSize: 14))),
                                  TextButton(
                                      onPressed: () {
                                        _removerComentario(
                                            comentario["comentario_id"]);

                                        Navigator.of(contexto).pop();
                                      },
                                      child: const Text("SIM",
                                          style: TextStyle(fontSize: 14)))
                                ],
                              );
                            });
                      }
                    },
                  ));
            }));
  }

  Future<void> _atualizarComentarios() async {
    _comentarios = [];
    _ultimoComentario = 0;

    _carregarComentarios();
  }

  void _adicionarComentario() {
    _servicoComentarios
        .adicionar(estadoApp.idCurso, estadoApp.usuario!,
            _controladorNovoComentario.text)
        .then((resultado) {
      if (resultado["situacao"] == "ok") {
        Toast.show("comentário adicionado",
            duration: Toast.lengthLong, gravity: Toast.bottom);

        _atualizarComentarios();
      }
    });
  }

  void _removerComentario(int idComentario) {
    _servicoComentarios.remover(idComentario).then((resultado) {
      if (resultado["situacao"] == "ok") {
        Toast.show("comentário removido com sucesso",
            duration: Toast.lengthLong, gravity: Toast.bottom);
      }
    });
  }

  List<String> _imagensDoSlide() {
    List<String> imagens = [];

    imagens.add(_curso["imagem1"]);
    if ((_curso["imagem2"] as String).isNotEmpty) {
      imagens.add(_curso["imagem2"]);
    }
    if ((_curso["imagem3"] as String).isNotEmpty) {
      imagens.add(_curso["imagem3"]);
    }

    return imagens;
  }

  Widget _exibirCurso() {
    bool usuarioLogado = estadoApp.usuario != null;
    final slides = _imagensDoSlide();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(children: [
          Row(children: [
            Image.network(formatarCaminhoArquivo(_curso["avatar"]),
                width: 38),
            Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                child: Text(
                  _curso["nome_empresa"],
                  style: const TextStyle(fontSize: 15),
                ))
          ]),
          const Spacer(),
          GestureDetector(
            onTap: () {
              estadoApp.mostrarCursos();
            },
            child: const Icon(Icons.arrow_back, size: 30),
          )
        ]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 230,
            child: Stack(children: [
              PageView.builder(
                itemCount: slides.length,
                controller: _controladorSlides,
                onPageChanged: (slide) {
                  setState(() {
                    _slideSelecionado = slide;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  return Image.network(
                    formatarCaminhoArquivo(slides[pagePosition]),
                    fit: BoxFit.cover,
                  );
                },
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Column(children: [
                    usuarioLogado
                        ? IconButton(
                            onPressed: () {
                              if (_curtiu) {
                                _servicoCurtidas
                                    .unlike(
                                        estadoApp.usuario!, estadoApp.idCurso)
                                    .then((resultado) {
                                  if (resultado["situacao"] == "ok") {
                                    Toast.show("avaliação removida",
                                        duration: Toast.lengthLong,
                                        gravity: Toast.bottom);

                                    setState(() {
                                      _carregarCurso();
                                    });
                                  }
                                });
                              } else {
                                _servicoCurtidas
                                    .curtir(
                                        estadoApp.usuario!, estadoApp.idCurso)
                                    .then((resultado) {
                                  if (resultado["situacao"] == "ok") {
                                    Toast.show("obrigado pela sua avaliação",
                                        duration: Toast.lengthLong,
                                        gravity: Toast.bottom);

                                    setState(() {
                                      _carregarCurso();
                                    });
                                  }
                                });
                              }
                            },
                            icon: Icon(_curtiu
                                ? Icons.favorite
                                : Icons.favorite_border),
                            color: Colors.red,
                            iconSize: 32)
                        : const SizedBox.shrink(),
                    IconButton(
                        onPressed: () {
                          final texto =
                              '${_curso["nome_curso"]} por R\$ ${_curso["preco"].toString()} disponível no Cursos Online.\n\n\nBaixe o Cursos Online na PlayStore!';

                          FlutterShare.share(
                              title: "Cursos Online", text: texto);
                        },
                        icon: const Icon(Icons.share),
                        color: Colors.blue,
                        iconSize: 26)
                  ]))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: PageViewDotIndicator(
              currentItem: _slideSelecionado,
              count: 3,
              unselectedColor: Colors.black26,
              selectedColor: Colors.blue,
              duration: const Duration(milliseconds: 200),
              boxShape: BoxShape.circle,
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      _curso["nome_curso"],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13),
                    )),
                Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(_curso["descricao"],
                        style: const TextStyle(fontSize: 12))),
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 6.0),
                    child: Row(children: [
                      Text(
                        "R\$ ${_curso["preco"].toString()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                  size: 18,
                                ),
                                Text(
                                  _curso["curtidas"].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ]))
                    ]))
              ],
            ),
          ),
          const Center(
              child: Text(
            "Comentários",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          )),
          usuarioLogado
              ? Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextField(
                      controller: _controladorNovoComentario,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black87, width: 0.0),
                          ),
                          border: const OutlineInputBorder(),
                          hintStyle: const TextStyle(fontSize: 14),
                          hintText: 'Digite aqui seu comentário...',
                          suffixIcon: GestureDetector(
                              onTap: () {
                                _adicionarComentario();
                              },
                              child: const Icon(Icons.send,
                                  color: Colors.black87)))))
              : const SizedBox.shrink(),
          _temComentarios
              ? _exibirComentarios()
              : _exibirMensagemComentariosInexistentes()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget detalhes = const SizedBox.shrink();

    if (_temCurso == _EstadoCursos.naoVerificado) {
      detalhes = const SizedBox.shrink();
    } else if (_temCurso == _EstadoCursos.temCurso) {
      detalhes = _exibirCurso();
    } else {
      detalhes = _exibirMensagemCursoInexistente();
    }

    return detalhes;
  }
}
