import 'package:dailythings/components/common/top_bar.dart';
import 'package:dailythings/components/settings/settings_items.dart';
import 'package:dailythings/components/settings/settings_top.dart';
import 'package:dailythings/constants/images.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsInner extends ConsumerWidget {
  const SettingsInner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: const Text(
            "DailyThings",
            style: TextStyles.subheading,
          ),
          stretch: true,
          floating: true,
          leading: const SizedBox.shrink(),
          backgroundColor: Colors.black,
          expandedHeight: size.height / 2.5,
          flexibleSpace: const TopBar(imgLink: DailyThingsImages.settings),
        ),
        const SettingsTop(),
        const SettingsItems(),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "You are using our version 0.0.1, this is one of our very first releases, we will be rolling out many more features soon ✨",
              style: TextStyles.italic,
            ),
          ),
        )
      ],
    );
  }
}
