import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitcel/widgets/common/my_button.dart';
import 'package:fitcel/widgets/common/plan_card.dart';
import 'package:fitcel/widgets/common/title_text.dart';
import 'package:fitcel/widgets/home/section_header.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text: "Profile"),
          // Profile Image
          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: (user?.photoURL) != null
                  ? NetworkImage((user?.photoURL).toString()) as ImageProvider
                  : const AssetImage("assets/images/user.png"),
            ),
          ),

          const SizedBox(height: 20),

          // Users Name

          (user?.displayName) != null
              ? Center(
                  child: Text(
                    (user?.displayName).toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : const SizedBox(),

          const SizedBox(height: 10),
          // Users Email
          Center(
            child: Text(
              (user?.email).toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 50),
          // Current Plans stats
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SectionHeader(text: "Current Plan"),
          ),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.55,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const PlanCard(
              data: {
                "name": "Deepika",
                'fav': true,
                'dType': "Intense",
                'wType': "Intense"
              },
              fav: true,
            ),
          ),

          const SizedBox(height: 80),

          // Logout Button
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: MyButton(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
              text: "logout",
            ),
          ),
          const SizedBox(height: 20),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: TextButton(
              onPressed: () async {
                await user?.delete();
              },
              child: const Text("Delete Account "),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
