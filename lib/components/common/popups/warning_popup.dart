import 'package:dailythings/components/common/buttons/offset_full_button.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';

class WarningPopup extends StatelessWidget {
  final String error;
  const WarningPopup({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
                border: Border.all(color: Colors.white)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Umm there's an issue",
                        style: TextStyles.heading,
                      ),
                    ],
                  ),
                  Divider(),
                  Text(
                    error,
                    style: TextStyles.subheading,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OffsetFullButton(
                      icon: Icons.cancel_sharp,
                      content: "close",
                      fn: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
