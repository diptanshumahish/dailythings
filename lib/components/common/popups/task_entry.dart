import 'dart:ui';

import 'package:dailythings/components/common/arrangements/flex_items.dart';
import 'package:dailythings/components/common/buttons/offset_full_button.dart';
import 'package:dailythings/components/common/textfiels/common_input.dart';
import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final TextEditingController _titleController = TextEditingController();

class TaskEntryPopup extends StatelessWidget {
  const TaskEntryPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: DailyThingsColors.tertiaryGray,
                        offset: Offset(2, 2),
                        blurRadius: 0,
                        spreadRadius: 0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                    border: Border.all(color: Colors.white)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FlexItems(widgetList: [
                    const Text(
                      "Enter a new task",
                      style: TextStyles.heading,
                    ),
                    const Text(
                      "Add your task for the day below, make sure to add your completion time as well",
                      style: TextStyles.body,
                    ),
                    CommonInput(
                      controller: _titleController,
                      labelText: "Your task title here",
                      icon: Icons.check,
                    ),
                    CommonInput(
                      controller: _titleController,
                      labelText: "Your task description here",
                      icon: Icons.data_array,
                    ),
                    CommonInput(
                      controller: _titleController,
                      labelText: "Your task category",
                      icon: Icons.workspaces_outline,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "task completion deadline",
                          style: TextStyles.bodyNavbarActive,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              showPicker(
                                backgroundColor:
                                    DailyThingsColors.backgroundColor,
                                accentColor: DailyThingsColors.themeOrange,
                                cancelStyle: TextStyles.subheading,
                                okStyle: TextStyles.subheading,
                                okText: "Let's go",
                                context: context,
                                value: Time(
                                    hour: DateTime.now().hour,
                                    minute: DateTime.now().minute),
                                sunrise: const TimeOfDay(hour: 6, minute: 0),
                                sunset: const TimeOfDay(hour: 18, minute: 0),
                                duskSpanInMinutes: 120,
                                onChange: (Time t) async {
                                  print(t.format(context));
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: DailyThingsColors.themeBeige
                                        .withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(4),
                                color: DailyThingsColors.themeBeige
                                    .withOpacity(0.2)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              child: Text(
                                "Choose",
                                style: TextStyles.subheading,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    OffsetFullButton(content: "Add it", fn: () {}),
                    OffsetFullButton(
                      content: "Cancel",
                      fn: () {
                        Navigator.pop(context);
                      },
                      darkvariant: true,
                    )
                  ], space: 10),
                )),
          ),
        ),
      ),
    );
  }
}
