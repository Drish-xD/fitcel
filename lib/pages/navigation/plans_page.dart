import 'package:fitcel/widgets/plan_card.dart';
import 'package:fitcel/widgets/title_text.dart';
import 'package:flutter/material.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleText(text: "Explore Plans"),
            ],
          ),
          const PlanCard(),
        ],
      ),
    );
  }
}
