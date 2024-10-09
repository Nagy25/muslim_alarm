import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:muslim_alarm/core/failures/failure.dart';
import 'package:muslim_alarm/core/failures/general_failure.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/entities/timings.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/repositories/prayer_alarm_repository.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/usecases/get_prayer_times.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/value_objects/user_location.dart';

import 'prayer_times_repository_test.mocks.dart';

void main() {
  late PrayerAlarmRepository prayerAlarmRepository;
  late GetPrayerTimes getPrayerTimes;

  setUp(() {
    prayerAlarmRepository = MockPrayerAlarmRepositoryTest();
    getPrayerTimes =
        GetPrayerTimes(prayerTimesRepository: prayerAlarmRepository);
  });

  test('test success getPrayerTimes', () async {
    final double lat = 0.0;
    final double long = 0.0;
    final UserLocation userLocation =
        UserLocation(latitude: lat, longitude: long);
    final Timings timings = Timings.empty();
    when(getPrayerTimes.execute(userLocation: userLocation))
        .thenAnswer((_) async => Right(timings));
    final result = await getPrayerTimes.execute(userLocation: userLocation);

    expect(result, Right(timings));
    verify(prayerAlarmRepository.getPrayerTimes(lat: 0.0, long: 0.0)).called(1);
  });

  test('should return failure when repository fails', () async {
    final UserLocation userLocation =
        UserLocation(latitude: 0.0, longitude: 0.0);
    final Failure failure = GeneralFailure();
    when(prayerAlarmRepository.getPrayerTimes(lat: 0.0, long: 0.0))
        .thenAnswer((_) async => Left(failure));

    final result = await getPrayerTimes.execute(userLocation: userLocation);

    expect(result, Left(failure));
    verify(prayerAlarmRepository.getPrayerTimes(lat: 0.0, long: 0.0)).called(1);
  });
}
