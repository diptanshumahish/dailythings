import 'package:dailythings/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeMain extends ConsumerStatefulWidget {
  const HomeMain({super.key});

  @override
  ConsumerState<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends ConsumerState<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DailyThingsColors.backgroundColor,
    );
  }
}
