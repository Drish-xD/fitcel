import 'package:fitcel/widgets/common/plan_card.dart';
import 'package:fitcel/widgets/common/title_text.dart';
import 'package:flutter/material.dart';

class PlansPage extends StatefulWidget {
  PlansPage({Key? key}) : super(key: key);

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  // late Future plansList;
  final List items = [
    {"name": "Deepika", 'fav': true, 'dType': "Intense", 'wType': "Intense"},
    {"name": "Priyanka", 'fav': true, 'dType': "Intense", 'wType': "Intense"},
    {
      "name": "Hritik Roshan",
      'fav': true,
      'dType': "Intense",
      'wType': "Intense"
    },
    {"name": "Jonny", 'fav': true, 'dType': "Extreme", 'wType': "Extreme"}
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   plansList = BaseClient().getPlans();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text: "Explore Plans"),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, i) => PlanCard(data: items[i]),
              itemCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}
