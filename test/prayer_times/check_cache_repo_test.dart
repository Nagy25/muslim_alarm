import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/repositories/check_cache_repository.dart';

import 'check_cache_repo_test.mocks.dart';

// Create Mock for the CheckCacheRepository
class PrayerTimesCacheRepoTest extends Mock implements CheckCacheRepository {}

@GenerateMocks([PrayerTimesCacheRepoTest])
void main() {
  late PrayerTimesCacheRepoTest mockPrayerTimesCacheRepo;

  setUp(() async {
    // Initialize the mock repository
    mockPrayerTimesCacheRepo = MockPrayerTimesCacheRepoTest();
  });

  test('should return true when cache is available', () {
    // Arrange: Set the behavior before invoking the method
    when(mockPrayerTimesCacheRepo.checkCache()).thenReturn(true);

    // Act: Call the method after setting up the mock
    final result = mockPrayerTimesCacheRepo.checkCache();

    // Assert: Check that the result is true
    expect(result, true);
  });

  test('should return false when cache is not available', () {
    // Arrange: Mock the behavior to return false
    when(mockPrayerTimesCacheRepo.checkCache()).thenReturn(false);

    // Act: Call the method after the mock is defined
    final result = mockPrayerTimesCacheRepo.checkCache();

    // Assert: Check that the result is false
    expect(result, false);
  });
}
