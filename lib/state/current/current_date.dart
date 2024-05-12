import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentDate {
  final String id;

  CurrentDate({
    required this.id,
  });
}

class CurrentDateNotifier extends StateNotifier<CurrentDate> {
  CurrentDateNotifier(super.state);
  void updateID(String tabNo) {
    state = CurrentDate(id: tabNo);
  }
}
