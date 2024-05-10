import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JournalInner extends ConsumerWidget {
  const JournalInner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            "Journal",
            style: TextStyles.heading,
          ),
        )
      ],
    );
  }
}
