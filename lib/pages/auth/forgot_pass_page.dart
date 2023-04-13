import 'package:fitcel/constants.dart';
import 'package:fitcel/widgets/my_button.dart';
import 'package:fitcel/widgets/my_textfield.dart';
import 'package:fitcel/widgets/title_text.dart';
import 'package:flutter/material.dart';

class ForgotPassPage extends StatelessWidget {
  ForgotPassPage({Key? key}) : super(key: key);
  final emailController = TextEditingController();

  void forgotPassword() {}
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

                const SizedBox(height: 10),
                // description text
                const Text(
                  "Enter your E-mail to reset your password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 100),

                // Filler Image
                const Image(
                  image: AssetImage("assets/images/forgot.png"),
                  alignment: AlignmentDirectional.center,
                  fit: BoxFit.cover,
                  height: 220,
                ),

                // Login Form
                Form(
                  child: Column(
                    children: [
                      // Username field
                      MyTextfield(
                        controller: emailController,
                        hintText: "Email",
                        obscureText: false,
                      ),
                      const SizedBox(height: 30),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        child: MyButton(
                          onTap: forgotPassword,
                          text: "Reset",
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
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
          text: "Reset Password",
          size: 35,
        ),
      ],
    );
  }
}
