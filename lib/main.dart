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
  final previousCheck = Provider.debugCheckInvalidValueType = null;
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);


AuthenticationService _authenticationService = AuthenticationService();

  runApp(MultiProvider(
  providers: [
    Provider<AuthenticationViewModel>(create: (_) => AuthenticationViewModel(_authenticationService)),
  ],
  child: const MyApp(),
));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthenticationViewModel>(context);
    return ChangeNotifierProvider(
      create: (context)=>Cart(),
      builder: (context, child)=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
      localizationsDelegates: TrDelegate(path: 'assets/translations/').toList(), // Inclus le TrDelegate avec le chemin des fichiers JSON
      locale: const Locale('fr', 'FR'), 
        supportedLocales: const [
          Locale('fr'),
      ],
        initialRoute: authViewModel.isLoggedIn ? '/home' : '/login',
        onGenerateRoute: AppRouter.generateRoute,
      )
    );
  }
}