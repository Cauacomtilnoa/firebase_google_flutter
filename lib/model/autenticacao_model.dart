import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AutenticacaoModel {
  final FirebaseAuth autenticacao = FirebaseAuth.instance;
  final GoogleSignIn entrarGoogle = GoogleSignIn();

  User? get usuario => autenticacao.currentUser;

  Future<void> entrarComGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await entrarGoogle.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await autenticacao.signInWithCredential(credential);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deslogar() async {
    await autenticacao.signOut();
    await entrarGoogle.signOut();
  }
}