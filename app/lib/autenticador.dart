// ignore_for_file: unnecessary_getters_setters, avoid_print
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cursos/usuario.dart';

class Autenticador {
  static Future<Usuario?> login() async {
    Usuario? usuario;

    try {
      final gUser = await GoogleSignIn().signIn();
      usuario = Usuario(gUser!.displayName, gUser.email);
    } catch (erro) {
      print('Erro ao tentar acessar a conta: $erro');
    }

    return usuario;
  }

  static Future<Usuario?> recuperarUsuario() async {
    Usuario? usuario;

    try {
      final gSignIn = GoogleSignIn();
      if (await gSignIn.isSignedIn()) {
        await gSignIn.signInSilently();

        final gUser = gSignIn.currentUser;
        if (gUser != null) {
          usuario = Usuario(gUser.displayName, gUser.email);
        }
      }
      // usuario =
      //     Usuario("Luis Paulo da Silva Carvalho", "luispscarvalho@gmail.com");
    } catch (erro) {
      print('Erro ao tentar acessar a conta: $erro');
    }

    return usuario;
  }

  static Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
    } catch (erro) {
      print('Erro ao tentar acessar a conta: $erro');
    }
  }
}
