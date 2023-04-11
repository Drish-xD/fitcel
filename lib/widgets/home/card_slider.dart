import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitcel/constants.dart';
import 'package:fitcel/widgets/section_header.dart';
import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  final String secHeader;
  final List<String> plansList;

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
        CarouselSlider(
          options: CarouselOptions(
              height: 200.0,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              disableCenter: true),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 200,
                    decoration: const BoxDecoration(color: prColor),
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
