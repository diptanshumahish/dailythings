import 'package:dailythings/components/common/buttons/offset_full_button.dart';
import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/images.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WelcomeOnboardedUser extends StatefulWidget {
  const WelcomeOnboardedUser({super.key});

  @override
  State<WelcomeOnboardedUser> createState() => _WelcomeOnboardedUserState();
}

class _WelcomeOnboardedUserState extends State<WelcomeOnboardedUser> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: DailyThingsColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  DailyThingsImages.breathe,
                  height: 190,
                ).animate().fade(duration: Duration(milliseconds: 1200)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Breathe in",
                  style: TextStyles.splashHeading,
                ).animate().fade(duration: Duration(milliseconds: 1300)).hide(
                    duration: Duration(milliseconds: 1000),
                    delay: Duration(seconds: 2)),
                Text(
                  "and out!",
                  style: TextStyles.heading,
                )
                    .animate()
                    .fade(
                        delay: Duration(seconds: 2),
                        duration: Duration(seconds: 1))
                    .hide(
                        delay: Duration(seconds: 4),
                        duration: Duration(seconds: 1)),
                Text(
                  "Let's go",
                  style: TextStyles.subheading,
                ).animate().fade(
                    delay: Duration(seconds: 4),
                    duration: Duration(seconds: 1)),
                SizedBox(
                  height: 20,
                ),
                OffsetFullButton(
                  content: "Continue",
                  fn: () {},
                  icon: Icons.wb_twighlight,
                ).animate().fade(
                    delay: Duration(seconds: 4), duration: Duration(seconds: 1))
              ],
            ),
          ),
        ));
  }
}
