import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:muslim_alarm/features/prayer_alarm/data/models/timings_model.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/entities/timings.dart';

extension TimingsExt on TimingsModel {
  Timings get toEntity => Timings(
        fajr: TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(fajr)),
        sunrise: TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(sunrise)),
        dhuhr: TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(dhuhr)),
        asr: TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(asr)),
        maghrib: TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(maghrib)),
        isha: TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(isha)),
        imsak: TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(imsak)),
        midnight: TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(midnight)),
        firstthird:
            TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(firstthird)),
        lastthird: TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(lastthird)),
        sunset: TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(sunset)),
      );
}
