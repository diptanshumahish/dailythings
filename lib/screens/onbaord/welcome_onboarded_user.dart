import 'package:audioplayers/audioplayers.dart';
import 'package:dailythings/components/common/buttons/offset_full_button.dart';
import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/images.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:dailythings/screens/main/home.dart';
import 'package:dailythings/state/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeOnboardedUser extends ConsumerStatefulWidget {
  const WelcomeOnboardedUser({super.key});

  @override
  ConsumerState<WelcomeOnboardedUser> createState() =>
      _WelcomeOnboardedUserState();
}

class _WelcomeOnboardedUserState extends ConsumerState<WelcomeOnboardedUser> {
  playAudio() async {
    final player = AudioPlayer();
    player.setAudioContext(AudioContext(
        android: const AudioContextAndroid(
            audioFocus: AndroidAudioFocus.none,
            audioMode: AndroidAudioMode.normal,
            contentType: AndroidContentType.sonification,
            usageType: AndroidUsageType.game)));

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
                  fn: () async {
                    await ref.read(userProvider.notifier).loadUserDetails();
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                            child: const HomeMain(),
                            type: PageTransitionType.fade),
                        (route) => false);
                  },
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
