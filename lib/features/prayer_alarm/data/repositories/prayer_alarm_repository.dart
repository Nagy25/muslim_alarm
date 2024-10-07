import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/core/failures/failure.dart';
import 'package:muslim_alarm/core/failures/general_failure.dart';
import 'package:muslim_alarm/features/prayer_alarm/data/datasources/prayers_times_cache_data_source.dart';
import 'package:muslim_alarm/features/prayer_alarm/data/datasources/prayers_times_data_source.dart';
import 'package:muslim_alarm/features/prayer_alarm/data/mappers/timings.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/entities/timings.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/repositories/prayer_alarm_repository.dart';

class PrayerAlarmRepositoryImpl implements PrayerAlarmRepository {
  static final provider = Provider<PrayerAlarmRepository>((ref) {
    final cacheDataSource = ref.watch(PrayersTimesCacheDataSourceImpl.provider);
    final timingsDataSource = ref.watch(PrayersTimesDataSourceImpl.provider);
    return PrayerAlarmRepositoryImpl(
        timingsDataSource: timingsDataSource, cacheDataSource: cacheDataSource);
  });
  final PrayersTimesDataSource timingsDataSource;
  final PrayersTimesCacheDataSource cacheDataSource;
  PrayerAlarmRepositoryImpl(
      {required this.timingsDataSource, required this.cacheDataSource});
  @override
  Future<Either<Failure, Timings>> getPrayerTimes(
      {required double lat, required double long}) async {
    try {
      final cacheData = cacheDataSource.getPrayerTimes();

      if (cacheData != null) {
        return Right(cacheData.toEntity);
      }

      final data = await timingsDataSource.getTimings(lat: lat, long: long);
      return Right(data.toEntity);
    } catch (e) {
      return Left(GeneralFailure());
    }
  }
}
