import 'package:flutter/material.dart';

class Timings {
  final TimeOfDay fajr;
  final TimeOfDay sunrise;
  final TimeOfDay dhuhr;
  final TimeOfDay asr;
  final TimeOfDay sunset;
  final TimeOfDay maghrib;
  final TimeOfDay isha;
  final TimeOfDay imsak;
  final TimeOfDay midnight;
  final TimeOfDay firstthird;
  final TimeOfDay lastthird;
  Timings(
      {required this.fajr,
      required this.sunrise,
      required this.dhuhr,
      required this.asr,
      required this.sunset,
      required this.maghrib,
      required this.isha,
      required this.imsak,
      required this.midnight,
      required this.firstthird,
      required this.lastthird});

  const Timings.empty()
      : fajr = const TimeOfDay(hour: 0, minute: 0),
        sunrise = const TimeOfDay(hour: 0, minute: 0),
        dhuhr = const TimeOfDay(hour: 0, minute: 0),
        asr = const TimeOfDay(hour: 0, minute: 0),
        sunset = const TimeOfDay(hour: 0, minute: 0),
        maghrib = const TimeOfDay(hour: 0, minute: 0),
        isha = const TimeOfDay(hour: 0, minute: 0),
        imsak = const TimeOfDay(hour: 0, minute: 0),
        midnight = const TimeOfDay(hour: 0, minute: 0),
        firstthird = const TimeOfDay(hour: 0, minute: 0),
        lastthird = const TimeOfDay(hour: 0, minute: 0);
}
