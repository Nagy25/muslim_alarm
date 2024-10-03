import 'package:muslim_alarm/features/prayer_alarm/data/models/timings_model.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/entities/timings.dart';

extension TimingsExt on TimingsModel {
  Timings get toEntity => Timings(
      fajr: fajr,
      sunrise: sunrise,
      dhuhr: dhuhr,
      asr: asr,
      sunset: sunset,
      maghrib: maghrib,
      isha: isha,
      imsak: imsak,
      midnight: midnight,
      firstthird: firstthird,
      lastthird: lastthird);
}
