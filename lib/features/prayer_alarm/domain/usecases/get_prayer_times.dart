import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/core/failures/failure.dart';
import 'package:muslim_alarm/features/prayer_alarm/data/repositories/prayer_alarm_repository.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/entities/timings.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/repositories/prayer_alarm_repository.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/value_objects/user_location.dart';

class GetPrayerTimes {
  static final provider = Provider<GetPrayerTimes>((ref) => GetPrayerTimes(
        prayerTimesRepository: ref.watch(PrayerAlarmRepositoryImpl.provider),
      ));
  final PrayerAlarmRepository prayerTimesRepository;

  GetPrayerTimes({required this.prayerTimesRepository});

  Future<Either<Failure, Timings>> execute(
      {required UserLocation userLocation}) async {
    return prayerTimesRepository.getPrayerTimes(
        lat: userLocation.latitude, long: userLocation.longitude);
  }
}
