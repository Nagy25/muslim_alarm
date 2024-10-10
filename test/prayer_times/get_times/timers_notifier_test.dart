import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:muslim_alarm/core/failures/general_failure.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/entities/timings.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/services/location_service.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/usecases/get_prayer_times.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/value_objects/user_location.dart';
import 'package:muslim_alarm/features/prayer_alarm/presentation/providers/times_notifier.dart';
import 'package:muslim_alarm/features/prayer_alarm/presentation/states/times_state.dart';

import 'timers_notifier_test.mocks.dart';

abstract class GetTimesTest extends Mock implements GetPrayerTimes {}

abstract class LocationServiceTest extends Mock implements LocationService {}

@GenerateMocks([GetTimesTest, LocationServiceTest])
void main() {
  late GetPrayerTimes getPrayerTimes;
  late ProviderContainer container;
  late LocationService locationService;

  setUp(() {
    getPrayerTimes = MockGetTimesTest();
    locationService = MockLocationServiceTest();
    container = ProviderContainer(overrides: [
      TimesNotifier.provider.overrideWith((_) => TimesNotifier(
          getPrayerTimes: getPrayerTimes, locationService: locationService))
    ]);
  });

  tearDown(() {
    container.dispose();
  });

  final double lat = 0.0;
  final double long = 0.0;
  final Position position = Position(
      latitude: lat,
      longitude: long,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      altitudeAccuracy: 0.0,
      heading: 0.0,
      headingAccuracy: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
      floor: null,
      isMocked: false);
  final UserLocation userLocation =
      UserLocation(latitude: lat, longitude: long);

  test('fetch', () async {
    final Timings timings = Timings.empty();

    when(locationService.getCurrentPosition())
        .thenAnswer((_) async => position);
    when(getPrayerTimes.execute(userLocation: userLocation))
        .thenAnswer((_) async => Right(timings));

    container.listen(
      TimesNotifier.provider,
      (previousState, newState) {
        // Assert the state changes
        if (newState.isLoading) {
        } else if (newState.isSuccess) {
          expect(newState.timings, timings);
        }
      },
      fireImmediately: true,
    );

    await container.read(TimesNotifier.provider.notifier).fetch();

    // Verify use case was called
    verify(getPrayerTimes.execute(userLocation: userLocation)).called(1);
  });

  test('fetch prayer times with failure', () async {
    final double lat = 0.0;
    final double long = 0.0;
    final UserLocation userLocation =
        UserLocation(latitude: lat, longitude: long);

    when(locationService.getCurrentPosition())
        .thenAnswer((_) async => position);
    final failure = GeneralFailure();

    // Mock failure use case call
    when(getPrayerTimes.execute(userLocation: userLocation))
        .thenAnswer((_) async => Left(failure));

    // Listen for state changes
    container.listen<TimesState>(
      TimesNotifier.provider,
      (previousState, newState) {
        if (newState.isFailure) {
          expect(newState.failure, failure);
        }
      },
      fireImmediately: true,
    );

    // Call fetch method
    await container.read(TimesNotifier.provider.notifier).fetch();

    // Verify use case was called
    verify(getPrayerTimes.execute(userLocation: userLocation)).called(1);
  });
}
