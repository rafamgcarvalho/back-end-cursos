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
          child: Column(children: [
            Image.network(formatarCaminhoArquivo(curso["imagem1"])),
            Row(children: [
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.network(
                          formatarCaminhoArquivo(curso["avatar"])))),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                  child: Text(curso["nome_empresa"],
                      style: const TextStyle(fontSize: 17))),
            ]),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(curso["nome_curso"],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 5.0, bottom: 10.0),
                child: Text(curso["descricao"])),
            Row(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("R\$ ${curso["preco"].toString()}",
                      style: const TextStyle(fontWeight: FontWeight.bold))),
              Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Row(children: [
                    const Icon(Icons.favorite_rounded,
                        color: Colors.red, size: 18),
                    Text(curso["likes"].toString())
                  ]))
            ])
          ]),
        ));
  }
}
















// class CardCurso extends StatelessWidget {
//   final dynamic curso;

//   const CardCurso({super.key, required this.curso});

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
//                           formatarCaminhoArquivo(curso["avatar"]))))
//             ]),
//             Padding(
//                 padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
//                 child: Text(curso["nome_instituicao"],
//                     style: const TextStyle(fontSize: 17))),
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
