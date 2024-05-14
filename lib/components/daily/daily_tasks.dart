import 'package:dailythings/components/common/arrangements/flex_items.dart';
import 'package:dailythings/components/common/buttons/offset_full_button.dart';
import 'package:dailythings/components/common/popups/task_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyTasks extends ConsumerWidget {
  const DailyTasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FlexItems(widgetList: [
          OffsetFullButton(
              content: "Add a thing",
              fn: () {
                showDialog(
                    context: context, builder: (ctx) => TaskEntryPopup());
              }),
        ], space: 8),
      ),
    );
  }
}
