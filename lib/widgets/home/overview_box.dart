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
          SectionHeader(text: "Overview"),
          const SizedBox(height: 10),
          Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: prColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12)),
              child: const Text("ndcncjnd ")),
        ],
      ),
    );
  }
}
