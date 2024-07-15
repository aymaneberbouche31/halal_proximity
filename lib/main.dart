import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:halal_proximity/models/cart.dart';
import 'package:halal_proximity/viewmodels/authentification_viewmodel.dart';
import 'package:halal_proximity/views/splash_screen.dart';
import 'package:provider/provider.dart';
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
  child: MyApp(),
));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>Cart(),
      builder: (context, child)=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
      )
    );
  }
}
