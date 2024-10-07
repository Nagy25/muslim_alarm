import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/core/local/local_client.dart';
import 'package:muslim_alarm/core/local/pref_client.dart';
import 'package:muslim_alarm/core/local/storage_keys.dart';
import 'package:muslim_alarm/features/prayer_alarm/data/models/timings_model.dart';

abstract class PrayersTimesCacheDataSource {
  TimingsModel? getPrayerTimes();
  Future<void> savePrayerTimes(TimingsModel timings);
}

class PrayersTimesCacheDataSourceImpl implements PrayersTimesCacheDataSource {
  static final provider = Provider((ref) {
    return PrayersTimesCacheDataSourceImpl(
        localClient: ref.watch(PrefClient.provider));
  });

  final LocalClient localClient;

  PrayersTimesCacheDataSourceImpl({required this.localClient});

  @override
  TimingsModel? getPrayerTimes() {
    final data = localClient.getJsonMap(StorageKeys.token);
    if (data == null) {
      return TimingsModel.fromJson(data!);
    }
    return null;
  }

  @override
  Future<void> savePrayerTimes(TimingsModel timings) async {
    await localClient.setJsonMap(StorageKeys.token, timings.toJson());
  }
}
