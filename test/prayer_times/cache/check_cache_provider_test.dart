import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:muslim_alarm/core/failures/general_failure.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/usecases/check_cache.dart';
import 'package:muslim_alarm/features/prayer_alarm/presentation/providers/check_cache_notifier.dart';

import 'check_cache_provider_test.mocks.dart';

class MockCheckCache extends Mock implements CheckCache {}

@GenerateMocks([MockCheckCache])
void main() {
  late MockCheckCache mockCheckCache;
  late ProviderContainer container;

  setUp(() {
    mockCheckCache = MockMockCheckCache();
    container = ProviderContainer(overrides: [
      CheckCacheProvider.provider.overrideWith(
        (_) => mockCheckCache.check().fold((l) => false, (value) => value),
      )
    ]);
  });

  tearDown(() {
    container.dispose();
  });

  test('should return true when cache is available', () {
    // Arrange
    when(mockCheckCache.check()).thenReturn(Right(true));

    // Act
    final result = container.read(CheckCacheProvider.provider);

    // Assert
    expect(result, true);
    verify(mockCheckCache.check()).called(1);
  });

  test('should return false when cache is not available', () {
    // Arrange
    when(mockCheckCache.check()).thenReturn(Left(GeneralFailure()));

    // Act
    final result = container.read(CheckCacheProvider.provider);

    // Assert
    expect(result, false);
    verify(mockCheckCache.check()).called(1);
  });
}
