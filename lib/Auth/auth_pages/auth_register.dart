import 'package:eternal_tie/Auth/Services/auth_login_services.dart';
import 'package:eternal_tie/Auth/auth_pages/auth_login.dart';
import 'package:eternal_tie/Utility/snackbar.dart';
import 'package:flutter/material.dart';

class AuthRegister extends StatefulWidget {
  static const String routename = '/authregister';
  const AuthRegister({super.key});

  @override
  State<AuthRegister> createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmcontroller = TextEditingController();
  AuthLoginServices authLoginServices = AuthLoginServices();
  bool show = true;
  bool show1 = true;

  bool isEmailValid(String email) {
    var Reg = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+(\.[a-zA-Z]+)?$';
    RegExp regex = RegExp(Reg);
    return regex.hasMatch(email);
  }

  bool isPasswordMatch(String password) {
    var reg = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
    RegExp regex = RegExp(reg);
    return regex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/login_header.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.41,
                          child: TextFormField(
                            controller: firstname,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 157, 121, 121),
                                  width: 2,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.all(8).copyWith(left: 10),
                              filled: true,
                              labelText: 'First Name',
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter First Name';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.41,
                          child: TextFormField(
                            controller: lastName,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.all(8).copyWith(left: 10),
                              filled: true,
                              labelText: 'last Name',
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter First Name';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailcontroller,
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
                        hintText: 'Enter Your Email Address',
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Email Address';
                        } else if (!isEmailValid(value)) {
                          return 'Please Enter Valid Email Address';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: confirmcontroller,
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
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'By signing up, I agree with the ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms of Use ',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                            text: '& ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy ',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.blue,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          )),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          firstname.text = '';
                          lastName.text = '';

                          emailcontroller.text = '';
                          passwordcontroller.text = '';
                          confirmcontroller.text = '';
                          showSnackBar(context, 'Register Successful');
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AuthLogin.routename,
                            (route) => false,
                          );
                        }
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AuthLogin.routename,
                          (route) => false,
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an Account? ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'Log In',
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          authLoginServices.googleSignIn(context);
                        },
                        child: Image.asset(
                          'assets/images/google.png',
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
