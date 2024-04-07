import 'package:eternal_tie/Home/screens/home_screen.dart';
import 'package:eternal_tie/Utility/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthLoginServices {
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]);
    try {
      await googleSignIn.signIn();
      GoogleSignInAccount user = googleSignIn.currentUser!;

      if (user.email.isNotEmpty) {
        Navigator.pushNamed(
          context,
          HomeScreen.routename,
        );
      } else {
        showSnackBar(context, 'try again');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
