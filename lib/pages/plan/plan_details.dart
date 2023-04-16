import 'package:fitcel/constants.dart';
import 'package:fitcel/services/backend/backend.dart';
import 'package:fitcel/services/backend/celebs.dart';
import 'package:fitcel/services/backend/diet.dart';
import 'package:fitcel/widgets/common/plan_card.dart';
import 'package:fitcel/widgets/common/title_text.dart';
import 'package:fitcel/widgets/home/section_header.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class PlanDetails extends StatefulWidget {
  final int celebId;
  const PlanDetails({
    Key? key,
    required this.celebId,
  }) : super(key: key);

  @override
  State<PlanDetails> createState() => _PlanDetailsState();
}

class _PlanDetailsState extends State<PlanDetails> {
  late Future<Celebrity> celebDetails;
  late Future<Diet> celebDiet;
  @override
  void initState() {
    super.initState();
    celebDetails = Backend().getCeleb(id: widget.celebId.toString());
    celebDiet = Backend().getCelebDiet(id: widget.celebId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(text: "Meal Plan"),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.45,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: FutureBuilder(
                  future: celebDetails,
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return PlanCard(data: snapshot.data!);
                    } else if (snapshot.hasError) {
                      return const PlanCard(
                          data: Celebrity(
                              id: 0,
                              name: "",
                              avatar: "",
                              dietType: "Beginner"));
                    }
                    return const CircularProgressIndicator();
                  }),
              // child: PlanCard(
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder(
                  future: celebDiet,
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: snapshot.data!.meals.length,
                        itemBuilder: (context, mealIndex) {
                          return StickyHeader(
                            header: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: prColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                child: SectionHeader(
                                    text:
                                        snapshot.data!.meals[mealIndex].name)),
                            content: ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  snapshot.data!.meals[mealIndex].foods.length,
                              itemBuilder: (context, foodIndex) {
                                return ListTile(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: Text(snapshot.data!.meals[mealIndex]
                                      .foods[foodIndex].name),
                                  trailing: Text(
                                      "${snapshot.data!.meals[mealIndex].foods[foodIndex].calories}/100g"),
                                  // trailing: const Text("10cal/100g"),
                                );
                              },
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const LinearProgressIndicator();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
