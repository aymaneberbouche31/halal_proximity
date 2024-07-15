import 'package:flutter/material.dart';
import 'package:halal_proximity/views/login_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextForm Controller
  TextEditingController emailController = TextEditingController();

  // Form Validation
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _validateAndSubmit() {
    if (_validateAndSave()) {
      // TODO: Perform sign-up logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Dégradé de couleurs
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 109, 168, 169),
            Color.fromARGB(255, 166, 168, 159),
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
      child: Scaffold(
        backgroundColor: Colors.transparent, // Rendre le fond transparent pour voir le dégradé
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent, // Rendre l'AppBar transparent
          elevation: 0, // Retirer l'ombre de l'AppBar
          title: const Icon(
            Icons.arrow_back, // Icône flèche arrière
            size: 30, // Taille de l'icône
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Trouvez votre compte',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Saisissez votre adresse e-mail ou votre nom d'utilisateur",
                style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: "Poppins-Medium"),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (value) => emailController.text = value!,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _validateAndSubmit,
                        child: const Text('Envoyer'),
                      ),
                      const SizedBox(height: 16.0),
                      Center(
                        child: GestureDetector(
                          onTap: _navigateToSignIn,
                          child: RichText(
                            text: const TextSpan(
                              text: 'Déjà un compte? ',
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Se connecter',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Goto SignUp Page
  void _navigateToSignIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
