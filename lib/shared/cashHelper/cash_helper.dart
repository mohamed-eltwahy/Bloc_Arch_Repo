import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static Future<String> getSavedString(String value, defaultVal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedValue = prefs.getString(value) ?? defaultVal;
    return savedValue;
  }

// Store String data
  static Future<bool> setSavedString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool savedValue = await prefs.setString(key, value);
    return savedValue;
  }

  static Future logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
