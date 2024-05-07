import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/images.dart';
import 'package:dailythings/constants/keys.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:dailythings/screens/main/home.dart';
import 'package:dailythings/screens/onbaord/onbaord_home.dart';
import 'package:dailythings/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Future<int> initialCheck() async {
      String? check1 =
          await getDataFromLocalStorage(DailyThingsKeys.userNameKey);
      String? check2 =
          await getDataFromLocalStorage(DailyThingsKeys.userAgeKey);
      String? check3 =
          await getDataFromLocalStorage(DailyThingsKeys.userGenderKey);
      String? check4 =
          await getDataFromLocalStorage(DailyThingsKeys.userMartialStatus);
      if (check1 != null &&
          check2 != null &&
          check3 != null &&
          check4 != null) {
        return 1;
      }
      return 0;
    }

    return Scaffold(
      backgroundColor: DailyThingsColors.backgroundColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Animate(
                  effects: const [
                    SaturateEffect(duration: Duration(milliseconds: 800)),
                    FadeEffect(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOut)
                  ],
                  child: Image.asset(
                    DailyThingsImages.logo,
                    height: 90,
                  ),
                ),
                Animate(
                  delay: const Duration(milliseconds: 300),
                  effects: const [
                    ShimmerEffect(),
                    FadeEffect(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn),
                  ],
                  child: const Text(
                    "DailyThings",
                    style: TextStyles.splashHeading,
                  ),
                ),
                const Text(
                  "Everything you need in your life",
                  style: TextStyles.body,
                )
              ],
            ),
          ),
          Positioned(
              bottom: 90,
              child: SizedBox(
                width: size.width,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: DailyThingsColors.themeBeige,
                            borderRadius: BorderRadius.circular(50)),
                        child: GestureDetector(
                          onTap: () async {
                            // final int res = await initialCheck();
                            // if (res == 1) {
                            //   Navigator.pushAndRemoveUntil(
                            //       context,
                            //       PageTransition(
                            //           child: const HomeMain(),
                            //           curve: Curves.easeInOut,
                            //           duration:
                            //               const Duration(milliseconds: 500),
                            //           type: PageTransitionType.rightToLeft),
                            //       (route) => false);
                            //   return;
                            // }

                            Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                    child: const OnBoardHome(),
                                    curve: Curves.easeInOut,
                                    type: PageTransitionType.rightToLeft),
                                (route) => false);
                          },
                          child: Center(
                            child: Animate(effects: const [
                              FlipEffect(
                                delay: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                duration: Duration(milliseconds: 900),
                              )
                            ], child: const Icon(Icons.arrow_forward_outlined)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Version 0.0.1",
                        style: TextStyles.caption,
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
