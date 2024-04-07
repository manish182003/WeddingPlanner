import 'package:eternal_tie/Auth/auth_pages/auth_login.dart';
import 'package:eternal_tie/Auth/auth_pages/auth_register.dart';
import 'package:eternal_tie/Auth/splash/splash_screen.dart';
import 'package:eternal_tie/Home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routename:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );

    case AuthLogin.routename:
      return MaterialPageRoute(
        builder: (context) => const AuthLogin(),
      );

    case HomeScreen.routename:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    case AuthRegister.routename:
      return MaterialPageRoute(
        builder: (context) => const AuthRegister(),
      );
    default:
      return MaterialPageRoute(builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text('Something Went Wrong'),
          ),
        );
      });
  }
}
