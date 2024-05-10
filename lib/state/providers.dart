import 'package:dailythings/state/Tabs/tabselector.model.dart';
import 'package:dailythings/state/onboard_Tabs/onboard_tabs.dart';
import 'package:dailythings/state/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardTabsProvider =
    StateNotifierProvider<OnboardTabNotifier, OnboardTabSelector>(
        (ref) => OnboardTabNotifier(OnboardTabSelector(tab: 0)));
final tabsProvider = StateNotifierProvider<TabNotifier, TabSelector>(
    (ref) => TabNotifier(TabSelector(tab: 0)));

final userProvider =
    StateNotifierProvider<UserNotifier, UserData>((ref) => UserNotifier());
