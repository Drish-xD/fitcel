import 'package:fitcel/constants.dart';
import 'package:fitcel/widgets/my_button.dart';
import 'package:fitcel/widgets/my_textfield.dart';
import 'package:fitcel/widgets/square_btn.dart';
import 'package:fitcel/widgets/title_text.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // SignUp Method
  void signUpUser() {}

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
                        controller: passwordController,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    SquareBtn(imgPath: "assets/images/google-logo.png"),
                    SquareBtn(imgPath: "assets/images/apple-logo.png"),
                  ],
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
