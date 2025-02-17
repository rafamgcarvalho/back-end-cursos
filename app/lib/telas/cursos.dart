// import 'package:flutter/material.dart';
// import 'package:cursos/apis/api.dart';
// import 'package:cursos/autenticador.dart';
// import 'package:cursos/componentes/curso_card.dart';
// import 'package:cursos/estado.dart';
// import 'package:toast/toast.dart';

// class Cursos extends StatefulWidget {
//   const Cursos({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _EstadoCursos();
//   }
// }

// const int TAMANHO_DA_PAGINA = 4;

// class _EstadoCursos extends State<Cursos> {
//   List<dynamic> _cursos = [];

//   final ScrollController _controladorListaCursos = ScrollController();
//   final TextEditingController _controladorDoFiltro = TextEditingController();

//   late DragStartDetails startVerticalDragDetails;
//   late DragUpdateDetails updateVerticalDragDetails;

//   // ignore: unused_field
//   String _filtro = "";

//   late ServicoCursos _servicoCursos;
//   int _ultimoCurso = 0;

//   @override
//   void initState() {
//     super.initState();

//     ToastContext().init(context);
//     _servicoCursos = ServicoCursos();

//     _controladorListaCursos.addListener(() {
//       if (_controladorListaCursos.position.pixels ==
//           _controladorListaCursos.position.maxScrollExtent) {
//         _carregarCursos();
//       }
//     });

//     _carregarCursos();
//     _recuperarUsuario();
//   }

//   void _recuperarUsuario() {
//     Autenticador.recuperarUsuario().then((usuario) => estadoApp.login(usuario));
//   }

//   void _carregarCursos() {
//     _servicoCursos.getCursos(_ultimoCurso, TAMANHO_DA_PAGINA).then((cursos) {
//       setState(() {
//         if (cursos.isNotEmpty) {
//           _ultimoCurso = cursos.last["curso_id"];
//         }

//         _cursos.addAll(cursos);
//       });
//     });
//   }

//   Future<void> _atualizarCursos() async {
//     _cursos = [];
//     _ultimoCurso = 0;

//     _controladorDoFiltro.text = "";
//     _filtro = "";

//     _carregarCursos();
//   }

//   void _aplicarFiltro(String filtro) {
//     _filtro = filtro;

//     _carregarCursos();
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool usuarioLogado = estadoApp.usuario != null;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigo[900], // Cor de fundo do AppBar
//         elevation: 4, // Sombra sutil
//         title: const Text(
//           "Cursos",
//           style: TextStyle(
//             color: Colors.white, // Texto branco para contraste
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   top: 10, bottom: 10, left: 60, right: 20),
//               child: TextField(
//                 controller: _controladorDoFiltro,
//                 onSubmitted: (filtro) {
//                   _aplicarFiltro(filtro);
//                 },
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white, // Fundo branco para o campo de busca
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12), // Bordas arredondadas
//                     borderSide: BorderSide.none, // Remove a borda padrão
//                   ),
//                   hintText: "Pesquisar...",
//                   hintStyle: TextStyle(color: Colors.grey[600]), // Cor do texto de dica
//                   suffixIcon: Icon(Icons.search, color: Colors.indigo[900]), // Ícone com cor temática
//                 ),
//               ),
//             ),
//           ),
//           usuarioLogado
//               ? IconButton(
//                   onPressed: () {
//                     Autenticador.logout().then((_) => setState(() {
//                           estadoApp.logout();

//                           Toast.show("Você foi desconectado",
//                               duration: Toast.lengthLong, gravity: Toast.bottom);
//                         }));
//                   },
//                   icon: const Icon(Icons.logout, color: Colors.white), // Ícone branco
//                 )
//               : IconButton(
//                   onPressed: () {
//                     Autenticador.login().then((usuario) => setState(() {
//                           estadoApp.login(usuario);

