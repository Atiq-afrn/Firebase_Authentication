import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Firebaseservice {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpMethod(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'this email already in exist !');
      } else {
        Fluttertoast.showToast(msg: 'some error occured : ${e.code}');
      }
    }
    return null;
  }

  Future<User?> signInMethod(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'invalid-credential') {
        Fluttertoast.showToast(msg: 'invalid email id or password');
      } else {
        Fluttertoast.showToast(msg: 'some error occured : ${e.code}');
      }
    }
    return null;
  }
}
