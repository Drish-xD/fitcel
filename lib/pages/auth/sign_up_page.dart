import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitcel/constants.dart';
import 'package:fitcel/widgets/google_btn.dart';
import 'package:fitcel/widgets/my_button.dart';
import 'package:fitcel/widgets/my_textfield.dart';
import 'package:fitcel/widgets/title_text.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // textField controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // SignUp Method
  void signUpUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (passwordController.text == confirmPasswordController.text) {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        if (context.mounted) Navigator.pop(context);
        showErrorMessage('Passwords don\'t match');
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'weak-password') {
        showErrorMessage('Td is too weahe password providek.');
      } else if (e.code == 'email-already-in-use') {
        showErrorMessage('The account already exists for that email.');
      }
    } catch (e) {
      showErrorMessage(e.toString());
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
                  "Sign Up with one of the following options.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 30),

                // Sign Up Form
                Form(
                  child: Column(
                    children: [
                      MyTextfield(
                        controller: emailController,
                        hintText: "Email",
                        obscureText: false,
                      ),
                      const SizedBox(height: 15),
                      MyTextfield(
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: true,
                      ),
                      const SizedBox(height: 15),
                      MyTextfield(
                        controller: confirmPasswordController,
                        hintText: "Confirm Password",
                        obscureText: true,
                      ),
                      const SizedBox(height: 30),

                      // SignUp Button

                      SizedBox(
                        width: double.infinity,
                        child: MyButton(
                          onTap: signUpUser,
                          text: "Create Account",
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

                // SignUp with google or apple
                const GoogleBtn(
                  imgPath: "assets/images/google-logo.png",
                  txt: "Signup",
                ),
                const SizedBox(height: 50),

                // login page route
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(fontSize: 14)),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

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
          text: "Sign Up",
          size: 40,
        ),
      ],
    );
  }
}
