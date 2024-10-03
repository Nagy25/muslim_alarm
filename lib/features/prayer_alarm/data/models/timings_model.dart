/*
{
"Fajr": "05:28",
"Sunrise": "06:55",
"Dhuhr": "12:49",
"Asr": "16:12",
"Sunset": "18:42",
"Maghrib": "18:42",
"Isha": "20:00",
"Imsak": "05:18",
"Midnight": "00:49",
"Firstthird": "22:47",
"Lastthird": "02:51"
}*/

import 'package:freezed_annotation/freezed_annotation.dart';

part 'timings_model.freezed.dart';
part 'timings_model.g.dart';

@freezed
class TimingsModel with _$TimingsModel {
  const factory TimingsModel({
    required String fajr,
    required String sunrise,
    required String dhuhr,
    required String asr,
    required String sunset,
    required String maghrib,
    required String isha,
    required String imsak,
    required String midnight,
    required String firstthird,
    required String lastthird,
  }) = _TimingsModel;

  factory TimingsModel.fromJson(Map<String, dynamic> json) =>
      _$TimingsModelFromJson(json);
}
