import 'package:flutter/material.dart';

import 'package:eternal_tie/Auth/Services/auth_login_services.dart';
import 'package:eternal_tie/Auth/auth_pages/change_Password.dart';
import 'package:eternal_tie/Utility/snackbar.dart';

class OtpScreen extends StatefulWidget {
  static const String routename = '/otp-screen';
  final String email;
  const OtpScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();
  AuthLoginServices loginServices = AuthLoginServices();

  @override
  void dispose() {
    // TODO: implement dispose

    otp1.dispose();
    otp2.dispose();
    otp3.dispose();

    otp4.dispose();

    otp5.dispose();
    otp6.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customotpfield(
                    controller: otp1,
                  ),
                  customotpfield(
                    controller: otp2,
                  ),
                  customotpfield(
                    controller: otp3,
                  ),
                  customotpfield(
                    controller: otp4,
                  ),
                  customotpfield(
                    controller: otp5,
                  ),
                  customotpfield(
                    controller: otp6,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String otp =
                        '${otp1.text}${otp2.text}${otp3.text}${otp4.text}${otp5.text}${otp6.text}';

                    loginServices.validateOtp(context, otp, widget.email);
                    otp1.text = '';
                    otp2.text = '';
                    otp3.text = '';
                    otp4.text = '';
                    otp5.text = '';
                    otp6.text = '';
                  } else {
                    showSnackBar(context, 'All fields are Required');
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Create New Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class customotpfield extends StatelessWidget {
  TextEditingController controller;
  customotpfield({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 120,
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counter: Offstage(), // Hide the counter
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          }
        },
      ),
    );
  }
}
