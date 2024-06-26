import 'package:dailythings/components/home/reminder_item.dart';
import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:dailythings/sqflite/daily/daily_db.dart';
import 'package:dailythings/sqflite/models/daily_task_entry.dart';
import 'package:dailythings/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<DailyTaskEntry> _taskList = [];

class HomeReminders extends ConsumerStatefulWidget {
  final String id;
  const HomeReminders({super.key, required this.id});

  @override
  ConsumerState<HomeReminders> createState() => _HomeRemindersState();
}

class _HomeRemindersState extends ConsumerState<HomeReminders> {
  fetchTasks(String id) async {
    if (id.isEmpty) return;

    final jb = await DailyDB().fetchTasks(id);
    setState(() {
      _taskList = jb;
    });
  }

  @override
  void initState() {
    fetchTasks(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(currentDateProvider, (previous, next) {
      if (previous != null) {
        fetchTasks(previous.id);
      } else {
        fetchTasks(next.id);
      }
    });

    return SliverToBoxAdapter(
      child: Animate(
        effects: const [ScaleEffect(curve: Curves.easeInOut)],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Important reminders",
                    style: TextStyles.heading,
                  ),
                  Icon(
                    Icons.event,
                    size: 15,
                    color: DailyThingsColors.tertiaryGray,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: DailyThingsColors.themeBeige.withOpacity(0.3)),
                    color: DailyThingsColors.backgroundColor,
                    borderRadius: BorderRadius.circular(5)),
                child: _taskList.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _taskList
                            .map((e) => ReminderItem(
                                completionTime: e.completionTime,
                                desc: e.description))
                            .toList(),
                      )
                    : const Center(
                        child: Text(
                          "No reminders for today, set a few from the daily tab✨",
                          style: TextStyles.body,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
