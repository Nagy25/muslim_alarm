import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/core/local/pref_client.dart';
import 'package:muslim_alarm/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  runApp(ProviderScope(overrides: [
    PrefClient.provider.overrideWithValue(
      PrefClient(sharedPreferences: await SharedPreferences.getInstance()),
    )
  ], child: const MyApp()));
}
