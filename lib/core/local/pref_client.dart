import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_alarm/core/local/local_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefClient implements LocalClient {
  final SharedPreferences sharedPreferences;
  PrefClient({required this.sharedPreferences});

  static final provider = Provider<LocalClient>(
      throw UnimplementedError(' must override the provider in the main '));

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
}