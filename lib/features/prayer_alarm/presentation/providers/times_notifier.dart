import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/services/location_service.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/usecases/get_prayer_times.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/value_objects/user_location.dart';
import 'package:muslim_alarm/features/prayer_alarm/presentation/states/times_state.dart';

class TimesNotifier extends StateNotifier<TimesState> {
  static final provider =
      StateNotifierProvider<TimesNotifier, TimesState>((ref) {
    final getPrayerTimes = ref.watch(GetPrayerTimes.provider);
    final locationService = LocationServiceImp();
    return TimesNotifier(
        getPrayerTimes: getPrayerTimes, locationService: locationService);
  });
  TimesNotifier({required this.getPrayerTimes, required this.locationService})
      : super(TimesState.initial());
  final GetPrayerTimes getPrayerTimes;

  final LocationService locationService;

  Future<void> fetch() async {
    state = TimesState.loading();
    final location = await locationService.getCurrentPosition();
    final data = await getPrayerTimes.execute(
        userLocation: UserLocation(
            latitude: location.latitude, longitude: location.longitude));
    data.fold(
      (failure) => state = TimesState.failure(failure),
      (timings) => state = TimesState.success(timings),
    );
  }
}
