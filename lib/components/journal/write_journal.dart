import 'package:dailythings/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WriteJournal extends StatelessWidget {
  const WriteJournal({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Column(
          children: [
            Animate(
              effects: const [ScaleEffect()],
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(DailyThingsImages.write)),
            ),
          ],
        ),
      ),
    );
  }
}
