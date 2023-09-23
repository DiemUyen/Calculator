import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences _pref;

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<bool> putString(String key, String value) async =>
      await _pref.setString(key, value);

  String? getString(String key) => _pref.getString(key);
}
