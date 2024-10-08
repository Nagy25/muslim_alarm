import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/entities/timings.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/repositories/prayer_alarm_repository.dart';

import 'prayer_times_repository_test.mocks.dart';

class PrayerAlarmRepositoryTest extends Mock implements PrayerAlarmRepository {}

@GenerateMocks([PrayerAlarmRepositoryTest])
void main() {
  late PrayerAlarmRepositoryTest mockPrayerAlarmRepositoryTest;

  setUp(() {
    mockPrayerAlarmRepositoryTest = MockPrayerAlarmRepositoryTest();
  });

  test('test getPrayerTimes', () async {
    final double lat = 0.0;
    final double long = 0.0;
    final Timings timings = Timings.empty();
    when(mockPrayerAlarmRepositoryTest.getPrayerTimes(lat: lat, long: long))
        .thenAnswer((_) async => Right(timings));

    final result = await mockPrayerAlarmRepositoryTest.getPrayerTimes(
        lat: lat, long: long);

    // Assert
    expect(result, Right(timings));
    verify(mockPrayerAlarmRepositoryTest.getPrayerTimes(lat: lat, long: long))
        .called(1);
  });
}
