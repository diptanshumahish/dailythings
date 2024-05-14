import 'package:dailythings/constants/images.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';

class Congrats extends StatelessWidget {
  const Congrats({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(
              DailyThingsImages.zen,
              height: 150,
            ),
            Text(
              "Thanks for using dailyThings",
              style: TextStyles.heading,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "We are currently at a very beta stage, many more features are upcoming in the previous releases, stay tuned 😉. Meanwhile do test this app, and be sure to let us know about any issues you face, feedback and also suggestions for improvement",
              style: TextStyles.body,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
