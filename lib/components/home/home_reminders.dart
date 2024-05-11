import 'package:dailythings/components/common/buttons/offset_full_button.dart';
import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeReminders extends StatelessWidget {
  const HomeReminders({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Animate(
        effects: const [ScaleEffect(curve: Curves.easeInOut)],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Important reminders",
                    style: TextStyles.heading,
                  ),
                  Icon(
                    Icons.event,
                    size: 15,
                    color: DailyThingsColors.tertiaryGray,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: DailyThingsColors.themeBeige.withOpacity(0.3)),
                    color: DailyThingsColors.backgroundColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Get my running task done now",
                            style: TextStyles.bodyNavbarActive,
                          ),
                          Text(
                            "12th July",
                            style: TextStyles.italic,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Jump off the roof",
                                style: TextStyles.bodyNavbarActive,
                              ),
                              Text(
                                "12th August",
                                style: TextStyles.italic,
                              )
                            ],
                          ),
                          // Divider(
                          //   color: Colors.white54,
                          // )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Find something cool for running and also a long text here which will overflow",
                                  style: TextStyles.bodyNavbarActive,
                                ),
                              ),
                              Text(
                                "12th August",
                                style: TextStyles.italic,
                              )
                            ],
                          ),
                          // Divider(
                          //   color: Colors.white54,
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
