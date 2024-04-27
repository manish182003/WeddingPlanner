import 'package:eternal_tie/Admin/Vendors/screens/vendor_create.dart';
import 'package:eternal_tie/Auth/Services/auth_login_services.dart';
import 'package:eternal_tie/Auth/UserProvider.dart';
import 'package:eternal_tie/Auth/auth_pages/auth_login.dart';
import 'package:eternal_tie/User/Home/screens/Bottom_Nav_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routename = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  AuthLoginServices authServices = AuthLoginServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    ));

    animationController.forward();
    var user = Provider.of<UserProvider>(context, listen: false).user;

    Future.delayed(
      const Duration(seconds: 3),
      () {
        authServices.GetUserData(context);
        Navigator.pushNamedAndRemoveUntil(
          context,
          user.token.isEmpty ? AuthLogin.routename : BottomNavBar.routename,
          (route) => false,
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 116, 164, 188),
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Color(0xFF007FFF),
            //     Color(0xFFADD8E6),
            //   ],
            // ),
            ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: animation.value,
                        child: const Image(
                          image: AssetImage('assets/images/splash.png'),
                          width: 400,
                          height: 140,
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return Opacity(
                        opacity: animation.value,
                        child: const Center(
                          child: Text(
                            'EternalTie',
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Roboto',
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  FlutterLogo(
                    size: 50,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Created With',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Flutter & Dart',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
