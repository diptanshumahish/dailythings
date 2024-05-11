import 'package:dailythings/components/journal/j_calendar_view.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JournalInner extends ConsumerWidget {
  const JournalInner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your personal journal",
                    style: TextStyles.splashHeading,
                  ),
                  Text(
                    "Write daily, one year at a time 😎",
                    style: TextStyles.subheading,
                  )
                ],
              ),
            ),
          ),
          JCalendarView()
        ],
      ),
    );
  }
}
