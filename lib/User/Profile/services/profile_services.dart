import 'package:eternal_tie/Auth/UserProvider.dart';
import 'package:eternal_tie/Auth/auth_pages/auth_login.dart';
import 'package:eternal_tie/Models/user.dart';
import 'package:eternal_tie/Utility/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileServices {
  void UserSignOut(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('x-auth-token', '');
      Provider.of<UserProvider>(context, listen: false).setUser(
        User(
          username: '',
          password: '',
          token: '',
        ),
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthLogin.routename,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
