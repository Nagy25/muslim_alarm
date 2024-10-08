import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/core/failures/failure.dart';
import 'package:muslim_alarm/features/prayer_alarm/data/repositories/check_cache_repository.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/repositories/check_cache_repository.dart';

class CheckCache {
  static final provider = Provider<CheckCache>((ref) => CheckCache(
        checkCacheRepository: ref.watch(CheckCacheRepositoryImp.provider),
      ));

  final CheckCacheRepository checkCacheRepository;
  CheckCache({required this.checkCacheRepository});

  Either<Failure, bool> check() {
    return checkCacheRepository.checkCache();
  }
}
