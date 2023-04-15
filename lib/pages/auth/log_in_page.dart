import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitcel/auth_service.dart';
import 'package:fitcel/constants.dart';
import 'package:fitcel/pages/auth/forgot_pass_page.dart';
import 'package:fitcel/pages/auth/sign_up_page.dart';
import 'package:fitcel/widgets/google_btn.dart';
import 'package:fitcel/widgets/my_button.dart';
import 'package:fitcel/widgets/my_textfield.dart';
import 'package:fitcel/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  // textField controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // LogIn Method
  void logInUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print("logged IN");
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        showErrorMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showErrorMessage('Wrong password provided for that user.');
      }
    }
  }

// show Error Message
  void showErrorMessage(String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.topCenter,
          backgroundColor: Colors.redAccent.withOpacity(0.6),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          content: Text(
            msg,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: myPadding),
            child: Column(
              children: [
                // Page header with back button
                pageHeader(context),
                const SizedBox(height: 20),

                // description text
                const Text(
                  "Log in with one of the following options.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 30),

                // Login Form
                Form(
                  child: Column(
                    children: [
                      // Email field
                      MyTextfield(
                        controller: emailController,
                        hintText: "Email",
                        obscureText: false,
                      ),
                      const SizedBox(height: 15),

                      // Password Field
                      MyTextfield(
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: true,
                      ),

                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  opaque: true,
                                  duration: const Duration(milliseconds: 500),
                                  isIos: true,
                                  type: PageTransitionType.rightToLeftWithFade,
                                  // Route this page to forgetPassPage
                                  child: ForgotPassPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Forget Password?",
                              style: TextStyle(fontSize: 14),
                            )),
                      ),

                      const SizedBox(height: 20),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        child: MyButton(
                          onTap: logInUser,
                          text: "Login",
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                //  divider
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "or continue with",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                // login with google or apple
                GoogleBtn(
                  imgPath: "assets/images/google-logo.png",
                  txt: "Login",
                  onTap: () => AuthService().signInWithGoogle(),
                ),
                const SizedBox(height: 50),

                // sign up page route
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",
                        style: TextStyle(fontSize: 16)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            opaque: true,
                            duration: const Duration(milliseconds: 500),
                            isIos: true,
                            type: PageTransitionType.rightToLeft,
                            child: const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Page Header here
  Row pageHeader(BuildContext context) {
    return Row(
      children: [
        Center(
          child: Ink(
            decoration: const ShapeDecoration(
              color: Colors.white12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              iconSize: 25,
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        TitleText(
          text: "Log In",
          size: 40,
        ),
      ],
    );
  }
}
