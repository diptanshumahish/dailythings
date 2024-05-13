import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsTop extends StatelessWidget {
  const SettingsTop({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyles.splashHeading,
            )
          ],
        ),
      ),
    );
  }
}
