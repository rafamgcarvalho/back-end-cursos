import 'package:flutter/material.dart';
import 'package:cursos/estado.dart';

import 'package:provider/provider.dart';

import 'telas/detalhes.dart';
import 'telas/cursos.dart';

void main() {
  runApp(const Marcas());
}

class Marcas extends StatelessWidget {
  const Marcas({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => Estado(),
        child: MaterialApp(
          title: 'Cursos Online',
          theme: ThemeData(
              colorScheme: const ColorScheme.light(),
              useMaterial3: true,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.blueGrey)),
          home: const TelaPrincipal(title: 'Cursos Online'),
        ));
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key, required this.title});

  final String title;

  @override
  State<TelaPrincipal> createState() => _EstadoTelaPrincipal();
}

class _EstadoTelaPrincipal extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    estadoApp = context.watch<Estado>();

    final media = MediaQuery.of(context);
    estadoApp.setDimensoes(media.size.height, media.size.width);

    Widget tela = const SizedBox.shrink();
    if (estadoApp.mostrandoCursos()) {
      tela = const Cursos();
    } else if (estadoApp.mostrandoDetalhes()) {
      tela = const Detalhes();
    }

    return tela;
  }
}
