import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitcel/constants.dart';
import 'package:fitcel/widgets/my_button.dart';
import 'package:fitcel/widgets/my_textfield.dart';
import 'package:fitcel/widgets/title_text.dart';
import 'package:flutter/material.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({Key? key}) : super(key: key);

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  final emailController = TextEditingController();

  // Forgot send mail functions
  void forgotPassword() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      if (context.mounted) Navigator.pop(context);
      showMessage("Reset link send to your E-Mail.", true);
    } catch (e) {
      Navigator.pop(context);
      showMessage("No User exist with this E-Mail", false);
    }
  }

  void showMessage(String msg, bool success) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.topCenter,
          backgroundColor: success == true
              ? Colors.greenAccent.withOpacity(0.6)
              : Colors.redAccent.withOpacity(0.6),
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
