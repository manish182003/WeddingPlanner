import 'package:eternal_tie/Auth/splash/splash_screen.dart';
import 'package:eternal_tie/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => getRoute(settings),
      home: const SplashScreen(),
    );
  }
}
