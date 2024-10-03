import 'package:dartz/dartz.dart';
import 'package:muslim_alarm/core/failures/failure.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/entities/timings.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/repositories/prayer_alarm_repository.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/value_objects/user_location.dart';

class GetPrayerTimes {
  final PrayerAlarmRepository prayerTimesRepository;

  GetPrayerTimes({required this.prayerTimesRepository});

  Future<Either<Failure, Timings>> call(
      {required UserLocation userLocation}) async {
    return prayerTimesRepository.getPrayerTimes(
        lat: userLocation.latitude, long: userLocation.longitude);
  }
}
