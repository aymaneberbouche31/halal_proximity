import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    String? _errorMessage;
    String? get errorMessage => _errorMessage;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserCredential?> login({required String email, required String password}) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // Gérer les exceptions FirebaseAuth
      _errorMessage = e.message;
      throw e;
    } catch (e) {
      // Gérer les autres exceptions
      _errorMessage = e.toString();
      throw e;
    }
  }


  Future<UserCredential> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
     _errorMessage = e.message;
      throw e;
    } catch (e) {
      // Gérer les autres exceptions
      _errorMessage = e.toString();
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      // Handle other exceptions here
      throw e;
    }
  }
}
