import 'package:fitcel/constants.dart';
import 'package:fitcel/widgets/title_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(text: "Hi Name"),
                IconButton(
                  icon: const Icon(Icons.search_rounded),
                  color: txtColor,
                  iconSize: 35,
                  onPressed: () {},
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: prColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12)),
              child: Text("ndcncjnd ")),
        ],
      ),
    );
  }
}
