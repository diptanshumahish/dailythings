import 'package:dailythings/state/onboard_Tabs/onboard_tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardTabsProvider =
    StateNotifierProvider<OnboardTabNotifier, OnboardTabSelector>(
        (ref) => OnboardTabNotifier(OnboardTabSelector(tab: 0)));
