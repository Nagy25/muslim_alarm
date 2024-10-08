import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/core/failures/failure.dart';
import 'package:muslim_alarm/core/failures/general_failure.dart';
import 'package:muslim_alarm/features/prayer_alarm/data/datasources/prayers_times_cache_data_source.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/repositories/check_cache_repository.dart';

class CheckCacheRepositoryImp implements CheckCacheRepository {
  static final provider = Provider<CheckCacheRepository>((ref) {
    final cacheDataSource = ref.watch(PrayersTimesCacheDataSourceImpl.provider);
    return CheckCacheRepositoryImp(cacheDataSource: cacheDataSource);
  });
  final PrayersTimesCacheDataSource cacheDataSource;

  CheckCacheRepositoryImp({required this.cacheDataSource});
  @override
  Either<Failure, bool> checkCache() {
    try {
      return Right(cacheDataSource.hasCache());
    } catch (e) {
      return Left(GeneralFailure());
    }
  }
}
