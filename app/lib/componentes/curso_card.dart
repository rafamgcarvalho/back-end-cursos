// import 'package:flutter/material.dart';
// import 'package:cursos/apis/api.dart';
// import 'package:cursos/estado.dart';

// class CursoCard extends StatelessWidget {
//   final dynamic curso;

//   const CursoCard({super.key, required this.curso});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {
//           estadoApp.mostrarDetalhes(curso["curso_id"]);
//         },
//         child: Card(
//           child: Column(children: [
//             Image.network(formatarCaminhoArquivo(curso["imagem1"])),
//             Row(children: [
//               Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: CircleAvatar(
//                       backgroundColor: Colors.transparent,
//                       child: Image.network(
//                           formatarCaminhoArquivo(curso["avatar"])))),
//               Padding(
//                   padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
//                   child: Text(curso["nome_empresa"],
//                       style: const TextStyle(fontSize: 17))),
//             ]),
//             Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Text(curso["nome_curso"],
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 15))),
//             Padding(
//                 padding:
//                     const EdgeInsets.only(left: 10.0, top: 5.0, bottom: 10.0),
//                 child: Text(curso["descricao"])),
//             Row(children: [
//               Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: Text("R\$ ${curso["preco"].toString()}",
//                       style: const TextStyle(fontWeight: FontWeight.bold))),
//               Padding(
//                   padding: const EdgeInsets.only(left: 2.0),
//                   child: Row(children: [
//                     const Icon(Icons.favorite_rounded,
//                         color: Colors.red, size: 18),
//                     Text(curso["likes"].toString())
//                   ]))
//             ])
//           ]),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:cursos/apis/api.dart';
import 'package:cursos/estado.dart';

class CursoCard extends StatelessWidget {
  final dynamic curso;

  const CursoCard({super.key, required this.curso});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          estadoApp.mostrarDetalhes(curso["curso_id"]);
        },
        child: Card(
          elevation: 4, // Adiciona uma sombra sutil ao card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Bordas arredondadas
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Alinha os elementos à esquerda
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)), // Bordas arredondadas na imagem
                child: Image.network(
                  formatarCaminhoArquivo(curso["imagem1"]),
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.network(
                        formatarCaminhoArquivo(curso["avatar"]),
                      ),
                    ),
                    SizedBox(width: 10), // Espaçamento entre o avatar e o texto
                    Text(
                      curso["nome_empresa"],
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.blueGrey[800], // Cor mais escura e sofisticada
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  curso["nome_curso"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.indigo[900], // Cor escura e elegante
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  curso["descricao"],
                  style: TextStyle(
                    color: Colors.grey[700], // Cor de texto mais suave
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinha os elementos nas extremidades
                  children: [
                    Text(
                      "R\$ ${curso["preco"].toString()}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800], // Cor verde para o preço
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_rounded,
                          color: Colors.red[400], // Cor vermelha mais suave
                          size: 18,
                        ),
                        SizedBox(width: 4), // Espaçamento entre o ícone e o texto
                        Text(
                          curso["likes"].toString(),
                          style: TextStyle(
                            color: Colors.grey[700], // Cor de texto mais suave
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}