import 'package:fitcel/constants.dart';
import 'package:flutter/material.dart';

const String titleText = "Get Red Carpet Ready with Fitcel";
const String descText =
    "Get fit like a celebrity with our app! Access the fitness and diet plans of your favorite stars and achieve your health goals. Choose from a variety of plans, save your favorites, and track your progress.";

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(myPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Positioned(
              top: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    titleText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    descText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              child: Image(image: AssetImage("assets/images/start_img.png")),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        backgroundColor: mainButtonColor,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.all(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Let's Start",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        Icon(Icons.arrow_right_alt),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
