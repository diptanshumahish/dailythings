import 'package:dailythings/components/common/bubble/response_bubble.dart';
import 'package:dailythings/components/common/bubble/zen_bubble.dart';
import 'package:dailythings/components/common/popups/warning_popup.dart';
import 'package:dailythings/constants/keys.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:dailythings/state/providers.dart';
import 'package:dailythings/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardGender extends ConsumerWidget {
  const OnboardGender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setGender(String type) async {
      await addToLocalStorage(DailyThingsKeys.userGenderKey, type);
      ref.read(onboardTabsProvider.notifier).updateTab(4);
    }

    return Column(
      children: [
        const ZenBubble(
            chat: "What's your gender?",
            isRightBubble: false,
            profileImageUrl: ""),
        const ZenBubble(
            del: 100,
            chat:
                "My creators told me that as of now they accept only male and female genders, other genders would be coming soon 🥺",
            isRightBubble: false,
            profileImageUrl: ""),
        ResponseBubble(
            del: 200,
            chat: "I'm a male 👦",
            isRightBubble: true,
            fn: () {
              setGender("M");
            }),
        ResponseBubble(
            del: 300,
            chat: "I'm a female 👧",
            isRightBubble: true,
            fn: () {
              setGender("F");
            }),
        ResponseBubble(
            del: 400,
            chat: "I'm none of these ☹️, what if I'm a walmart bag or a cat?",
            isRightBubble: true,
            fn: () {
              showDialog(
                context: context,
                barrierColor: Colors.black87,
                builder: (context) => const WarningPopup(
                    error:
                        "As of now we support only male and female genders, will add support for all other possible combinations soon :)"),
              );
            }),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Tap on the bubbles to go ahead, your gender will help zen provide you more accurate help in organizing stuff in better ways, trust me it will be worth it 🤗",
          style: TextStyles.body,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
