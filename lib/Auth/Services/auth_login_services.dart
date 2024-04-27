import 'dart:convert';

import 'package:eternal_tie/Auth/UserProvider.dart';
import 'package:eternal_tie/Auth/auth_pages/auth_login.dart';
import 'package:eternal_tie/Auth/auth_pages/change_Password.dart';
import 'package:eternal_tie/Auth/auth_pages/otp_screen.dart';
import 'package:eternal_tie/Models/user.dart';
import 'package:eternal_tie/User/Home/screens/Bottom_Nav_Screen.dart';
import 'package:eternal_tie/Utility/snackbar.dart';
import 'package:eternal_tie/common/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLoginServices {
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      await googleSignIn.signIn();
      GoogleSignInAccount user = googleSignIn.currentUser!;

      if (user.email.isNotEmpty) {
        Navigator.pushNamed(
          context,
          BottomNavBar.routename,
        );
      } else {
        showSnackBar(context, 'try again');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  SignUpUser(BuildContext context, String email, String password) async {
    try {
      email = email.trim();
      password = password.trim();

      var user = User(
        username: email,
        password: password,
      );

      var res = await http.post(
        Uri.parse('$url/api/auth/signup'),
        body: user.toMap(),
      );

      if (res.statusCode != 201) {
        showSnackBar(context, jsonDecode(res.body)['error']);
      }

      if (res.statusCode == 201) {
        showSnackBar(context, 'User Created Successfully');

        Navigator.pushNamedAndRemoveUntil(
          context,
          AuthLogin.routename,
          (route) => false,
        );
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  SignInUser(BuildContext context, String email, String password) async {
    try {
      email = email.trim();
      password = password.trim();

      var user = User(
        username: email,
        password: password,
      );

      var res = await http.post(
        Uri.parse('$url/api/auth/login'),
        body: user.toMap(),
      );

      if (res.statusCode != 200) {
        showSnackBar(context, jsonDecode(res.body)['error']);
      }

      if (res.statusCode == 200) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        Provider.of<UserProvider>(context, listen: false).setUser(
          User(
            username: email,
            password: password,
            token: jsonDecode(res.body)['token'],
          ),
        );
        await pref.setString('x-auth-token', jsonDecode(res.body)['token']);

        showSnackBar(context, 'User Login Successfully');

        Navigator.pushNamedAndRemoveUntil(
          context,
          BottomNavBar.routename,
          (route) => false,
        );
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  GetUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = await prefs.getString('x-auth-token');
      if (token == null) {
        return;
      }

      var res = await http.post(
        Uri.parse('$url/api/auth/tokenisvalid'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );
      if (res.statusCode != 200) {
        prefs.setString('x-auth-token', '');
        // showSnackBar(context, jsonDecode(res.body)['error']);
      } else {
        Provider.of<UserProvider>(context, listen: false).setUser(
          User(
            username: jsonDecode(res.body)['username'],
            password: jsonDecode(res.body)['password'],
            token: token,
          ),
        );
        Navigator.pushNamedAndRemoveUntil(
          context,
          BottomNavBar.routename,
          (route) => false,
        );
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  sendOtp(BuildContext context, String email) async {
    try {
      var res = await http.post(
        Uri.parse('$url/api/mail/otp'),
        body: {
          'email': email,
        },
      );

      if (res.statusCode != 200) {
        showSnackBar(context, jsonDecode(res.body)['error']);
      } else {
        Navigator.pushNamed(context, OtpScreen.routename, arguments: {
          'email': email,
        });
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  validateOtp(BuildContext context, String otp, String email) async {
    try {
      var res = await http.post(Uri.parse('$url/api/mail/validateOtp'), body: {
        'email': email,
        'otp': otp,
      });

      if (res.statusCode != 200) {
        showSnackBar(context, jsonDecode(res.body)['error']);
      } else {
        Navigator.pushNamed(context, ChangePassword.routename, arguments: {
          'email': email,
        });
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  changePassword(BuildContext context, String newPassword, String email) async {
    try {
      var res =
          await http.post(Uri.parse('$url/api/mail/changePassword'), body: {
        'email': email,
        'password': newPassword,
      });

      if (res.statusCode != 200) {
        showSnackBar(context, jsonDecode(res.body)['error']);
      } else {
        showSnackBar(context, 'Password Changed Successfully');
        Navigator.pushNamedAndRemoveUntil(
          context,
          AuthLogin.routename,
          (route) => false,
        );
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
