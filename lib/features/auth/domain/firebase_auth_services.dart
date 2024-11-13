import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> singUp(String email, String password) async {

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      print('Error al crear usuario');
    }

    return null;

  }

  Future<User?> singIn(String email, String password) async {

    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      print('Error al crear usuario');
    }

    return null;

  }

}