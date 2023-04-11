import 'package:fitcel/constants.dart';
import 'package:fitcel/widgets/home/card_slider.dart';
import 'package:fitcel/widgets/home/overview_box.dart';
import 'package:fitcel/widgets/title_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Main Header of the Home Page
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleText(text: "Hi Name"),
              Row(
                children: const [
                  Icon(
                    Icons.sports_gymnastics_rounded,
                    color: txtColor,
                    size: 30,
                  ),
                  Padding(padding: EdgeInsetsDirectional.only(end: 20))
                ],
              ),
            ],
          ),

          // OverView Box top of the page or a quote
          const OverviewBox(),
          const SizedBox(height: 30),

          // Top Workouts plans slider
          const CardSlider(
            secHeader: 'Top Workout Plans',
            plansList: [],
          ),
          const SizedBox(height: 30),

          // Top Diet plans slider
          const CardSlider(
            secHeader: "Top Diet Plans",
            plansList: [],
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
