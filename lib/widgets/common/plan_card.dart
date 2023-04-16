import 'package:fitcel/constants.dart';
import 'package:fitcel/services/backend/celebs.dart';
import 'package:fitcel/pages/plan/plan_details.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PlanCard extends StatelessWidget {
  final Celebrity data;
  final bool? fav;
  const PlanCard({Key? key, required this.data, this.fav = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: prColor,
      surfaceTintColor: Colors.indigo[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              opaque: true,
              duration: const Duration(milliseconds: 500),
              isIos: true,
              type: PageTransitionType.rightToLeftWithFade,
              child: PlanDetails(celebId: data.id),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(data.avatar),
              fit: BoxFit.contain,
              alignment: Alignment.bottomRight,
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: const EdgeInsets.all(6.0),
            child: cardDetails(data, fav),
          ),
        ),
      ),
    );
  }

  Column cardDetails(Celebrity data, fav) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name of the Celebrity
        Text(data.name,
            style: TextStyle(
                color: Colors.black,
                fontSize: fav ? 30 : 20,
                fontWeight: FontWeight.bold)),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Diet type
            Text('Diet:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: fav ? 18 : 14,
                    fontWeight: FontWeight.w400)),
            Text(data.dietType,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: fav ? 20 : 14,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic)),
            const SizedBox(height: 10),

            // Workout type
            Text('Workout:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: fav ? 18 : 14,
                    fontWeight: FontWeight.w400)),

            // TODO: CHANGE THIS workoutType when available
            Text(data.dietType,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: fav ? 20 : 14,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic)),
          ],
        ),
      ],
    );
  }
}
