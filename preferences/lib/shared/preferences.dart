import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? _preferences;
  static final Map<String, dynamic> _cache = {};
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static int? getInt(key) {
    return _cache[key] = _preferences!.getInt(key);
  }

  static setInt(key, value) {
    if (value == null) return;
    _cache[key] = value;
    _preferences!.setInt(key, value);
  }

  static double? getDouble(key) {
    return _cache[key] = _preferences!.getDouble(key);
  }

  static setDouble(key, value) {
    if (value == null) return;
    _cache[key] = value;
    _preferences!.setDouble(key, value);
  }

  static bool getBool(key) {
    return _cache[key] = _preferences!.getBool(key) ?? false;
  }

  static setBool(key, value) {
    if (value == null) return;
    _cache[key] = value;
    _preferences!.setBool(key, value);
  }

  static String? getString(key) {
    return _cache[key] = _preferences!.getString(key);
  }

  static setString(key, value) {
    if (value == null) return;
    _cache[key] = value;
    _preferences!.setString(key, value);
  }
}
