import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:halal_proximity/models/cart.dart';
import 'package:halal_proximity/viewmodels/authentification_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:tr_extension/tr_extension.dart';
import 'core/router.dart';
import 'firebase_options.dart';
import 'services/authentification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AuthenticationService authenticationService = AuthenticationService();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationViewModel>(
          create: (_) => AuthenticationViewModel(authenticationService),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

//Un StatefulWidget est utilisé lorsque le widget doit maintenir un état mutable.
// Ici, MyApp doit réagir aux changements d'état (comme les changements d'authentification).
class MyApp extends StatefulWidget {
  const MyApp({super.key});

//Retourne une instance de _MyAppState, une classe privée qui gère l'état mutable du widget.
  @override
  State<MyApp> createState() => _MyAppState();
}

//Ici on gère l'etat dynamique de MyApp
class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

//Méthode appelée une seule fois au moment de la création de ce widget.
  @override
  void initState() {
    super.initState();
    // On écoutera les changements d'état d'authentification
    _initializeAuthListener();
  }

  void _initializeAuthListener() {
    final authViewModel = Provider.of<AuthenticationViewModel>(context, listen: false);

    // Écoute des changements d'état d'authentification
    authViewModel.authenticationService.listenToAuthStateChanges((user) {
      if (user == null) {
        // Utilisateur non connecté, rediriger vers la page de login
        _navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) => false);
      } else {
        // Vérifie si le token est révoqué
        authViewModel.authenticationService.checkTokenRevocation(
          () async {
            // Si révoqué, déconnecter l'utilisateur
            await authViewModel.signOut(); // Déconnecte l'utilisateur via Firebase
            _navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) => false);
          },
          () {
            // Si valide, rediriger vers la page home
            _navigatorKey.currentState?.pushNamedAndRemoveUntil('/home', (route) => false);
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthenticationViewModel>(context);

    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: TrDelegate(path: 'assets/translations/').toList(),
        locale: const Locale('fr', 'FR'),
        supportedLocales: const [Locale('fr')],
        navigatorKey: _navigatorKey,  // Utilisation du NavigatorKey ici
        initialRoute: authViewModel.isLoggedIn ? '/home' : '/login',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
