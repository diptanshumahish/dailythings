import 'package:dailythings/components/common/arrangements/flex_items.dart';
import 'package:dailythings/components/settings/settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsItems extends ConsumerWidget {
  const SettingsItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: FlexItems(widgetList: [
          SettingsItem(
              fn: () {},
              title: "Delete all journals",
              details: "This will delete all journals permanently",
              icon: Icons.delete_forever),
          SettingsItem(
              fn: () {},
              title: "Delete all Daily Tasks",
              details: "This deletes all daily entries",
              icon: Icons.delete_forever)
        ], space: 8),
      ),
    );
  }
}
