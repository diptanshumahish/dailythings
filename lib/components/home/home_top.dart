import 'package:dailythings/components/common/bubble/zen_bubble.dart';
import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:dailythings/state/providers.dart';
import 'package:dailythings/utils/greeting_service.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomeTop extends ConsumerWidget {
  const HomeTop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(userProvider);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today is, ",
              style: TextStyles.body,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: DailyThingsColors.themeOrange,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  DateFormat('d MMM, yyyy (EEEE)').format(DateTime.now()),
                  style: TextStyles.heading,
                ),
              ],
            ),
            Divider(
              color: Colors.white24,
            ),
            Text(
              "Heyo ^^",
              style: TextStyles.subheading,
            ),
            Text(
              "${userDetails.name ?? "buddy"},",
              style: TextStyles.splashHeading,
            ),
            Text(
              greetUser(TimeOfDay.now(), userDetails.gender ?? "M"),
              style: TextStyles.subheading,
            )
          ],
        ),
      ),
    );
  }
}
