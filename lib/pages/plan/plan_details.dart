import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitcel/constants.dart';
import 'package:fitcel/services/backend/backend.dart';
import 'package:fitcel/services/backend/celebs.dart';
import 'package:fitcel/services/backend/diet.dart';
import 'package:fitcel/widgets/common/plan_card.dart';
import 'package:fitcel/widgets/common/my_button.dart';
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
  final User? user = FirebaseAuth.instance.currentUser;
  late Future<Celebrity> celebDetails;
  late Future<Diet> celebDiet;
  String activatePlan = "Activate Plan";
  @override
  void initState() {
    super.initState();
    celebDetails = Backend().getCeleb(id: widget.celebId.toString());
    celebDiet = Backend().getCelebDiet(id: widget.celebId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: celebDetails,
        builder: (_, celebDetails) {
          if (celebDetails.hasData) {
            return FutureBuilder(
                future: celebDiet,
                builder: (_, celebDiet) {
                  if (celebDiet.hasData) {
                    return Scaffold(
                      body: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleText(text: "Meal Plan"),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width * 0.45,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: PlanCard(celeb: celebDetails.data!),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                                child: ListView.builder(
                              padding: const EdgeInsets.all(20),
                              itemCount: celebDiet.data!.meals.length,
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
                                          text: celebDiet
                                              .data!.meals[mealIndex].name)),
                                  content: ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: celebDiet
                                        .data!.meals[mealIndex].foods.length,
                                    itemBuilder: (context, foodIndex) {
                                      return ListTile(
                                        shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        title: Text(celebDiet
                                            .data!
                                            .meals[mealIndex]
                                            .foods[foodIndex]
                                            .name),
                                        trailing: Text(
                                            "${celebDiet.data!.meals[mealIndex].foods[foodIndex].calories}/100g"),
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                          ],
                        ),
                      ),
                      bottomNavigationBar: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                        child: MyButton(
                            onTap: () async {
                              bool resp = await Backend().updateUser(
                                  uuid: user!.uid,
                                  dietID: celebDiet.data!.id.toString());
                              if (resp) {
                                setState(() {
                                  activatePlan = "Plan Activated";
                                });
                              }
                            },
                            text: activatePlan),
                      ),
                    );
                  } else if (celebDiet.hasError) {
                    return Text("${celebDiet.error}");
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                });
          } else if (celebDetails.hasError) {
            return const PlanCard(
                celeb: Celebrity(
                    id: 0, name: "", avatar: "", dietType: "Beginner"));
          }
          return const SizedBox();
        });
  }
}
