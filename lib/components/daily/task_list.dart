import 'package:dailythings/components/common/arrangements/flex_items.dart';
import 'package:dailythings/components/daily/task_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FlexItems(widgetList: [
          TaskContainer(
            isComplete: false,
          ),
          TaskContainer(
            isComplete: true,
          )
        ], space: 8),
      ),
    );
  }
}
