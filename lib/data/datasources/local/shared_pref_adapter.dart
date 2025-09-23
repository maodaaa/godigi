import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefAdapter {
  SharedPrefAdapter._();

  static final SharedPrefAdapter _instance = SharedPrefAdapter._();

  static SharedPrefAdapter get instance => _instance;

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  void _checkInit() {
    if (_prefs == null) {
      throw Exception('SharedPreferences has not been initialized. Please call init() first.');
    }
  }

  T? readData<T>(String key, {T? defaultValue}) {
    _checkInit();
    try {
      final value = _prefs!.get(key);
      if (value is T) {
        return value;
      }
      return defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  Future<bool> saveData<T>(String key, T value) async {
    _checkInit();
    try {
      if (value is String) {
        return await _prefs!.setString(key, value);
      } else if (value is int) {
        return await _prefs!.setInt(key, value);
      } else if (value is bool) {
        return await _prefs!.setBool(key, value);
      } else if (value is double) {
        return await _prefs!.setDouble(key, value);
      } else if (value is List<String>) {
        return await _prefs!.setStringList(key, value);
      } else {
        throw Exception('Unsupported data type: ${value.runtimeType}');
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeData(String key) async {
    _checkInit();
    try {
      return await _prefs!.remove(key);
    } catch (e) {
      return false;
    }
  }

  Future<bool> clearAllData() async {
    _checkInit();
    try {
      return await _prefs!.clear();
    } catch (e) {
      return false;
    }
  }

  bool containsKey(String key) {
    _checkInit();
    try {
      return _prefs!.containsKey(key);
    } catch (e) {
      return false;
    }
  }
}
