import 'package:flutter/material.dart';
import 'package:halal_proximity/components/my_button.dart';
import 'package:halal_proximity/components/my_textfield.dart';
import 'package:halal_proximity/components/square_tile.dart';
import 'package:provider/provider.dart';

import '../viewmodels/authentification_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

Future<void> login(BuildContext context) async {
    final authViewModel = Provider.of<AuthenticationViewModel>(context, listen: false);
    await authViewModel.login(email: usernameController.text, password: passwordController.text);

    if (authViewModel.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authViewModel.errorMessage!)),
      );
    } else {
      Navigator.of(context).pushReplacementNamed('/ecom');  // Navigate to home or login screen
    }
  }

  @override
  Widget build(BuildContext context) {
    //On garantit que votre interface utilisateur sera mise à jour en fonction des changements dans le ViewModel.
    return Consumer<AuthenticationViewModel>(
      builder: (context, authViewModel, _) {
        // Vérifiez si l'utilisateur est déjà connecté
        if (authViewModel.isLoggedIn) {
          // Redirection vers la page d'accueil si connecté
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed('/home');
          });
          return Container(); // Retourner un conteneur vide pour éviter le rendu du reste de l'interface
        }
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
        Color.fromARGB(255, 104, 98, 86),
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

                // logo
                const Icon(
                  Icons.lock_outlined,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Bienvenue sur Halal place ! \n Accédez à votre espace personnel en un clic.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap: () => login(context),
                  text: 'Connexion',
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(imagePath: 'assets/images/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'assets/images/apple.png')
                  ],
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
      onTap: () {
         Navigator.of(context).pushReplacementNamed('/register');
      },
                    child : const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  
                )
              ],
            ),
            ],
          ),
        ),
      ),
      )
    )
    );
  });
}}