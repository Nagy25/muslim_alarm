import 'package:dartz/dartz.dart';
import 'package:muslim_alarm/core/failures/failure.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/entities/timings.dart';

abstract class PrayerAlarmRepository {
  Future<Either<Failure, Timings>> getPrayerTimes(
      {required double lat, required double long});
}
