import 'package:fitcel/services/backend/backend.dart';
import 'package:fitcel/services/backend/celebs.dart';
import 'package:fitcel/widgets/common/plan_card.dart';
import 'package:fitcel/widgets/common/title_text.dart';
import 'package:flutter/material.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  late Future<List<Celebrity>> celebs;

  @override
  void initState() {
    super.initState();
    celebs = Backend().getCelebs();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text: "Explore Plans"),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FutureBuilder<List<Celebrity>>(
              future: celebs,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 3
                          : 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, i) =>
                        PlanCard(celeb: snapshot.data![i]),
                    itemCount: snapshot.data!.length,
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
