import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitcel/constants.dart';
import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
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
    );
  }
}
