import 'package:dailythings/components/common/top_bar.dart';
import 'package:dailythings/components/home/home_reminders.dart';
import 'package:dailythings/components/home/home_top.dart';
import 'package:dailythings/components/home/periods_reminder.dart';
import 'package:dailythings/constants/images.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeInner extends ConsumerWidget {
  const HomeInner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar.large(
          title: Text(
            "DailyThings",
            style: TextStyles.subheading,
          ),
          stretch: true,
          floating: true,
          leading: const SizedBox.shrink(),
          backgroundColor: Colors.black,
          expandedHeight: size.height / 2.5,
          flexibleSpace: const TopBar(imgLink: DailyThingsImages.home),
        ),
        const HomeTop(
          key: Key("home inner"),
        ),
        const HomeReminders(),
        PeriodsReminder(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
          ),
        )
      ],
    );
  }
}
