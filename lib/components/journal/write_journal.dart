import 'package:dailythings/components/common/buttons/offset_full_button.dart';
import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/images.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:dailythings/screens/writer/writer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';

class WriteJournal extends StatelessWidget {
  final String selectedId;
  const WriteJournal({super.key, required this.selectedId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Column(
          children: [
            Animate(
              effects: const [ScaleEffect()],
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(DailyThingsImages.write)),
            ),
            selectedId != ""
                ? Animate(
                    effects: const [FadeEffect()],
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Got something to say?",
                                style: TextStyles.headingInvert,
                              ),
                              const Text(
                                "Let those thoughts come out and lighten you",
                                style: TextStyles.subheadingDark,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              OffsetFullButton(
                                content: "pen it down",
                                fn: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: WriterScreen(
                                            id: selectedId,
                                          ),
                                          type:
                                              PageTransitionType.bottomToTop));
                                },
                                darkvariant: true,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Animate(
                    effects: const [
                      ScaleEffect(delay: Duration(milliseconds: 90))
                    ],
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: size.height / 4,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: DailyThingsColors.backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: DailyThingsColors.tertiaryGray
                                  .withOpacity(0.2))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              DailyThingsImages.cloud,
                              height: 80,
                            ),
                            const Text(
                              "Select a date 😬",
                              style: TextStyles.heading,
                            ),
                            const Text(
                              "and start penning down your thoughts ✨",
                              style: TextStyles.italic,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
