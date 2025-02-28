import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_project/pages/sign_in_page.dart';


class AuthService {
  static final _auth = FirebaseAuth.instance;

  static bool isLoggedIn() {
    final User? firebaseUser = _auth.currentUser;
    return firebaseUser != null;
  }

  static Future<User?> signUp(
      String email, String password, String cfpassword) async {
    var result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    return user;
  }

  static Future<User?> loginUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    final User firebaseUser = _auth.currentUser!;
    return firebaseUser;
  }

  static void signOut(BuildContext context) {
    _auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      return SignInPage();
    }));
  }
}