//                           if (usuario != null) {
//                             Toast.show("Você foi conectado",
//                                 duration: Toast.lengthLong, gravity: Toast.bottom);
//                           }
//                         }));
//                   },
//                   icon: const Icon(Icons.login, color: Colors.white), // Ícone branco
//                 ),
//         ],
//       ),
//       body: RefreshIndicator(
//         color: Colors.indigo[900], // Cor do ícone de atualização
//         onRefresh: () => _atualizarCursos(),
//         child: GridView.builder(
//           controller: _controladorListaCursos,
//           scrollDirection: Axis.vertical,
//           physics: const AlwaysScrollableScrollPhysics(),
//           shrinkWrap: true,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 10, // Espaçamento entre os cards
//             mainAxisSpacing: 10, // Espaçamento vertical entre os cards
//             childAspectRatio: 0.5,
//           ),
//           itemCount: _cursos.length,
//           itemBuilder: (context, index) {
//             return CursoCard(curso: _cursos[index]);
//           },
//         ),
//       ),
//     );
//   }
// }




// ignore_for_file: dead_code, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:cursos/apis/api.dart';
import 'package:cursos/autenticador.dart';
import 'package:cursos/componentes/curso_card.dart';
import 'package:cursos/estado.dart';
import 'package:toast/toast.dart';

class Cursos extends StatefulWidget {
  const Cursos({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EstadoCursos();
  }
}

const int TAMANHO_DA_PAGINA = 4;

class _EstadoCursos extends State<Cursos> {
  List<dynamic> _cursos = [];

  final ScrollController _controladorListaCursos = ScrollController();
  final TextEditingController _controladorDoFiltro = TextEditingController();

  late DragStartDetails startVerticalDragDetails;
  late DragUpdateDetails updateVerticalDragDetails;

  // ignore: unused_field
  String _filtro = "";

  late ServicoCursos _servicoCursos;
  int _ultimoCurso = 0;

  @override
  void initState() {
    super.initState();

    ToastContext().init(context);
    _servicoCursos = ServicoCursos();

    _controladorListaCursos.addListener(() {
      if (_controladorListaCursos.position.pixels ==
          _controladorListaCursos.position.maxScrollExtent) {
        _carregarCursos();
      }
    });

    _carregarCursos();
    _recuperarUsuario();
  }

  void _recuperarUsuario() {
    Autenticador.recuperarUsuario().then((usuario) => estadoApp.login(usuario));
  }

  void _carregarCursos() {
    _servicoCursos
        .getCursos(_ultimoCurso, TAMANHO_DA_PAGINA)
        .then((cursos) {
      setState(() {
        if (cursos.isNotEmpty) {
          _ultimoCurso = cursos.last["curso_id"];
        }

        _cursos.addAll(cursos);
      });
    });
  }

  Future<void> _atualizarCursos() async {
    _cursos = [];
    _ultimoCurso = 0;

    _controladorDoFiltro.text = "";
    _filtro = "";

    _carregarCursos();
  }

  void _aplicarFiltro(String filtro) {
    _filtro = filtro;

    _carregarCursos();
  }

  @override
  Widget build(BuildContext context) {
    bool usuarioLogado = estadoApp.usuario != null;

    return Scaffold(
        appBar: AppBar(actions: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 60, right: 20),
                  child: TextField(
                    controller: _controladorDoFiltro,
                    onSubmitted: (filtro) {
                      _aplicarFiltro(filtro);
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.search)),
                  ))),
          usuarioLogado
              ? IconButton(
                  onPressed: () {
                    Autenticador.logout().then((_) => setState(() {
                          estadoApp.logout();

                          Toast.show("Você foi desconectado",
                              duration: Toast.lengthLong,
                              gravity: Toast.bottom);
                        }));
                  },
                  icon: const Icon(Icons.logout))
              : IconButton(
                  onPressed: () {
                    Autenticador.login().then((usuario) => setState(() {
                          estadoApp.login(usuario);

                          if (usuario != null) {
                            Toast.show("Você foi conectado",
                                duration: Toast.lengthLong,
                                gravity: Toast.bottom);
                          }
                        }));
                  },
                  icon: const Icon(Icons.login))
        ]),
        body: RefreshIndicator(
            color: Colors.blueAccent,
            onRefresh: () => _atualizarCursos(),
            child: GridView.builder(
                controller: _controladorListaCursos,
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.5,
                ),
                itemCount: _cursos.length,
                itemBuilder: (context, index) {
                  return CursoCard(curso: _cursos[index]);
                })));
  }
}