import 'package:dailythings/constants/theme.dart';
import 'package:dailythings/screens/entry/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const ProviderScope(child: DailyThings()));
}

class DailyThings extends StatelessWidget {
  const DailyThings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DailyThings',
        debugShowCheckedModeBanner: false,
        theme: DailyThingsTheme.theme,
        home: const SplashScreen());
  }
}
