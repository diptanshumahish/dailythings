import 'dart:ui';
import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

bool _isContentAvailable = false;
final TextEditingController _titleController = TextEditingController();
final TextEditingController _detailsController = TextEditingController();

class WriterScreen extends ConsumerStatefulWidget {
  final String id;
  const WriterScreen({super.key, required this.id});

  @override
  ConsumerState<WriterScreen> createState() => _WriterScreenState();
}

class _WriterScreenState extends ConsumerState<WriterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DailyThingsColors.backgroundColor,
      floatingActionButton: GestureDetector(
        onTap: () {
          if (!_isContentAvailable) {
            Navigator.pop(context);
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              _isContentAvailable ? Icons.check : Icons.close,
              size: 15,
            ),
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
                      effects: const [FadeEffect()],
                      child: Text(
                        DateFormat("dd MMMM, y | hh:mm a")
                            .format(DateTime.now()),
                        style: TextStyles.bodyNavbarActive,
                      ),
                    ),
                    const Divider(
                      color: Colors.white12,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Animate(
                      effects: const [
                        FadeEffect(delay: Duration(milliseconds: 100))
                      ],
                      child: TextField(
                        onChanged: (val) => {
                          if (val.isEmpty)
                            {
                              setState(() {
                                _isContentAvailable = false;
                              })
                            }
                          else
                            {
                              setState(() {
                                _isContentAvailable = true;
                              })
                            }
                        },
                        controller: _titleController,
                        scrollPadding: EdgeInsets.zero,
                        autocorrect: false,
                        style: TextStyles.heading,
                        selectionWidthStyle: BoxWidthStyle.tight,
                        selectionHeightStyle: BoxHeightStyle.tight,
                        maxLines: 2,
                        decoration: const InputDecoration(
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
                      effects: const [
                        FadeEffect(delay: Duration(milliseconds: 200))
                      ],
                      child: TextFormField(
                        controller: _detailsController,
                        selectionHeightStyle: BoxHeightStyle.tight,
                        scrollPadding: EdgeInsets.zero,
                        style: TextStyles.body,
                        keyboardType: TextInputType.multiline,
                        minLines: 2,
                        maxLines: 400,
                        selectionWidthStyle: BoxWidthStyle.tight,
                        decoration: const InputDecoration(
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
