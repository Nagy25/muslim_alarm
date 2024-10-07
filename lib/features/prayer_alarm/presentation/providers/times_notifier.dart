import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/services/location_service.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/usecases/get_prayer_times.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/value_objects/user_location.dart';
import 'package:muslim_alarm/features/prayer_alarm/presentation/states/times_state.dart';

class TimesNotifier extends StateNotifier<TimesState> {
  static final provider =
      StateNotifierProvider<TimesNotifier, TimesState>((ref) {
    return TimesNotifier(getPrayerTimes: ref.read(GetPrayerTimes.provider));
  });
  TimesNotifier({required this.getPrayerTimes}) : super(TimesState.initial());
  final GetPrayerTimes getPrayerTimes;

  final LocationService _locationService = LocationService();

  Future<void> fetch() async {
    state = TimesState.loading();
    final location = await _locationService.getCurrentPosition();
    final data = await getPrayerTimes.execute(
        userLocation: UserLocation(
            latitude: location.latitude, longitude: location.longitude));
    data.fold(
      (failure) => state = TimesState.failure(failure),
      (timings) => state = TimesState.success(timings),
    );
  }
}
