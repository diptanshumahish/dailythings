import 'dart:ui';

import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';

class WriterScreen extends StatelessWidget {
  const WriterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DailyThingsColors.backgroundColor,
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            Icons.check,
            size: 15,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Animate(
                      effects: [FadeEffect()],
                      child: Text(
                        DateFormat("dd MMMM, y | hh:mm a")
                            .format(DateTime.now()),
                        style: TextStyles.bodyNavbarActive,
                      ),
                    ),
                    Divider(
                      color: Colors.white12,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Animate(
                      effects: [FadeEffect(delay: Duration(milliseconds: 100))],
                      child: TextField(
                        scrollPadding: EdgeInsets.zero,
                        autocorrect: false,
                        style: TextStyles.heading,
                        selectionWidthStyle: BoxWidthStyle.tight,
                        selectionHeightStyle: BoxHeightStyle.tight,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            labelText: "Your great title",
                            isCollapsed: true,
                            labelStyle: TextStyles.headingPlaceholder,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                    Animate(
                      effects: [FadeEffect(delay: Duration(milliseconds: 200))],
                      child: TextFormField(
                        selectionHeightStyle: BoxHeightStyle.tight,
                        scrollPadding: EdgeInsets.zero,
                        style: TextStyles.body,
                        keyboardType: TextInputType.multiline,
                        minLines: 2,
                        maxLines: 400,
                        selectionWidthStyle: BoxWidthStyle.tight,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          labelText: "pen down your thoughts",
                          labelStyle: TextStyles.body,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          isCollapsed: true,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
