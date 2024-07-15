import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Login with email and password
  Future<UserCredential?> login({required String email, required String password}) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
      throw e;
    } catch (e) {
      _errorMessage = e.toString();
      throw e;
    }
  }

  // Create a new user with email and password
  Future<UserCredential> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
      throw e;
    } catch (e) {
      _errorMessage = e.toString();
      throw e;
    }
  }

  // Sign out from Firebase and Google
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut(); // Also sign out from Google
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // The user canceled the sign-in
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
      throw e;
    } catch (e) {
      _errorMessage = e.toString();
      throw e;
    }
  }

  // Disconnect Google account
  Future<void> disconnectGoogle() async {
    await _googleSignIn.disconnect();
  }
}
