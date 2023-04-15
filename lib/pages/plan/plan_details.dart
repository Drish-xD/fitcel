import 'package:fitcel/constants.dart';
import 'package:fitcel/services/celebs.dart';
import 'package:fitcel/widgets/common/plan_card.dart';
import 'package:fitcel/widgets/common/title_text.dart';
import 'package:fitcel/widgets/home/section_header.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class PlanDetails extends StatelessWidget {
  final int celebId;
  const PlanDetails({
    Key? key,
    required this.celebId,
  }) : super(key: key);

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
              child: const PlanCard(
                  data: Celebrity(
                      id: 0, name: "Deepika", avatar: "", dietype: "Beginner")),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: 6,
                itemBuilder: (BuildContext context, index) {
                  return StickyHeader(
                    header: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: prColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: SectionHeader(text: "Breakfast")),
                    content: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: Text("Meal $index"),
                          trailing: const Text("10cal/100g"),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
