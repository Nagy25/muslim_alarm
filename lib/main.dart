import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/core/local/pref_client.dart';
import 'package:muslim_alarm/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(overrides: [
    PrefClient.provider.overrideWith(
      (_) => PrefClient(sharedPreferences: sharedPreferences),
    )
  ], child: const MyApp()));
}
