import 'package:card_swiper/card_swiper.dart';
import 'package:fitcel/services/celebs.dart';
import 'package:fitcel/widgets/home/section_header.dart';
import 'package:fitcel/widgets/plan_card.dart';
import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  final String secHeader;
  final List<Celebrity> plansList;

  const CardSlider({Key? key, required this.secHeader, required this.plansList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SectionHeader(text: secHeader),
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.width * 0.7,
          child: Swiper(
            itemBuilder: (BuildContext context, int i) =>
                PlanCard(data: plansList[i], fav: true),
            itemCount: plansList.length,
            viewportFraction: 0.8,
            scale: 0.8,
            loop: false,
          ),
        ),
      ],
    );
  }
}
