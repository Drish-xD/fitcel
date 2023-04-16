import 'package:card_swiper/card_swiper.dart';
import 'package:fitcel/constants.dart';
import 'package:fitcel/widgets/home/section_header.dart';
import 'package:flutter/material.dart';

class OverviewBox extends StatelessWidget {
  const OverviewBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: SectionHeader(
            text: "Transform your body like the stars.",
            color: Colors.black,
          )),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: prColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12)),
            child: Swiper(
              itemBuilder: (BuildContext context, int i) => Image.asset(
                "assets/images/banner${i + 1}.jpg",
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
              itemCount: 3,
              loop: false,
              pagination: const SwiperPagination(),
            ),
          ),
        ],
      ),
    );
  }
}
