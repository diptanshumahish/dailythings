import 'package:dailythings/components/journal/j_calendar_view.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String _selectedId = "";

class JournalInner extends ConsumerStatefulWidget {
  const JournalInner({super.key});

  @override
  ConsumerState<JournalInner> createState() => _JournalInnerState();
}

class _JournalInnerState extends ConsumerState<JournalInner> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
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
                    "Write daily, all that's happening",
                    style: TextStyles.subheading,
                  )
                ],
              ),
            ),
          ),
          JCalendarView(
            selectedId: (data) => {
              setState(() {
                _selectedId = data;
              })
            },
          ),
          SliverToBoxAdapter(
            child: Text(
              _selectedId,
              style: TextStyles.body,
            ),
          )
        ],
      ),
    );
  }
}
