import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/authentification_service.dart';

class AuthenticationViewModel extends ChangeNotifier {
  AuthenticationService _authenticationService = AuthenticationService();
  String? errorMessage;
  bool isLoading = false;

  AuthenticationViewModel(this._authenticationService) {
    _authenticationService.authStateChanges.listen((User? user) {
      _currentUser = user;
      notifyListeners();
    });
  }

  User? _currentUser;

  User? get currentUser => _currentUser;

  bool get isLoggedIn => _currentUser != null;
  

  Future<void> register({required String email, required String password}) async {
    errorMessage = null;
    try {
      isLoading = true;
      notifyListeners();
      UserCredential? userCredential = await _authenticationService.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      errorMessage = _authenticationService.errorMessage ?? e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

Future<void> login({required String email, required String password}) async {
  errorMessage = null;
    try {
      isLoading = true;
      notifyListeners();

      UserCredential? userCredential = await _authenticationService.login(email: email, password: password);

    } catch (e) {
      // Utiliser le getter pour obtenir le message d'erreur
      errorMessage = _authenticationService.errorMessage ?? e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      await _authenticationService.signOut();
    } catch (e) {
      errorMessage = _authenticationService.errorMessage ?? e.toString();
    }
  }
}