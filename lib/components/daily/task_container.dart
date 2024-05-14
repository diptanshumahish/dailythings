import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  final bool isComplete;
  const TaskContainer({super.key, required this.isComplete});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: isComplete
              ? DailyThingsColors.backgroundColor
              : DailyThingsColors.themeOrange,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isComplete
                  ? Colors.white
                  : DailyThingsColors.backgroundColor),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(2, 2),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Groceries",
              style:
                  !isComplete ? TextStyles.headingInvert : TextStyles.heading,
            ),
            Text(
              "Get some groceries",
              style: isComplete
                  ? TextStyles.bodyNavbarActive
                  : TextStyles.bodyInvert,
            ),
            Text(
              "To complete by 12:30pm",
              style: isComplete ? TextStyles.italic : TextStyles.italicInvert,
            )
          ],
        ),
      ),
    );
  }
}
