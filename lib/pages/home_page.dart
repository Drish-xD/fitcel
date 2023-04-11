import 'package:fitcel/constants.dart';
import 'package:fitcel/widgets/home/card_slider.dart';
import 'package:fitcel/widgets/home/overview_box.dart';
import 'package:fitcel/widgets/title_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(text: "Hi Name"),
                  IconButton(
                    icon: const Icon(Icons.search_rounded),
                    color: txtColor,
                    iconSize: 35,
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const OverviewBox(),
            const SizedBox(height: 30),
            const CardSlider(),
            const SizedBox(height: 30),
            const CardSlider(),
          ],
        ),
      ),
    );
  }
}
