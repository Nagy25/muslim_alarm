import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:muslim_alarm/core/failures/failure.dart';
import 'package:muslim_alarm/core/failures/general_failure.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/usecases/check_cache.dart';

import 'check_cache_repo_test.dart';
import 'check_cache_repo_test.mocks.dart';

void main() {
  late PrayerTimesCacheRepoTest prayerTimesCacheRepoTest;
  late CheckCache checkCache;

  setUp(() {
    prayerTimesCacheRepoTest = MockPrayerTimesCacheRepoTest();
    checkCache = CheckCache(checkCacheRepository: prayerTimesCacheRepoTest);
  });

  test('should return true', () {
    when(prayerTimesCacheRepoTest.checkCache()).thenAnswer((_) => Right(true));

    final result = checkCache.check();

    expect(result, Right(true));
    verify(prayerTimesCacheRepoTest.checkCache()).called(1);
  });

  test('should return fail ', () {
    when(prayerTimesCacheRepoTest.checkCache())
        .thenAnswer((_) => Left(GeneralFailure()));

    final result = checkCache.check();

    expect(result, isA<Left<Failure, bool>>());
    verify(prayerTimesCacheRepoTest.checkCache()).called(1);
  });
}
