import 'package:dailythings/components/common/top_bar.dart';
import 'package:dailythings/components/daily/dailyTop.dart';
import 'package:dailythings/components/daily/daily_progress.dart';
import 'package:dailythings/components/daily/daily_tasks.dart';
import 'package:dailythings/components/daily/task_list.dart';
import 'package:dailythings/components/journal/j_calendar_view.dart';
import 'package:dailythings/constants/images.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyInner extends ConsumerWidget {
  const DailyInner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar.large(
          title: const Text(
            "Organize your life",
            style: TextStyles.subheading,
          ),
          stretch: true,
          floating: true,
          leading: const SizedBox.shrink(),
          backgroundColor: Colors.black,
          expandedHeight: size.height / 4.5,
          flexibleSpace: const TopBar(imgLink: DailyThingsImages.dailyPage),
        ),
        const DailyTop(),
        JCalendarView(selectedId: (data) {}),
        const DailyProgress(progress: 80),
        const DailyTasks(),
        const TaskList(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
          ),
        ),
      ],
    );
  }
}
