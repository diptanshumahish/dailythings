import 'package:audioplayers/audioplayers.dart';
import 'package:dailythings/components/common/buttons/offset_full_button.dart';
import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/images.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WelcomeOnboardedUser extends StatefulWidget {
  const WelcomeOnboardedUser({super.key});

  @override
  State<WelcomeOnboardedUser> createState() => _WelcomeOnboardedUserState();
}

class _WelcomeOnboardedUserState extends State<WelcomeOnboardedUser> {
  playAudio() async {
    final player = AudioPlayer();

    try {
      player.setVolume(0.8);
      await player.play(AssetSource("audio/relax.mp3"));
    } catch (error) {
      if (kDebugMode) {
        print("Error playing audio: $error");
      }
    }
  }

  @override
  void initState() {
    playAudio();
    super.initState();
  }

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
                ).animate().fade(duration: const Duration(milliseconds: 1200)),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Breathe in",
                  style: TextStyles.splashHeading,
                ).animate().fade(duration: const Duration(milliseconds: 1300)),
                const Text(
                  "and out!",
                  style: TextStyles.heading,
                ).animate().fade(
                    delay: const Duration(seconds: 2),
                    duration: const Duration(seconds: 1)),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Let's go",
                  style: TextStyles.subheading,
                ).animate().fade(
                    delay: const Duration(seconds: 4),
                    duration: const Duration(seconds: 1)),
                const SizedBox(
                  height: 20,
                ),
                OffsetFullButton(
                  content: "Continue",
                  fn: () {},
                  icon: Icons.wb_twighlight,
                ).animate().fade(
                    delay: const Duration(seconds: 4),
                    duration: const Duration(seconds: 1))
              ],
            ),
          ),
        ));
  }
}
