
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {

  static Future<bool> registration(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      return userCredential.user != null;
    }
    catch (e) {
      return false;
    }
  }

}