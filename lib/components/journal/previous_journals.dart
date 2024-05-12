import 'package:dailythings/components/common/arrangements/flex_items.dart';
import 'package:dailythings/components/journal/j_container.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:dailythings/sqflite/journal/journal_db.dart';
import 'package:dailythings/sqflite/models/journal_model.dart';
import 'package:dailythings/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<JournalEntry> _journalList = [];

class PreviousJournals extends ConsumerStatefulWidget {
  final String selectedId;
  const PreviousJournals({super.key, required this.selectedId});

  @override
  ConsumerState<PreviousJournals> createState() => _PreviousJournalsState();
}

class _PreviousJournalsState extends ConsumerState<PreviousJournals> {
  fetchJournal(String id) async {
    if (id.isEmpty) return;

    final jb = await JournalDB().fetchJournal(id);
    setState(() {
      _journalList = jb;
    });
  }

  @override
  void initState() {
    fetchJournal(widget.selectedId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final idHere = ref.watch(selectedDateProvider);
    fetchJournal(idHere.id);

    return SliverToBoxAdapter(
        child: widget.selectedId.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      "select a date to view journals",
                      style: TextStyles.subheading,
                    ),
                    Text(
                      "more journals = less bad stuff?",
                      style: TextStyles.italic,
                    )
                  ],
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: FlexItems(widgetList: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Available journals",
                        style: TextStyles.subheading,
                      ),
                      Text(
                        "tap on the journals to read them",
                        style: TextStyles.body,
                      )
                    ],
                  ),
                  _journalList.isNotEmpty
                      ? AnimatedSwitcher(
                          switchInCurve: Curves.easeInOut,
                          switchOutCurve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 400),
                          transitionBuilder: (child, animation) {
                            final animationOffset = animation.drive(Tween(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ));
                            return SlideTransition(
                              position: animationOffset,
                              child: FadeTransition(
                                  opacity: animation, child: child),
                            );
                          },
                          child: Animate(
                            effects: [const FadeEffect()],
                            child: FlexItems(
                                widgetList: _journalList
                                    .map((e) => JContainer(
                                        dayKey: e.dayKey,
                                        title: e.title,
                                        description: e.description,
                                        time: e.createdTime))
                                    .toList(),
                                space: 10),
                          ))
                      : const SizedBox.shrink(),
                  const Text(
                    "We intentionally don't allow you to modify your previous journals, made a mistake? let it be- journals are never meant to be perfect 😉",
                    style: TextStyles.caption,
                    textAlign: TextAlign.center,
                  )
                ], space: 20),
              ));
  }
}
