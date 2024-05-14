import 'package:dailythings/components/common/arrangements/flex_items.dart';
import 'package:dailythings/components/common/popups/warning_popup.dart';
import 'package:dailythings/components/settings/settings_item.dart';
import 'package:dailythings/components/settings/settings_seperator.dart';
import 'package:dailythings/screens/onbaord/onbaord_home.dart';
import 'package:dailythings/sqflite/journal/journal_db.dart';
import 'package:dailythings/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

class SettingsItems extends ConsumerWidget {
  const SettingsItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: FlexItems(widgetList: [
          //profile things
          const SettingsSeparator(name: "P R O F I L E", icon: Icons.person),
          SettingsItem(
              fn: () {
                ref.read(onboardTabsProvider.notifier).updateTab(0);
                ref.read(tabsProvider.notifier).updateTab(0);
                Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                        child: const OnBoardHome(
                          notFirstTimeDetails:
                              "Re-enter your details to update them ^^",
                          notFirstTimeTitle: "Modify your personal details",
                        ),
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.fade),
                    (route) => false);
              },
              title: "Change personal details",
              details: "This will allow you to change personal details",
              icon: Icons.person_3),

          const SizedBox(
            height: 10,
          ),
          //delete things
          const SettingsSeparator(
              name: "D A N G E R   Z O N E", icon: Icons.warning),
          SettingsItem(
              fn: () {
                showDialog(
                  context: context,
                  barrierColor: Colors.black87,
                  builder: (context) => WarningPopup(
                      fn: () {
                        JournalDB().deleteAll();
                      },
                      ctaText: "Go ahead delete",
                      icon: Icons.delete_forever_rounded,
                      errorHeading: "Are you sure of this?",
                      error:
                          "This will delete all your previous journals, everything till date, this action is not recoverable either. It might not be a good idea to do so I guess."),
                );
              },
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
