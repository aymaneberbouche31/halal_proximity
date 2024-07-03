import 'package:flutter/material.dart';
import 'package:halal_proximity/views/ecommerce.dart';
import 'package:halal_proximity/views/register_screen.dart';
import 'package:halal_proximity/views/splash_screen.dart';
import 'package:halal_proximity/views/login_screen.dart';
import 'package:halal_proximity/views/home_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/ecom':
      return MaterialPageRoute(builder: (_) => Ecommerce());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
