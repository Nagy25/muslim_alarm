import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/core/failures/failure.dart';
import 'package:muslim_alarm/core/failures/general_failure.dart';
import 'package:muslim_alarm/core/network/dio_api_client.dart';
import 'package:muslim_alarm/features/prayer_alarm/data/datasources/prayers_times_data_source.dart';
import 'package:muslim_alarm/features/prayer_alarm/data/mappers/timings.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/entities/timings.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/repositories/prayer_alarm_repository.dart';

class PrayerAlarmRepositoryImpl implements PrayerAlarmRepository {
  static final provider = Provider((ref) => PrayerAlarmRepositoryImpl(
        timingsDataSource: PrayersTimesDataSourceImpl(
            apiClient: ref.watch(DioApiClient.provider)),
      ));
  final PrayersTimesDataSource timingsDataSource;
  PrayerAlarmRepositoryImpl({required this.timingsDataSource});
  @override
  Future<Either<Failure, Timings>> getPrayerTimes(
      {required double lat, required double long}) async {
    try {
      final data = await timingsDataSource.getTimings(lat: lat, long: long);
      return Right(data.toEntity);
    } catch (e) {
      return Left(GeneralFailure());
    }
  }
}
