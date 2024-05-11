import 'package:dailythings/constants/colors.dart';
import 'package:dailythings/constants/text_styles.dart';
import 'package:flutter/material.dart';

class WriterScreen extends StatelessWidget {
  const WriterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DailyThingsColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "Write it down",
              style: TextStyles.subheading,
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                )),
            backgroundColor: Colors.black,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  TextField(
                    style: TextStyles.subheading,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        labelText: "Your great title",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                  Divider(
                    color: Colors.white30,
                  ),
                  TextFormField(
                    style: TextStyles.subheading,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        labelText: "There you go!",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
