import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/core/local/local_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefClient implements LocalClient {
  final SharedPreferences sharedPreferences;
  PrefClient({required this.sharedPreferences});

  // This provider should be defined correctly to allow overriding
  static final provider = Provider<LocalClient>((ref) {
    throw UnimplementedError('Must override the provider in the main.');
  });
  static overrideProvider(SharedPreferences sharedPreferences) => provider
      .overrideWith((_) => PrefClient(sharedPreferences: sharedPreferences));

  @override
  Map<String, dynamic>? getJsonMap(String key) {
    final data = sharedPreferences.getString(key);
    if (data == null) {
      return null;
    }
    return Map<String, dynamic>.from(jsonDecode(data));
  }

  @override
  Future<bool> setJsonMap(String key, Map<String, dynamic> value) {
    return sharedPreferences.setString(key, jsonEncode(value));
  }

  @override
  bool hasKey(String key) {
    return sharedPreferences.containsKey(key);
  }
}
