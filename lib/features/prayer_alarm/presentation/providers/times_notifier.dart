import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/features/prayer_alarm/presentation/states/times_state.dart';

class TimesNotifier extends StateNotifier<TimesState> {
  TimesNotifier() : super(TimesState.initial());

  Future<void> fetch() async {}
}
