import 'package:eternal_tie/Auth/auth_pages/auth_login.dart';
import 'package:eternal_tie/Auth/auth_pages/auth_register.dart';
import 'package:eternal_tie/Auth/splash/splash_screen.dart';
import 'package:eternal_tie/Home/screens/Bottom_Nav_Screen.dart';
import 'package:eternal_tie/Home/screens/SearchScreen.dart';
import 'package:eternal_tie/Home/screens/all_Venue.dart';
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

    case AllVenuesScreen.routename:
      return MaterialPageRoute(
        builder: (context) => const AllVenuesScreen(),
      );

    case SearchScreen.routename:
      return MaterialPageRoute(
        builder: (context) => const SearchScreen(),
      );

    case BottomNavBar.routename:
      return MaterialPageRoute(
        builder: (context) => const BottomNavBar(),
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
