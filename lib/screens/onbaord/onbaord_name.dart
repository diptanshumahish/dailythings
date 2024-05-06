import 'package:dailythings/components/common/bubble/response_bubble.dart';
import 'package:dailythings/components/common/bubble/zen_bubble.dart';
import 'package:dailythings/components/common/buttons/offset_full_button.dart';
import 'package:dailythings/components/common/popups/warning_popup.dart';
import 'package:dailythings/constants/keys.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:dailythings/state/providers.dart';
import 'package:dailythings/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final TextEditingController _nameController = TextEditingController();

class OnBoardName extends ConsumerWidget {
  const OnBoardName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ZenBubble(
            chat:
                "What name should I call you with? Maybe a cute nickname, or anything 🤗",
            isRightBubble: false,
            profileImageUrl: ""),
        ResponseBubble(
            del: 200,
            chat: "Well you can call me, umm 😬",
            isRightBubble: true,
            fn: () {}),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "I would like you to call me by the name,",
          style: TextStyles.subheading,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
              labelText: "Your name", labelStyle: TextStyles.subheading),
          style: TextStyles.heading,
        ),
        const SizedBox(
          height: 10,
        ),
        OffsetFullButton(
            content: "Go Ahead",
            fn: () async {
              if (_nameController.text.isEmpty) {
                showDialog(
                  context: context,
                  barrierColor: Colors.black87,
                  builder: (context) => const WarningPopup(
                      error:
                          "You haven't entered your name, To start we need a name 🥺, you can also enter your nicknames or any such things"),
                );
              } else {
                await addToLocalStorage(
                    DailyThingsKeys.userNameKey, _nameController.text);
                ref.read(onboardTabsProvider.notifier).updateTab(2);
              }
            })
      ],
    );
  }
}
