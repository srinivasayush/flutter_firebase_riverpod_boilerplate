import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_riverpod_boilerplate/services/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authServiceProvider = ChangeNotifierProvider<AuthService>((ref) {
  return AuthService();
});

class AuthService extends ChangeNotifier {
  bool isLoading = false;

  Future<UserCredential?> signInWithGoogle() async {
    _setLoading(true);
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      _setLoading(false);
      return null;
    }

    // Obtain the auth details from the request
    final googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken!,
      idToken: googleAuth.idToken!,
    );

    // Once signed in, return the UserCredential
    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    await addUser(result.user!);
    _setLoading(false);
    return result;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    _setLoading(true);
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _setLoading(false);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      print("Error => $e");
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      throw e;
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    _setLoading(true);
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: email,
      );
      _setLoading(false);
      return userCredential;
    } on FirebaseAuthException catch (error) {
      _setLoading(false);
      print(error.toString());
      print(error.code);
      throw error;
    }
  }

  void _setLoading(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }
}
