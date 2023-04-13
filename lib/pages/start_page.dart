import 'package:fitcel/constants.dart';
import 'package:fitcel/pages/auth/log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String titleText = "Get Red Carpet Ready with Fitcel";
    const String descText =
        "Get fit like a celebrity with our app! Access the fitness and diet plans of your favorite stars and achieve your health goals. Choose from a variety of plans, save your favorites, and track your progress.";

    return Scaffold(
      body: SafeArea(
        child: Padding(
          // Side Padding for the screen
          padding: const EdgeInsets.symmetric(horizontal: myPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Main Text of the sceen
              Column(
                children: [
                  const Text(
                    titleText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        wordSpacing: 1,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    descText,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),

              // Image and Button
              Column(
                children: [
                  const Image(
                    image: AssetImage("assets/images/start_img.png"),
                    alignment: AlignmentDirectional.center,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                  const SizedBox(height: 10),
                  mainButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// Main Button
  Row mainButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                    opaque: true,
                    duration: const Duration(milliseconds: 500),
                    isIos: true,
                    type: PageTransitionType.rightToLeftWithFade,
                    child: LogInPage()),
              );
            },
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Let's Start",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Icon(Icons.east_rounded, size: 25),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
