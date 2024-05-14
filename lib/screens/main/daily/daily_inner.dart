import 'package:dailythings/components/common/top_bar.dart';
import 'package:dailythings/components/daily/dailyTop.dart';
import 'package:dailythings/components/daily/daily_progress.dart';
import 'package:dailythings/components/daily/daily_tasks.dart';
import 'package:dailythings/components/daily/task_list.dart';
import 'package:dailythings/components/journal/j_calendar_view.dart';
import 'package:dailythings/constants/images.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:dailythings/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

double _progress = 0;

class DailyInner extends ConsumerStatefulWidget {
  const DailyInner({super.key});

  @override
  ConsumerState<DailyInner> createState() => _DailyInnerState();
}

class _DailyInnerState extends ConsumerState<DailyInner> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final selectedDate = ref.watch(selectedDateProvider);
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
        DailyProgress(progress: _progress),
        const DailyTasks(),
        TaskList(
          selectedDate: selectedDate.id,
          progress: (data) {
            setState(() {
              _progress = data;
            });
          },
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
          ),
        ),
      ],
    );
  }
}
