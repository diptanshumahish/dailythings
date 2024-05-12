import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JContainer extends StatelessWidget {
  final String dayKey;
  final String title;
  final String description;
  final String time;
  const JContainer({
    super.key,
    required this.dayKey,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: DailyThingsColors.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border:
              Border.all(color: DailyThingsColors.themeBeige.withOpacity(0.3))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.watch_later,
                  color: DailyThingsColors.tertiaryGray,
                  size: 12,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  DateFormat('hh:mm a').format(DateTime.parse(time)),
                  style: TextStyles.body,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.book_rounded,
                  color: DailyThingsColors.themeBeige,
                  size: 18,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.heading,
                ),
              ],
            ),
            Divider(
              color: DailyThingsColors.themeOrange.withOpacity(0.3),
              indent: 0,
              endIndent: 0,
            ),
            Text(
              description,
              style: TextStyles.body,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
