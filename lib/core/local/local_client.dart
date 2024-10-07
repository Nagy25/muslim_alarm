abstract class LocalClient {
  Map<String, dynamic>? getJsonMap(String key);
  Future<bool> setJsonMap(String key, Map<String, dynamic> value);
}
