import 'package:dartz/dartz.dart';
import 'package:muslim_alarm/core/failures/failure.dart';

abstract class CheckCacheRepository {
  Either<Failure, bool> checkCache();
}
