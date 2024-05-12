import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';

class PreviousJournals extends StatelessWidget {
  final String selectedId;
  const PreviousJournals({super.key, required this.selectedId});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: selectedId.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(15.0),
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
            : Column());
  }
}
