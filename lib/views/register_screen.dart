import 'package:flutter/material.dart';
import 'package:halal_proximity/viewmodels/authentification_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:halal_proximity/components/my_button.dart';
import 'package:halal_proximity/components/my_textfield.dart';

class RegisterScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // register user method
  void registerUser(BuildContext context) {
    final authViewModel = Provider.of<AuthenticationViewModel>(context, listen: false);
    authViewModel.register(email : emailController.text, password : passwordController.text);
  
  if (authViewModel.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authViewModel.errorMessage!)),
      );
    } else {
      Navigator.of(context).pushReplacementNamed('/login');  // Navigate to home or login screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
    // Dégradé de couleurs
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 69, 117, 118),
         Color.fromARGB(255, 166, 168, 159),
         // Couleur de départ
        // Couleur de fin
      ],
    ),
    // Ombre
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5), // Couleur de l'ombre
        spreadRadius: 5, // Étendue de l'ombre
        blurRadius: 7, // Flou de l'ombre
        offset: Offset(0, 3), // Décalage de l'ombre
      ),
    ],
  ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Icon(
                    Icons.person_add,
                    size: 100,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Créez votre compte',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Mot de passe',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  MyButton(
                    onTap: () => registerUser(context),
                    text: 'Register',
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Déja un compte ?',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Se connecter',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
