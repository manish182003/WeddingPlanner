import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:eternal_tie/Auth/Services/auth_login_services.dart';

class ChangePassword extends StatefulWidget {
  static const String routename = '/change-password';
  final String email;
  const ChangePassword({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmcontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  AuthLoginServices authLoginServices = AuthLoginServices();
  bool show = true;
  bool show1 = true;

  bool isPasswordMatch(String password) {
    var reg = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
    RegExp regex = RegExp(reg);
    return regex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: passwordcontroller,
                obscureText: show,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  filled: true,
                  hintText: 'Enter Your Password',
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_open_outlined,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    icon: Icon(
                      show ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Password';
                  } else if (!isPasswordMatch(value)) {
                    return 'Password Should be of length 8 and must contain atleast one number,symbol and alphabet';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: confirmcontroller,
                obscureText: show1,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  filled: true,
                  hintText: 'Confirm Your Password',
                  labelText: 'Confirm Password',
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_open_outlined,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        show1 = !show1;
                      });
                    },
                    icon: Icon(
                      show1 ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Confirm Password';
                  } else if (!isPasswordMatch(value)) {
                    return 'Password Should be of length 8 and must contain atleast one number,symbol and alphabet';
                  } else if (confirmcontroller.text !=
                      passwordcontroller.text) {
                    return 'Password and Confirm Password Should be Same';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    )),
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    if (passwordcontroller.text == confirmcontroller.text) {
                      authLoginServices.changePassword(
                        context,
                        passwordcontroller.text,
                        widget.email,
                      );
                    }

                    passwordcontroller.text = '';
                    confirmcontroller.text = '';
                  }
                },
                child: const Text(
                  'Change Your Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
